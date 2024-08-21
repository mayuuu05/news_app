import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/detail_sceen/detail_screen.dart';
import 'package:news_app/view/home_page/home_page.dart';
import 'package:news_app/view/login_page/login_page.dart';
import 'package:news_app/view/splash_screen/splash_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/detail',
          page: () => const DetailScreen(),
        ),
      ],
    );
  }
}
