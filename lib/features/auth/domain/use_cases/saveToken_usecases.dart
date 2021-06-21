import 'package:equatable/equatable.dart';
import 'package:flutter_example05/core/use_cases/use_case.dart';
import 'package:flutter_example05/features/auth/domain/entities/user.dart';
import 'package:flutter_example05/features/auth/domain/repositories/local_storage_repository.dart';

class ParamsToken extends Equatable {

  final String token;

  ParamsToken({
    required this.token
  });

  @override
  List<Object> get props => [token];
}

class SaveTokenUseCase implements UseCaseNullSafe<String?, ParamsToken> {

  final LocalRepository localRepository;
  SaveTokenUseCase(this.localRepository);

  @override
  Future<String?> call(ParamsToken params) async {
    return await localRepository.saveToken(params.token);
  }

}