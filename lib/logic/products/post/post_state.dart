part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  final posts;
  const PostState(this.posts);

  @override
  List<Object> get props => [posts];
}

final class PostInitialState extends PostState {
  const PostInitialState(super.posts);

  @override
  List<Object> get props => [];
}

final class PostLoadingState extends PostState {
  const PostLoadingState(super.posts);

  @override
  List<Object> get props => [];
}

final class PostLoadedState extends PostState {
  const PostLoadedState({required posts}) : super(posts);

  @override
  List<Object> get props => [posts];
}

final class PostErrorState extends PostState {
  final String errorMessage;

  const PostErrorState(super.posts, {required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
