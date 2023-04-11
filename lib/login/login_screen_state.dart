part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenState {}

class LoginScreenInitial extends LoginScreenState {}

class LoginScreenLoading extends LoginScreenState {}

class LoginScreenError extends LoginScreenState {
  final String? error;

  LoginScreenError({this.error});
}

class LoginScreenLoaded extends LoginScreenState {}
