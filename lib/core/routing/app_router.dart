import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/di/dependency_injection.dart';
import 'package:test_app/core/routing/app_routes.dart';
import 'package:test_app/features/home/logic/posts_cubit.dart';
import 'package:test_app/features/home/ui/home_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<PostsCubit>()..emitGetPosts(),
                  child: const HomeScreen(),
                ));
                case AppRoutes.postsDetails:
      default:
        return null;
    }
  }
}
