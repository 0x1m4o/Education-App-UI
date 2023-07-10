import 'package:education_app/presentation/core/theme.dart';
import 'package:education_app/presentation/route/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.pages,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.appThemeData[AppTheme.lightTheme],
    );
  }
}
