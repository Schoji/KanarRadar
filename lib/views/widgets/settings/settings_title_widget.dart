import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';

class SettingsTitleWidget extends StatelessWidget {
  const SettingsTitleWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
  });

  final String title;
  final IconData icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color:
          isDarkModeNotifier.value == false
              ? Colors.grey[300]
              : Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Icon(icon, size: 64, color: accentColor.value),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(description, textAlign: TextAlign.justify),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
