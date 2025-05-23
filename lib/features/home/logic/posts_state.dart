import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app/features/home/data/models/posts_response_model.dart';

part  'posts_state.freezed.dart';

@freezed
class PostsState<T> with _$PostsState<T> {
  const factory PostsState.initial() = _Initial;
  const factory PostsState.loading() = Loading;
  const factory PostsState.success(List<PostsResponseModel> postsResponse) = Success;
  const factory PostsState.error(String error) = Error;
}
