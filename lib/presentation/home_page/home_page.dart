import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transition_animations_example/common/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.child, required this.state});

  final StatefulNavigationShell child;
  final GoRouterState state;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(state: widget.state),
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          widget.child.goBranch(index, initialLocation: index == widget.child.currentIndex);
        },
        selectedIndex: widget.child.currentIndex,
        destinations: const [
          NavigationDestination(selectedIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined), label: 'First'),
          NavigationDestination(icon: Icon(Icons.business), label: 'Second'),
          NavigationDestination(selectedIcon: Icon(Icons.school), icon: Icon(Icons.school_outlined), label: 'Third'),
        ],
      ),
    );
  }
}
