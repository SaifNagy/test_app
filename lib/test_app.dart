
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/routing/app_router.dart';
import 'package:test_app/core/routing/app_routes.dart';

class TestApp extends StatelessWidget {
  final AppRouter appRouter;
  const TestApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test App',
        theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade200),
        onGenerateRoute: appRouter.onGenerateRoute,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
