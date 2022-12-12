import 'dart:convert';

List<ForumPost> forumFromJson(String str) => List<ForumPost>.from(json.decode(str).map((x) => ForumPost.fromJson(x)));

String forumToJson(List<ForumPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForumPost {
    ForumPost({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory ForumPost.fromJson(Map<String, dynamic> json) => ForumPost(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.user,
        required this.title,
        required this.comment,
        required this.username,
    });

    int user;
    String title;
    String comment;
    String username;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        title: json["title"],
        comment: json["comment"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "title": title,
        "comment": comment,
        "username": username,
    };
}