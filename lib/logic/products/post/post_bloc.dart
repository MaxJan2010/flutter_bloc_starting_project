import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/post/post.dart';
import '../../../data/api_services/post_dio.dart';
import '../../../data/repositories/posts_dio.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final _postRepository = PostsRepositories(postApi: null);
  PostBloc() : super(PostInitialState()) {
    on<PostEvent>((event, emit) async {
      if (event is PostGetEvent) {
        if (state is PostInitialState) {
          return;
        }
      }
    });
  }
}
