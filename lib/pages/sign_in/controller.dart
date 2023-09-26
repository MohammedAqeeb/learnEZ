import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnez/pages/sign_in/bloc/signin_bloc.dart';
import 'package:learnez/widgets/toast.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;

        final email = state.email;

        final password = state.password;

        if (email.isEmpty) {
          toastWidget(msg: 'Please Enter Email Address');
        }

        if (password.isEmpty) {
          toastWidget(msg: 'Please Enter Password');
        }

        try {
          final firebaseAuth = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);

          if (firebaseAuth.user == null) {
            toastWidget(msg: 'Email Address Doest Exist');
          }

          if (!firebaseAuth.user!.emailVerified) {
            toastWidget(msg: 'Verify your email address');
          }

          var user = firebaseAuth.user;

          if (user != null) {
          } else {}
        } on FirebaseAuthException catch (e) {
          return toastWidget(msg: e.toString());
        }
      }
    } catch (e) {}
  }
}
