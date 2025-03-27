import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';

class PosttypeWidget extends StatelessWidget {
  const PosttypeWidget({super.key, required this.buttonId, required this.text});

  final int buttonId;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedTypeNotifier,
      builder: (context, value, child) {
        if (value == buttonId) {
          return FilledButton(
            onPressed: () {
              selectedTypeNotifier.value = buttonId;
            },
            child: Text(text),
          );
        }
        return FilledButton.tonal(
          onPressed: () {
            selectedTypeNotifier.value = buttonId;
          },
          child: Text(text),
        );
      },
    );
  }
}
