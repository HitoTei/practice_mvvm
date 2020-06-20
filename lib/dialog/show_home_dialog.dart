import 'package:flutter/material.dart';

Future<void> showHomeDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => const AboutDialog(),
  );
}
