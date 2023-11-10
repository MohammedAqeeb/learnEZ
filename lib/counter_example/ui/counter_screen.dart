import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnez/counter_example/counter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context2) {
    print('ui build once');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context2).colorScheme.inversePrimary,
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                print('ui being rebuild');
                if (state.counter == 0) {
                  return Text(
                    'Click Button to Increase counter value',
                    style: Theme.of(context2).textTheme.headlineMedium,
                  );
                } else {
                  return Text(
                    state.counter.toString(),
                    style: Theme.of(context2).textTheme.headlineMedium,
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
