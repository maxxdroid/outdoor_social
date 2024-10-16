import 'package:flutter/material.dart';
import 'package:outdoor_social/model/user.dart';

class Post {
  final String postId;
  LocalUser user;
  DateTime date;
  String content;
  String category;
  String? image;

  Post({
    required this.user,
    required this.content,
    required this.category,
    DateTime? date, // Make date optional and use default
    String? postId, // Make postId optional
    this.image,
  })  : date = date ?? DateTime.now(),
        postId = postId ?? DateTime.now().millisecondsSinceEpoch.toString(); // Use provided postId or generate new one

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'], // Get postId from JSON if available
      user: LocalUser.fromJson(json['user']),
      category: json['category'],
      content: json['content'],
      date: DateTime.parse(json['date']),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'user': user.toJson(),
      'category' : category,
      'date': date.toIso8601String(),
      'content': content,
      'image': image,
    };
  }
}
