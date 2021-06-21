import 'package:equatable/equatable.dart';
import 'package:flutter_example05/core/use_cases/use_case.dart';
import 'package:flutter_example05/features/auth/domain/entities/user.dart';
import 'package:flutter_example05/features/auth/domain/repositories/local_storage_repository.dart';

class ParamsUser extends Equatable {

  final User user;

  ParamsUser({
    required this.user
  });

  @override
  List<Object> get props => [user];
}

class SaveUserUseCase implements UseCaseNullSafe<User, ParamsUser> {

  final LocalRepository localRepository;
  SaveUserUseCase(this.localRepository);

  @override
  Future<User> call(ParamsUser params) async {
    return await localRepository.saveUser(params.user);
  }

}