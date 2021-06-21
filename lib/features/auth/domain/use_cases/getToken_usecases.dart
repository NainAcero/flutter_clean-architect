import 'package:flutter_example05/core/use_cases/use_case.dart';
import 'package:flutter_example05/features/auth/domain/repositories/local_storage_repository.dart';

class GetTokenUseCase implements UseCaseNullSafe<String?, NoParams> {

  final LocalRepository localRepository;
  GetTokenUseCase(this.localRepository);

  @override
  Future<String?> call(NoParams params) async{
    return await localRepository.getToken();
  }
}