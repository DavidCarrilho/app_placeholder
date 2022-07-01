import 'module/login/presenter/login_page.dart';
import 'pages/splash_page.dart';
import 'package:flutter/material.dart';

import 'module/home/presenter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Placeholder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => LoginPage(),
        '/home': (_) => const HomePage(),
      },
    );
  }
}
