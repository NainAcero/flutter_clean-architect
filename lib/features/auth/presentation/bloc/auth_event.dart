  
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent extends Equatable {
  
  @override
  List<Object?> get props => [];
}

class SignIn extends AuthEvent {
  final String username;
  final String password;

  SignIn(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}
