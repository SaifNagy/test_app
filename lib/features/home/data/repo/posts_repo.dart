
import 'package:test_app/core/networking/api_result.dart';
import 'package:test_app/core/networking/api_services.dart';
import 'package:test_app/features/home/data/models/posts_response_model.dart';

class PostsRepo {
  final ApiService _apiService;
  PostsRepo(this._apiService);

  Future<ApiResult<List<PostsResponseModel>>> getPosts() async {
    try {
      final response = await _apiService.getPosts();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
