import 'dart:convert';

import 'package:api_handling/data/model/post_model.dart';
import 'package:http/http.dart' as http;

class APIs {
  static Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((postMap) => PostModel.fromJson(postMap)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (ex) {
      rethrow;
    }
  }
}
