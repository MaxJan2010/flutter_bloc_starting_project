// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitialState extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoadingState extends PostState {
  @override
  List<Object> get props => [];
}

class PostSuccessState extends PostState {
  List<PostModel> postsList;
  PostSuccessState({
    required this.postsList,
  });
  @override
  List<Object> get props => [postsList];
}

class PostErrorState extends PostState {
  String postsListErrorMessage;
  PostErrorState({
    required this.postsListErrorMessage,
  });
  @override
  List<Object> get props => [postsListErrorMessage];
}
