import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnez/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:learnez/widgets/toast.dart';

class SignUpLogic {
  final BuildContext context;

  const SignUpLogic({required this.context});
  Future<void> createUser() async {
    final firebaseAuth = FirebaseAuth.instance;

    final state = context.read<SignUpBloc>().state;

    String email = state.email;

    String userName = state.userName;

    String password = state.password;

    String confirmPsd = state.confirmPassword;

    if (userName.isEmpty) {
      toastWidget(msg: 'Username is empty');
    }

    if (email.isEmpty) {
      toastWidget(msg: 'Email Can\'t be empty');
    }
    if (password.isEmpty) {
      toastWidget(msg: 'Enter Password');
    }
    if (confirmPsd.isEmpty) {
      toastWidget(msg: 'Enter Password');
    }
    if (confirmPsd != password) {
      toastWidget(msg: 'Password mismatch');
    }
    try {
      final firebaseUser = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (firebaseUser.user != null) {
        firebaseUser.user!.sendEmailVerification();
        firebaseUser.user!.updateDisplayName(userName);

        toastWidget(
            msg:
                'A email sent to your registered email address, click on it to verify to email');

        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      toastWidget(msg: e.code.toString());
    }
  }
}
