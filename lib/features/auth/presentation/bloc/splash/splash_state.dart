import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SplashState extends Equatable {

  @override
  List<Object> get props => [];
}

class Initial extends SplashState {}

class Loaded extends SplashState {
  final String token;

  Loaded({ required this.token});

  @override
  List<Object> get props => [token];
}

class Error extends SplashState {
  final String message;

  Error({ required this.message});

  @override
  List<Object> get props => [message];
}