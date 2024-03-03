import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/cubit/internet_cubit.dart';
// import 'package:internet_connectivity/bloc/internet_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: BlocConsumer<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Connected");
            } else if (state is InternetLostState) {
              return const Text("No Connection");
            } else {
              return const Text("Loading...");
            }
          },
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: const Text(
                  'Connected',
                ),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  'No Connection',
                ),
                backgroundColor: Colors.red,
              ));
            }
          },
        )
            //     child: BlocConsumer<InternetBloc,InternetState>(
            //   builder: (context, state) {
            //     if (state is InternetGainedState) {
            //       return const Text("Connected");
            //     } else if (state is InternetLostState) {
            //       return const Text("No Connection");
            //     } else {
            //       return const Text("Loading...");
            //     }
            //   },
            //   listener: (context, state) {
            //     if (state is InternetGainedState) {
            //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //         content: const Text(
            //           'Connected',
            //         ),
            //         backgroundColor: Colors.green,
            //       ));
            //     } else if (state is InternetLostState) {
            //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //         content: Text(
            //           'No Connection',
            //         ),
            //         backgroundColor: Colors.red,
            //       ));
            //     }
            //   },
            // )
            // BlocBuilder<InternetBloc, InternetState>(
            //   builder: (context, state) {
            //    if(state is InternetGainedState) {
            //      return Text("Connected");
            //    } else if( state is InternetLostState) {
            //      return Text("No Connection");
            //    } else {
            //      return Text("Loading...");
            //    }
            //   },
            // ),
            ),
      ),
    );
  }
}
