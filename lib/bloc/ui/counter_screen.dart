import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnez/bloc/counter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print('ui build once');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state.counter.isEven) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Hey it is even Number')));
                } else if (state.counter.isOdd) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Hey it is Odd Number')));
                }
              },
              builder: (context, state) {
                print('ui being rebuild');
                if (state.counter == 0) {
                  return Text(
                    'Click Button to Increase counter value',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return Text(
                    state.counter.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'heroTag1',
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).add(IncrementCounter()),
            tooltip: 'Increment',
            child: const Icon(Icons.expand_less),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            heroTag: 'heroTag2',
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).add(DecrementCounter()),
            tooltip: 'Decrement',
            child: const Icon(Icons.expand_circle_down),
          ),
        ],
      ),
    );
  }
}
