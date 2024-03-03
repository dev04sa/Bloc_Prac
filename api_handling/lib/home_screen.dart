import 'package:api_handling/bloc/post_bloc.dart';
// import 'package:api_handling/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context);
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PostLoadedState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title.toString()),
                );
              },
            );
          } else {
            return Center(child: Text('An error occurred'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            postBloc.add(PostFetchEvent());
          },
          child: Icon(Icons.add)),
      // body: BlocBuilder<PostCubit, PostState>(
      //   builder: (context, state) {
      //     if (state is PostLoadingState) {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //     if (state is PostLoadedState) {
      //       return ListView.builder(
      //         itemCount: state.posts.length,
      //         itemBuilder: (context, index) {
      //           final post = state.posts[index];
      //           return ListTile(
      //             title: Text(post.title.toString()),
      //           );
      //         },
      //       );
      //     } else {
      //       return Center(child: Text('An error occurred'));
      //     }
      //   },
      // ),
    );
  }
}
