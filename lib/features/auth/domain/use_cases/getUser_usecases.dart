import 'package:flutter_example05/core/use_cases/use_case.dart';
import 'package:flutter_example05/features/auth/domain/entities/user.dart';
import 'package:flutter_example05/features/auth/domain/repositories/local_storage_repository.dart';

class GetUserUseCase implements UseCaseNullSafe<User, NoParams> {

  final LocalRepository localRepository;
  GetUserUseCase(this.localRepository);

  @override
  Future<User> call(NoParams params) async {
    return await localRepository.getUser();
  }

}