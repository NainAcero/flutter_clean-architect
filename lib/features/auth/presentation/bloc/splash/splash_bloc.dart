
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example05/core/use_cases/use_case.dart';
import 'package:flutter_example05/features/auth/domain/use_cases/getToken_usecases.dart';
import 'package:flutter_example05/features/auth/presentation/bloc/splash/splash_event.dart';
import 'package:flutter_example05/features/auth/presentation/bloc/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  final GetTokenUseCase getTokenUseCase;

  SplashBloc({required this.getTokenUseCase}) : super(Initial());

  @override
  SplashState get initialState => Initial();

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async*{
    if(event is VerifyToken){
      final token = await getTokenUseCase.call(NoParams());
      if(token == null ) yield Error(message: "NO FOUND TOKEN");
      
      yield Loaded(token: token!);
    }
  }

}