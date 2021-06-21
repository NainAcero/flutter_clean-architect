
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_example05/core/error/failures.dart';

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseNullSafe<Type, Params> {
  Future<Type> call(Params params);
}

