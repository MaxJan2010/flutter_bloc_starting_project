part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostsGetEvent extends PostEvent {
  @override
  List<Object> get props => [];
}

class PostsLoadMoreEvent extends PostEvent {
  @override
  List<Object> get props => [];
}
