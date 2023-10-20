import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../config/server.dart';

class PostRepo {
  fetchAllPosts(int pageNumber) async {
    final url = Uri.parse(baseURL);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as List;
      return json;
    }
  }
}
