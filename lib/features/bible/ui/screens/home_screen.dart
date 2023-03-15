import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home'),
            OutlinedButton(
              onPressed: () {
                context.go('/bibleScreen');
              },
              child: const Text('Bible Screen'),
            )
          ],
        ),
      ),
    );
  }
}
