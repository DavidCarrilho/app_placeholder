// import 'dart:convert';

class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel(
    this.userId,
    this.id,
    this.title,
    this.body,
  );

  factory PostModel.fromJson(Map json) {
    return PostModel(
      json['userId'],
      json['id'],
      json['title'],
      json['body'], 
    );
  }

// gerado
  // Map<String, dynamic> toMap() {
  //   return {
  //     'userId': userId,
  //     'id': id,
  //     'title': title,
  //     'body': body,
  //   };
  // }

  // factory PostModel.fromMap(Map<String, dynamic> map) {
  //   return PostModel(
  //     map['userId']?.toInt() ?? 0,
  //     map['id']?.toInt() ?? 0,
  //     map['title'] ?? '',
  //     map['body']?.toInt() ?? 0,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source));
}
