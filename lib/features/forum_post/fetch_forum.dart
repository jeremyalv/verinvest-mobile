import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:verinvest_mobile/features/forum_post/forum.dart';


 Future<List<ForumPost>> fetchforum() async {
        var url = Uri.parse('https://verinvest.up.railway.app/collections/forum/json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object ToDo
        List<ForumPost> listOfForum = [];
        for (var d in data) {
        if (d != null) {
            listOfForum.add(ForumPost.fromJson(d));
        }
        }

        return listOfForum;
    }
    