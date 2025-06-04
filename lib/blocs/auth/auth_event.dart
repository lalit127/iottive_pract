import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginRequest extends AuthEvent {
  final String email;
  final String password;

  const LoginRequest({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
