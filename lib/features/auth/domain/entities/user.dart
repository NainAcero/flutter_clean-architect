
import 'package:equatable/equatable.dart';

class User extends Equatable{
  const User({
    required this.nombre,
    required this.apellido,
    required this.correo,
  });

  final String nombre;
  final String apellido;
  final String correo;

  @override
  List<Object> get props => [
    nombre, apellido, correo
  ];
}