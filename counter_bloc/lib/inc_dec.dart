import 'package:bloc_prac/bloc/counter_bloc.dart';
import 'package:bloc_prac/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDec extends StatelessWidget {
  const IncDec({super.key});

  @override
  Widget build(BuildContext context) {
    final countercubit = BlocProvider.of<CounterCubit>(context);
    final counterbloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // countercubit.increment();
              counterbloc.add(CounterIncremented());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              // countercubit.decrement();
              counterbloc.add(CounterDecremented());
            },
            tooltip: 'deccrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
