import 'package:bloc/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementCounter>((event, emit) {
      print('this is called');
      emit(CounterState(counter: state.counter + 1));
      print('this is builded');
    });

    on<DecrementCounter>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });
  }
}
