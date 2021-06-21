
import 'package:flutter_example05/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _pref_token = 'TOKEN';
const _pref_apellido = 'APELLIDO';
const _pref_nombre = 'NOMBRE';
const _pref_correo = 'CORREO';

abstract class LocalDataSource {
  Future<String?> getToken();
  Future<void> clearAllData();
  Future<UserModel> saveUser(UserModel user);
  Future<String?> saveToken(String token);
  Future<UserModel> getUser();
}

class LocalDataSourceImpl implements LocalDataSource {

  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_token);
  }

  @override
  Future<UserModel> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final nombre = sharedPreferences.getString(_pref_nombre);
    final apellido = sharedPreferences.getString(_pref_apellido);
    final correo = sharedPreferences.getString(_pref_correo);

    final user = UserModel(
      nombre: nombre?? "",
      apellido: apellido?? "",
      correo: correo?? "",
    );

    return user;
  }

  @override
  Future<String?> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token);
    return token;
  }

  @override
  Future<UserModel> saveUser(UserModel user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_nombre, user.nombre);
    sharedPreferences.setString(_pref_apellido, user.apellido);
    sharedPreferences.setString(_pref_correo, user.correo);
    return user;
  }

}
