import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String access_token;
  final String token_type;
  final String refresh_token;
  final int expires_in;
  final String scope;
  final String apellido;
  final String correo;
  final String nombre;
  final String jti;

  Auth({
    required this.access_token, 
    required this.token_type, 
    required this.refresh_token, 
    required this.expires_in, 
    required this.scope, 
    required this.apellido, 
    required this.correo, 
    required this.nombre, 
    required this.jti
  });

  @override
  List<Object> get props => [
    access_token,
    token_type,
    refresh_token,
    expires_in,
    scope,
    apellido,
    correo,
    nombre,
    jti
  ];
}