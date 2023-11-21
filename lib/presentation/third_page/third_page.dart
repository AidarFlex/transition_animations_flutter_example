import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () {
              context.pushNamed('secondary_third_page');
            },
            child: const Text('Go to next page')),
        ElevatedButton(
            onPressed: () {
              showModal(
                configuration: const FadeScaleTransitionConfiguration(),
                context: context,
                builder: (_) => const AlertDialog(
                  title: Text('New dialog'),
                ),
              );
            },
            child: const Text('Show Snack Bar')),
      ],
    );
  }
}
