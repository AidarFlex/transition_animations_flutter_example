import 'package:flutter/material.dart';

class SecondarySecondPage extends StatelessWidget {
  const SecondarySecondPage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
