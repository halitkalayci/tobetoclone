import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoclone/blocs/auth/auth_bloc.dart';
import 'package:tobetoclone/firebase_options.dart';
import 'package:tobetoclone/screens/start.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(
    providers: [BlocProvider<AuthBloc>(create: (context) => AuthBloc())],
    child: const MaterialApp(
      home: StartPage(),
    ),
  ));
}
// BLoC
// Firebase


// git rm . --cached -rf 
// git add .
// git commit -m "remove files"
// git push origin branch