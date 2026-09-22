import 'package:flutter/material.dart';

/// Pushes a page from the drawer
void pushFromDrawer(BuildContext context, Widget page) {
  final navigator = Navigator.of(context);
  navigator.pop();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    navigator.push<void>(MaterialPageRoute(builder: (_) => page));
  });
}
