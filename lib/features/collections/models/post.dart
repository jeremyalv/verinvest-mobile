import 'dart:convert';
import 'package:intl/intl.dart';

class Post {
  late String postType;
  // TODO change to Profile object later on
  late String authorUsername;
  late DateTime dateCreated;

  late String title;
  late String content;

  late int upvotes;
  late int viewers;
  late int commentsCount;

  // TODO convert to List<Comment> later
  late List<String> comments;

  Post({
    required this.postType,
    required this.authorUsername,
    required this.dateCreated,
    required this.title,
    required this.content,
    this.upvotes = 0,
    this.viewers = 0,
    this.commentsCount = 0,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> postJson = <String, dynamic>{};
    // postJson["pk"] = pk;
    postJson["fields"]["post_type"] = postType;
    postJson["fields"]["author_username"] = authorUsername;
    postJson["fields"]["date_created"] =
        DateFormat('yyyy-MM-dd').format(dateCreated);
    postJson["fields"]["title"] = title;
    postJson["fields"]["content"] = content;
    postJson["fields"]["upvotes"] = upvotes;
    postJson["fields"]["viewers"] = viewers;
    postJson["fields"]["comments_count"] = commentsCount;

    return postJson;
  }

  Post.fromJson(Map<String, dynamic> json) {
    // pk = json["pk"];
    postType = json["fields"]["post_type"];
    authorUsername = json["fields"]["author_username"];
    dateCreated = DateTime.parse(json["fields"]["date_created"]);
    title = json["fields"]["title"];
    content = json["fields"]["content"];
    upvotes = json["fields"]["upvotes"];
    viewers = json["fields"]["viewers"];
    commentsCount = json["fields"]["comments_count"];
  }
}
