import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoclone/blocs/auth/auth_bloc.dart';
import 'package:tobetoclone/blocs/auth/auth_state.dart';
import 'package:tobetoclone/screens/auth.dart';
import 'package:tobetoclone/screens/homepage.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Authenticated) return const Homepage();
      return const AuthPage();
    });
  }
}
