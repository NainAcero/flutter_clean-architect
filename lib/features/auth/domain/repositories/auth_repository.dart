
import 'package:dartz/dartz.dart';
import 'package:flutter_example05/core/error/failures.dart';
import 'package:flutter_example05/features/auth/domain/entities/auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, Auth>> authLogin(String username, String password); 

}