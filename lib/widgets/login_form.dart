import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoclone/blocs/auth/auth_bloc.dart';
import 'package:tobetoclone/blocs/auth/auth_event.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AuthBloc>().add(Login(email: _email, password: _password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'E-posta'),
            keyboardType: TextInputType.emailAddress,
            onSaved: (value) => _email = value!,
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'Lütfen geçerli bir e-posta adresi giriniz.';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Şifre'),
            obscureText: true,
            onSaved: (value) => _password = value!,
            validator: (value) {
              if (value!.isEmpty || value.length < 8) {
                return 'Şifre en az 8 karakter uzunluğunda olmalıdır.';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Giriş Yap'),
          ),
        ],
      ),
    );
  }
}
