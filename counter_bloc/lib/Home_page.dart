import 'package:bloc_prac/bloc/counter_bloc.dart';
import 'package:bloc_prac/cubit/counter_cubit.dart';
import 'package:bloc_prac/inc_dec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          
          title: Text(title),
        ),
        body: Center(
         
          child: Column(
         
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterBloc, int>(
                builder: (context, counter) => Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => IncDec()));
          },
          child: Icon(Icons.navigate_before),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
