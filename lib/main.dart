import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/bloc/counter_bloc.dart';
import 'package:learnez/pages/sign_in/screen.dart';

import 'pages/welcome/bloc/welcome_bloc.dart';
import 'pages/welcome/screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WelcomeBloc(),
          ),
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
        ],
        child: ScreenUtilInit(
          builder: (context, widget) => const WelcomeScreen(),
        ),
      ),
      routes: {
        'signIn': (context) => const SignInScreen(),
      },
    );
  }
}
