// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_response_model.g.dart';

@JsonSerializable()
class PostsResponseModel {
  int? userId;
  int? id;
  String? title;
  String? body;  PostsResponseModel({
  this.userId,
    this.id,
    this.title,
    this.body,  });

  factory PostsResponseModel.fromJson(Map<String, dynamic> json) => _$PostsResponseModelFromJson(json);
}


