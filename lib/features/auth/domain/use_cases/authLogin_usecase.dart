
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_example05/core/error/failures.dart';
import 'package:flutter_example05/core/use_cases/use_case.dart';
import 'package:flutter_example05/features/auth/domain/entities/auth.dart';
import 'package:flutter_example05/features/auth/domain/repositories/auth_repository.dart';

class Params extends Equatable {

  final String username;
  final String password;

  Params({
    required this.username, 
    required this.password
  });

  @override
  List<Object> get props => [username, password];
}

class AuthLoginUseCase implements UseCase<Auth, Params> {

  final AuthRepository authRepository;
  AuthLoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, Auth>> call(Params params) async {
    return await authRepository.authLogin(params.username, params.password);
  }
}