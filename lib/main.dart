// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:likh_lena_chahiye_tha/constants/routes.dart';
import 'package:likh_lena_chahiye_tha/services/auth/auth_service.dart';
import 'package:likh_lena_chahiye_tha/views/login_view.dart';
import 'package:likh_lena_chahiye_tha/views/notes_view.dart';
import 'package:likh_lena_chahiye_tha/views/register_view.dart';
import 'package:likh_lena_chahiye_tha/views/verify_email_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // primarySwatch: Colors.blue,
      useMaterial3: false,
    ),
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const NotesView(),
      verifyEmailRoute: (context) => const VerifyEmailView()
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const NotesView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
