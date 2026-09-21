import 'package:flutter/material.dart';

/// Closes the drawer, then pushes [page] on the next frame (avoids black/blank screens).
void pushFromDrawer(BuildContext context, Widget page) {
  final navigator = Navigator.of(context);
  navigator.pop();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    navigator.push<void>(
      MaterialPageRoute(builder: (_) => page),
    );
  });
}
