import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/presentation/pages/board_page.dart';
import '../pages/home_page.dart';
import '../pages/my_page.dart';
import '../pages/main_layout.dart';

final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child); // 공통 레이아웃 유지
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(title: "Hi! I'm Home :)"),
        ),
        GoRoute(
          path: '/my-page',
          builder: (context, state) => const MyPage(),
        ),
        GoRoute(
          path: '/board',
          builder: (context, state) => const BoardPage(title: "Hi! I'm Board."),
        ),
      ],
    ),
  ],
);
