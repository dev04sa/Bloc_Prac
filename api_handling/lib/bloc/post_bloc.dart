import 'package:api_handling/data/api.dart';
import 'package:api_handling/data/model/post_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostLoadingState()) {
    on<PostFetchEvent>((event, emit) async {
      try {
        emit(PostLoadingState());
        List<PostModel> posts = await APIs.fetchPosts();
        emit(PostLoadedState(posts));
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    });
  }
}
