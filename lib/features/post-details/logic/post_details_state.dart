import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app/features/home/data/models/posts_response_model.dart';

part'post_details_state.freezed.dart';

@Freezed()
class PostDetailsState<T> with _$PostDetailsState<T> {
  const factory PostDetailsState.initial() = _Initial;
  const factory PostDetailsState.loading() = Loading;
  const factory PostDetailsState.success(PostsResponseModel postsResponseModel) = Success;
  const factory PostDetailsState.error(String e) = Error;
}
