import 'package:counter_app/bloc/bloc_builder.dart';
import 'package:counter_app/helpers/app_localization.dart';
import 'package:counter_app/module/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppLocalization.counter,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              AppLocalization.counterDescription,
            ),
            const SizedBox(height: 20),
            BlocBuilder(
              bloc: _counterBloc,
              builder: () {
                return Text(
                  _counterBloc.state.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _counterBloc.increseCounter(),
            tooltip: AppLocalization.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () => _counterBloc.decreseCounter(),
            tooltip: AppLocalization.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
