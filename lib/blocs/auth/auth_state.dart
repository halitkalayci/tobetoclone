import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class Initial extends AuthState {}

class NotAuthenticated extends AuthState {
  String? errorMessage;

  NotAuthenticated({this.errorMessage});
}

class Authenticated extends AuthState {
  User? user;

  Authenticated({this.user});
}
