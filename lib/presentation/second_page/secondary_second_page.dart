import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondarySecondPage extends StatelessWidget {
  const SecondarySecondPage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(text), ElevatedButton(onPressed: () => context.pop(), child: const Text('pop'))],
    ));
  }
}
