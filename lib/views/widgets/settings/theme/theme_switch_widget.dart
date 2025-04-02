import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';

class ThemeSwitchWidget extends StatefulWidget {
  const ThemeSwitchWidget({super.key});

  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [
              Icon(Icons.dark_mode, color: accentColor.value),
              Expanded(child: Text("Dark mode")),
              Switch.adaptive(
                value: isDarkModeNotifier.value,
                onChanged: (bool value) {
                  setState(() {
                    isDarkModeNotifier.value = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
