import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/pages/home/screen.dart';
import 'package:learnez/pages/sign_in/screen.dart';
import 'package:learnez/pages/sign_up/screen.dart';

import 'pages/bloc_provider.dart';
import 'pages/welcome/screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allProvider,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ScreenUtilInit(
          builder: (context, widget) => const WelcomeScreen(),
        ),
        routes: {
          'signIn': (context) => const SignInScreen(),
          'signUp': (context) => const SignUpScreen(),
        },
      ),
    );
  }
}
