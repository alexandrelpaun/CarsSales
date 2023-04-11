part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenEvent {}

// ignore: must_be_immutable
class Login extends LoginScreenEvent {
  String? username;
  String? password;

  Login({this.username, this.password});
}
