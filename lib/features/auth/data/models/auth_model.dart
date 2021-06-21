import 'package:flutter_example05/features/auth/domain/entities/auth.dart';

class AuthModel extends Auth {

  AuthModel({
    required String access_token,
    required String token_type,
    required String refresh_token,
    required int expires_in,
    required String scope,
    required String apellido,
    required String correo,
    required String nombre,
    required String jti
  }): super(
    access_token: access_token,
    token_type: token_type,
    refresh_token: refresh_token,
    expires_in: expires_in,
    scope: scope,
    apellido: apellido,
    correo: correo,
    nombre: nombre,
    jti: jti,
  );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      access_token: json['access_token'],
      token_type: json['token_type'],
      refresh_token: json['refresh_token'],
      expires_in: (json['expires_in'] as num).toInt(),
      scope: json['scope'],
      apellido: json['apellido'],
      correo: json['correo'],
      nombre: json['nombre'],
      jti: json['jti'],
    );
  }
}
