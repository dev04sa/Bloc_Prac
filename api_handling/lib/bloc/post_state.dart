part of 'post_bloc.dart';

@immutable
sealed class PostState {}
final class PostLoadingState extends PostState {}


final class PostLoadedState extends PostState {
  final List<PostModel> posts;
  PostLoadedState(this.posts);
}

final class PostErrorState extends PostState {
  final String errMsg;
  PostErrorState(this.errMsg);
}
