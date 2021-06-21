import 'package:flutter_example05/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String nombre,
    required String apellido,
    required String correo
  }): super(
    nombre: nombre,
    apellido: apellido,
    correo: correo
  ); 

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      nombre: json['nombre'],
      apellido: json['apellido'],
      correo: json['correo'],
    );
  }
}