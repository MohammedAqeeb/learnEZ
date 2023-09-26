import 'package:bloc/bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SigninEvent, SigninState> {
  SignInBloc() : super(const SigninState()) {
    on<SignInEmailEvent>((event, emit) {
      print('current password ${event.email}');
      emit(state.copyWith(email: event.email));
    });

    on<SignInPasswordEvent>((event, emit) {
      print('change password ${event.password}');
      emit(state.copyWith(password: event.password));
    });
  }
}
