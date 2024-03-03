import 'package:api_handling/data/api.dart';
import 'package:api_handling/data/model/post_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }
  void fetchPosts() async {
    try {
      List<PostModel> posts =  await APIs.fetchPosts();
      emit(PostLoadedState(posts));
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}
