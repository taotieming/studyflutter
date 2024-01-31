import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter/config/app_routes.dart';
import 'package:study_flutter/provider/app_repo.dart';
import 'package:study_flutter/provider/post_provider.dart';
import 'package:study_flutter/styles/app_colors.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppRepo>(
        create: (context) => AppRepo(),
      ),
      ChangeNotifierProvider<PostProvider>(
        create: (context) => PostProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: AppScrollBehavior(),
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: "Urbanist",
            scaffoldBackgroundColor: AppColors.background,
            brightness: Brightness.dark),

        // home: LoginPage(),
        initialRoute: AppRoute.login,
        routes: AppRoute.pages);
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
