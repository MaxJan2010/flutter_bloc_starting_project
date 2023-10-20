import 'package:flutter_bloc_hossam_hamed/data/api_services/post_dio.dart';

import '../models/post/post.dart';


class PostsRepositories{
  final PostApi postApi;
  PostsRepositories({required this.postApi});

  Future<List<PostModel>> getAllPosts()async{
    var posts = await postApi.getPostsList();
    List<Map<String,dynamic>> postsItems = List<Map<String,dynamic>>
    .from(posts);
    List<PostModel> seriesPosts = PostModel.fromData(postsItems);
    return seriesPosts;
  }
}

class ApiRepository {
  final postApi = PostApi();

  Future<List> getPostsList() {
    return postApi.getPostsList();
  }
}

class NetworkError extends Error {}