import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.state});

  final GoRouterState state;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final Stream<int> _bids = (() {
    late final StreamController<int> controller;
    controller = StreamController<int>(
      onListen: () async {
        await Future<void>.delayed(const Duration(seconds: 1));
        await Future<void>.delayed(const Duration(seconds: 1));
      },
    );
    return controller.stream;
  })();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bids,
      builder: (context, snapshot) => AppBar(
          leading:
              context.canPop() ? IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)) : null),
    );
  }
}
