import 'dart:convert';

class Post {
  late int pk;
  late String postType;
  // TODO change to Profile object later on
  late String author;
  late DateTime dateCreated;

  late String title;
  late String content;

  late int upvotes;
  late int viewers;
  late int commentsCount;

  Post({
    required this.pk,
    required this.postType,
    required this.author,
    required this.dateCreated,
    required this.title,
    required this.content,
    this.upvotes = 0,
    this.viewers = 0,
    this.commentsCount = 0,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> postJson = <String, dynamic>{};
    postJson["pk"] = pk;
    postJson["post_type"] = postType;
    postJson["author"] = author; // TODO make author to JSON
    postJson["date_created"] = dateCreated;
    postJson["title"] = title;
    postJson["content"] = content;
    postJson["upvotes"] = upvotes;
    postJson["viewers"] = viewers;
    postJson["comments_count"] = commentsCount;

    return postJson;
  }

  Post.fromJson(Map<String, dynamic> json) {
    pk = json["pk"];
    postType = json["post_type"];
    author = json["author"];
    dateCreated = json["date_created"];
    title = json["title"];
    content = json["content"];
    upvotes = json["upvotes"];
    viewers = json["viewers"];
    commentsCount = json["comments_count"];
  }
}
