part of 'signin_bloc.dart';

abstract class SigninEvent {
  const SigninEvent();
}

class SignInEmailEvent extends SigninEvent {
  final String email;
  const SignInEmailEvent({required this.email});
}

class SignInPasswordEvent extends SigninEvent {
  final String password;
  const SignInPasswordEvent({required this.password});
}
