import 'package:blog_post_app/screens/home_screen.dart';
import 'package:blog_post_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterView extends StatelessWidget {

  RouterView({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
      GoRoute(name: 'home',
        path: '/home',
        builder: (context, state) => const HomeScreen()),

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