import 'package:flutter/material.dart';
import 'package:tobetoclone/widgets/login_form.dart';
import 'package:tobetoclone/widgets/register_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    Widget formWidget = _isLogin ? LoginForm() : RegisterForm();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            formWidget,
            TextButton(
              onPressed: () {
                setState(() {
                  _isLogin = !_isLogin;
                });
              },
              child: Text(_isLogin
                  ? "Hesabınız yok mu? Kayıt Ol"
                  : "Zaten hesabım var, giriş Yap"),
            )
          ],
        ),
      ),
    );
  }
}
