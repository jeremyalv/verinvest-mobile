import 'dart:convert';

import '../profile/user_profile.dart';

List<Education> EducationFromJson(String str) => List<Education>.from(json.decode(str).map((x) => Education.fromJson(x)));

String EducationToJson(List<Education> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Education {
  Education({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.author,
    required this.dateCreated,
    required this.title,
    required this.content,
    this.upvotes = 0,
    this.viewers = 0,
    this.commentsCount = 0,
  });

  Profile author;
  DateTime dateCreated;
  String title;
  String content;
  int upvotes;
  int viewers;
  int commentsCount;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    author: json["author"],
    dateCreated: DateTime.parse(json["date_created"]),
    title: json["title"],
    content: json["content"],
    upvotes: json["upvotes"],
    viewers: json["viewers"],
    commentsCount: json["comments_count"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "date_created": dateCreated,
    "title": title,
    "content": content,
    "upvotes": upvotes,
    "viewers": viewers,
    "comments_count": commentsCount,
  };
}

class EducationComment {
  EducationComment({
    required this.post,
    required this.commenter,
    required this.dateCreated,
    required this.content,
    required this.upvotes

  });
  Education post;
  Profile commenter;
  DateTime dateCreated;
  String content;
  int upvotes;

  factory EducationComment.fromJson(Map<String, dynamic> json) => EducationComment(
    post: json["post"],
    commenter: json["commenter"],
    dateCreated: DateTime.parse(json["date_created"]),
    content: json["content"],
    upvotes: json["upvotes"],
  );

  Map<String, dynamic> toJson() => {
    "post": post,
    "commenter": commenter,
    "date_created": dateCreated,
    "content": content,
    "upvotes": upvotes,
  };
}