import 'package:equatable/equatable.dart';
import 'package:flutter_example05/features/auth/domain/entities/auth.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthState extends Equatable {

  @override
  List<Object> get props => [];
}

class Initial extends AuthState {}

class Loading extends AuthState {}

class Loaded extends AuthState {
  final Auth auth;

  Loaded({ required this.auth});

  @override
  List<Object> get props => [auth];
}

class Error extends AuthState {
  final String message;

  Error({ required this.message});

  @override
  List<Object> get props => [message];
}

