import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key, required this.children, this.title});

  final List<Widget> children;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            title != null ? title!.toUpperCase() : "",
            style: TextStyle(color: isDarkModeNotifier.value == false ? Colors.black54 : Colors.white70),
          ),
        ),
        Material(
          color: isDarkModeNotifier.value == false ? Colors.grey[300] : Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: List.generate(
              children.length * 2 - 1,
              (index) => index.isEven
                  ? children[index ~/ 2]
                  : const Divider(height: 0),
            ),
          ),
        ),
      ],
    );
  }
}
