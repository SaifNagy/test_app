
import 'package:test_app/core/networking/api_result.dart';
import 'package:test_app/core/networking/api_services.dart';
import 'package:test_app/features/home/data/models/posts_response_model.dart';

class PostDetailsRepo {
  final ApiService _apiService;
  PostDetailsRepo(this._apiService);

  Future<ApiResult<PostsResponseModel>> getPosts(int id) async {
    try {
      final response = await _apiService.getPost(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
