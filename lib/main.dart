import 'package:education_app/application/blocs/course/course_bloc.dart';
import 'package:education_app/presentation/core/theme.dart';
import 'package:education_app/presentation/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
