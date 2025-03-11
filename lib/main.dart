import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'presentation/navigation/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, // 라우터 설정 분리
      debugShowCheckedModeBanner: false,
      title: 'Test Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
    );
  }
}
