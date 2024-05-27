import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:likh_lena_chahiye_tha/firebase_options.dart';
import 'package:likh_lena_chahiye_tha/views/login_view.dart';
import 'package:likh_lena_chahiye_tha/views/register_view.dart';
import 'package:likh_lena_chahiye_tha/views/verify_email_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // primarySwatch: Colors.blue,
      useMaterial3: true,
    ),
    home: const HomePage(),
    routes: {
      '/login/':(context) => const LoginView(),
      '/register/':(context) => const RegisterView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ), 
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                if (user.emailVerified) {
                  print("email is verified");
                } else {
                  return const VerifyEmailView();
                }
              } else {
                return const LoginView();
              }
              return const Scaffold(
                body: Center(child: Text("Done"),),
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      );
  }
}


