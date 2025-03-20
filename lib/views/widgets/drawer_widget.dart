import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';
import 'package:kontrole/views/pages/welcome_page.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return Drawer(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Column(
                  spacing: 10,
                  children: [CircleAvatar(radius: 30), Text("John Doe")],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
                    Switch(
                      value: isDarkModeNotifier.value,
                      onChanged: (bool value) {
                        setState(() {
                          isDarkModeNotifier.value = value;
                        });
                      },
                    ),
                  ],
                ),

                FilledButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  },
                  child: Text("Logout"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
