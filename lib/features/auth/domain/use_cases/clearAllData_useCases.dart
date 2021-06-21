import 'package:flutter_example05/core/use_cases/use_case.dart';
import 'package:flutter_example05/features/auth/domain/repositories/local_storage_repository.dart';

class ClearAllDataUseCase implements UseCaseNullSafe<void, NoParams> {

  final LocalRepository localRepository;
  ClearAllDataUseCase(this.localRepository);

  @override
  Future<void> call(NoParams params) async {
    return await localRepository.clearAllData();
  }

}