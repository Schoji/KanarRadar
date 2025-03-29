import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kontrole/views/widgets/city_selection_widget.dart';
import 'package:provider/provider.dart';
import 'package:kontrole/logic/auth_service.dart';
import 'package:kontrole/logic/page_manager.dart';
import 'package:kontrole/views/pages/authentication/deletaccount_page.dart';

//temp
import 'package:kontrole/views/pages/welcome/getstarted_page.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String errorMessage = '';

  void logout() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signOut();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PageManager(wasOpenedBefore: true),
        ),
      );
    } on FirebaseAuthException catch (error) {
      setState(() {
        errorMessage = error.message ?? "Wystąpił błąd";
      });
    }
  }

  void logoutXD() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => GetstartedPage()),
    );
  }

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
                  children: [
                    CircleAvatar(radius: 30),
                    Text(AuthService().currentUser?.displayName ?? "nazwa"),
                  ],
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
                CitySelectionWidget(),
                FilledButton(onPressed: logoutXD, child: Text("Logout")),
                Spacer(),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeletaccountPage(),
                      ),
                    );
                  },
                  child: Text("Delete Account"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
