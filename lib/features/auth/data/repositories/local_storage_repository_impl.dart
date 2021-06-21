import 'package:flutter_example05/features/auth/data/data_sources/local_data_source.dart';
import 'package:flutter_example05/features/auth/data/models/user_model.dart';
import 'package:flutter_example05/features/auth/domain/entities/user.dart';
import 'package:flutter_example05/features/auth/domain/repositories/local_storage_repository.dart';

class LocalRepositoryImpl implements LocalRepository {

  LocalDataSource localDataSource;

  LocalRepositoryImpl({
    required this.localDataSource
  });
  
  @override
  Future<void> clearAllData() async{
    return await localDataSource.clearAllData();
  }

  @override
  Future<String?> getToken() async{
    return await localDataSource.getToken();
  }

  @override
  Future<User> getUser() async {
    return await localDataSource.getUser();
  }

  @override
  Future<String?> saveToken(String token) async{
    return await localDataSource.saveToken(token);
  }
  
  @override
  Future<User> saveUser(User user) async{
    return await localDataSource.saveUser(UserModel(
      nombre: user.nombre,
      apellido: user.apellido,
      correo: user.correo
    ));
  }

}