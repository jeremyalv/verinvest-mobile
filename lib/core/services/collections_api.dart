import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../features/collections/models/post.dart';

class CollectionsAPI {
  Future<List<Post>> fetchPosts() async {
    const String endpoint =
        "https://verinvest.up.railway.app/collections/json/";

    Uri url = Uri.parse(endpoint);
    var response = await http.get(url, headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    });

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // Convert JSON into Post object
    List<Post> collections = [];

    for (var post in data) {
      if (post != null) {
        collections.add(Post.fromJson(post));
      }
    }

    return collections;
  }
}
