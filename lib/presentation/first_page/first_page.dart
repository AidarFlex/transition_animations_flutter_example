import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            color: Colors.lightGreen,
            child: ListTile(
              leading: const Icon(Icons.person),
              onTap: () => context.pushNamed('secondary_first_page', extra: {'text': 'List Menu Item ${index + 1}'}),
              title: Text('List Menu Item ${index + 1}'),
            ),
          )),
    );
  }
}
