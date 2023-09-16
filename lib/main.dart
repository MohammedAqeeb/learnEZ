import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/app/welcome/bloc/welcome_bloc.dart';
import 'package:learnez/bloc/counter_bloc.dart';

import 'app/welcome/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
    );
  }
}
