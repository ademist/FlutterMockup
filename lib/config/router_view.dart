import 'package:blog_post_app/screens/book_marked_screen.dart';
import 'package:blog_post_app/screens/home_screen.dart';
import 'package:blog_post_app/screens/login_screen.dart';
import 'package:blog_post_app/screens/view_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterView extends StatelessWidget {

  RouterView({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
      GoRoute(
        name: 'screen1',
        path: '/home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'post/:id',
            builder: (context, state) {
              String id = state.pathParameters['id'] ?? '';
              return ViewPostScreen(id: id);
            }
          )
        ]
      ),
      GoRoute(
        name: 'screen2',
        path: '/bookmarked',
        builder: (context, state) => const BookmarkedScreen()),

    ]
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}