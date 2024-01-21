abstract class AuthEvent {}

class Login extends AuthEvent {
  String email;
  String password;

  Login({required this.email, required this.password});
}

class Register extends AuthEvent {
  String email;
  String password;
  String username;
  Register({
    required this.email,
    required this.password,
    required this.username,
  });
}

class Logout extends AuthEvent {}
