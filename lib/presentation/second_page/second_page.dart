import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:transition_animations_example/presentation/second_page/secondary_second_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(16),
        child: OpenContainer<bool>(
          transitionType: ContainerTransitionType.fade,
          openBuilder: (context, openContainer) => SecondarySecondPage(text: 'List Menu Item ${index + 1}'),
          closedBuilder: (context, openContainer) {
            return Container(
              color: Colors.lightGreen,
              child: ListTile(
                  leading: const Icon(Icons.person), onTap: openContainer, title: Text('List Menu Item ${index + 1}')),
            );
          },
        ),
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
    );
  }
}
