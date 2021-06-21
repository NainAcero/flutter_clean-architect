  
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SplashEvent extends Equatable {
  
  @override
  List<Object?> get props => [];
}

class VerifyToken extends SplashEvent {

  @override
  List<Object?> get props => [];
}
