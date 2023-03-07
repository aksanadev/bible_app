import 'package:bible_app/features/bible/ui/screens/bible_screen.dart';
import 'package:bible_app/features/bible/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const BibleApp());
}

//go_router
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      path: '/bibleScreen',
      builder: (BuildContext context, GoRouterState state) =>
          const BibleScreen(),
    ),
  ],
);

//app
class BibleApp extends StatelessWidget {
  const BibleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Bible App',
    );
  }
}
