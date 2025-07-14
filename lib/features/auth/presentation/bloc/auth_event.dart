import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  LoginSubmitted(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class RegisterSubmitted extends AuthEvent {
  final String email;
  final String name;
  final String password;
  final String confirmPassword;

  RegisterSubmitted(this.name, this.email, this.password, this.confirmPassword);

  @override
  List<Object> get props => [name, email, password, confirmPassword];
}
