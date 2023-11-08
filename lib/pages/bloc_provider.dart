import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnez/bloc/counter_bloc.dart';
import 'package:learnez/pages/application/bloc/application_bloc.dart';
import 'package:learnez/pages/home/bloc/home_page_bloc.dart';
import 'package:learnez/pages/sign_in/bloc/signin_bloc.dart';
import 'package:learnez/pages/sign_up/bloc/sign_up_bloc.dart';

import 'welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allProvider => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider(
          create: (context) => ApplicationBloc(),
        ),
        BlocProvider(
          create: (context) => HomePageBloc(),
        )
      ];
}
