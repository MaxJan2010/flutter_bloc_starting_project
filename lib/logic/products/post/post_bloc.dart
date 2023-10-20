// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../data/repositories/products/post_repo.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepo postStore;
  int pageNumber = 1;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();
  PostBloc(
    this.postStore,
    this.pageNumber,
  ) : super(const PostInitialState(null)) {
    on<PostsGetEvent>((event, emit) async {
      emit(const PostLoadingState(null));
      var postsPaginated = await postStore.fetchAllPosts(pageNumber);
      emit(PostLoadedState(posts: postsPaginated));
    });
    on<PostsLoadMoreEvent>((event, emit) async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoadingMore = true;
        pageNumber++;
        var postsPaginated = await postStore.fetchAllPosts(pageNumber);
        emit(PostLoadedState(posts: [...state.posts, ...postsPaginated]));
      }
    });
  }
}
