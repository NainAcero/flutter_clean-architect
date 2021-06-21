
import 'package:flutter_example05/core/error/exceptions.dart';
import 'package:flutter_example05/core/network/network_info.dart';
import 'package:flutter_example05/features/auth/data/data_sources/auth_data_source.dart';
import 'package:flutter_example05/features/auth/data/models/auth_model.dart';
import 'package:flutter_example05/features/auth/domain/entities/auth.dart';
import 'package:flutter_example05/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_example05/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  AuthDataSource authDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authDataSource, 
    required this.networkInfo
  });

  @override
  Future<Either<Failure, Auth>> authLogin(String username, String password) async {
    if(await networkInfo.isConnected) {
      try {
        final AuthModel authModel = await authDataSource.authLogin(username, password);
        return Right(authModel);
      } on ServerExpection {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

}