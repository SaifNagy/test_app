
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:test_app/core/helpers/api_constants.dart';
import 'package:test_app/features/home/data/models/posts_response_model.dart';
part 'api_services.g.dart';


@RestApi(baseUrl: ApiConsts.baseUrl)
abstract class ApiService{
 factory ApiService(Dio dio , {String baseUrl})=_ApiService;

@GET(ApiConsts.postsEp)


Future<List<PostsResponseModel>> getPosts();

}