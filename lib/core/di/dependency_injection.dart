import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/networking/api_services.dart';
import 'package:test_app/core/networking/dio_factory.dart';
import 'package:test_app/features/home/data/repo/posts_repo.dart';
import 'package:test_app/features/home/logic/posts_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio&ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(()=>ApiService(dio));

  //posts
  getIt.registerLazySingleton<PostsRepo>(()=>PostsRepo(getIt()));
  getIt.registerFactory<PostsCubit>(()=>PostsCubit(getIt()));
}
