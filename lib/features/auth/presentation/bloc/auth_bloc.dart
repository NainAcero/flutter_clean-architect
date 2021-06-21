
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example05/core/error/failures.dart';
import 'package:flutter_example05/core/use_cases/use_case.dart';
import 'package:flutter_example05/features/auth/domain/entities/auth.dart';
import 'package:flutter_example05/features/auth/domain/entities/user.dart';
import 'package:flutter_example05/features/auth/domain/use_cases/authLogin_usecase.dart';
import 'package:flutter_example05/features/auth/domain/use_cases/clearAllData_useCases.dart';
import 'package:flutter_example05/features/auth/domain/use_cases/saveToken_usecases.dart';
import 'package:flutter_example05/features/auth/domain/use_cases/saveUser_usecases.dart';
import 'package:flutter_example05/features/auth/presentation/bloc/bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server failure.';
const String NETWORK_FAILURE_MESSAGE = 'Networking failure.';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AuthLoginUseCase authLoginUseCase;
  final SaveTokenUseCase saveTokenUseCase;
  final SaveUserUseCase saveUserUseCase;
  final ClearAllDataUseCase clearAllDataUseCase;

  AuthBloc({
    required this.authLoginUseCase,
    required this.saveTokenUseCase,
    required this.saveUserUseCase,
    required this.clearAllDataUseCase,
  })  : super(Initial());

  @override
  AuthState get initialState => Initial();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async*{
    if(event is SignIn){
      yield Loading();

      final failureOrAuth = await authLoginUseCase.call(
        Params(username: event.username, password: event.password)
      );

      yield* _loadedOrErrorState(failureOrAuth);
    }
  }

  Stream<AuthState> _loadedOrErrorState(
    Either<Failure, Auth> failureOrAuth,
  ) async* {
    yield await failureOrAuth.fold(
      (failure) => Error(
        message: _mapFailureToMessage(failure),
      ),
      (auth) async {
        await clearAllDataUseCase.call(NoParams());
        await saveTokenUseCase.call(ParamsToken(token: auth.access_token));
        await saveUserUseCase.call(ParamsUser(user: User(nombre: auth.nombre, apellido: auth.apellido, correo: auth.correo)));
        return Loaded(auth: auth);
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case NetworkFailure:
        return NETWORK_FAILURE_MESSAGE;
      default:
        return 'Unexpected error.';
    }
  }

}