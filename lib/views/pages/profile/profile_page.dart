import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';
import 'package:kontrole/logic/auth_service.dart';
import 'package:kontrole/logic/page_manager.dart';
import 'package:kontrole/views/pages/settings/personal_info_page.dart';
import 'package:kontrole/views/pages/settings/theme_page.dart';
import 'package:kontrole/views/widgets/settings/section_widget.dart';
import 'package:kontrole/views/widgets/settings/settings_button_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:kontrole/views/pages/profile/set_picture_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
        print(error);
      }
    }

    Color secondaryTextColor = Theme.of(
      context,
    ).colorScheme.onSurface.withValues(alpha: 0.6);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 10,
              children: [
                Material(
                  color:
                      isDarkModeNotifier.value == false
                          ? Colors.grey[300]
                          : Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      spacing: 20,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SetPicturePage(),
                                  ),
                                );
                              },
                              child: Stack(
                                children: [
                                  InkWell(
                                    child: CircleAvatar(
                                      radius: 56,
                                      backgroundColor: accentColor.value,
                                      child: CircleAvatar(
                                        radius: 54,
                                        child: Text(
                                          "${AuthService().currentUser?.displayName?.split(' ')[0][0]}${AuthService().currentUser?.displayName?.split(' ')[1][0]}",
                                          style: TextStyle(fontSize: 54),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: CircleAvatar(
                                      radius: 17,
                                      backgroundColor: accentColor.value,
                                      child: Icon(Icons.edit, size: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),                       
                            Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    Text(
                                      AuthService().currentUser?.displayName ??
                                          "Unknown User",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 10,
                                  children: [
                                    Text(
                                      AuthService().currentUser?.email ??
                                          "Unknown Email",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.favorite),
                                Text(
                                  "10",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Likes",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.comment),
                                Text(
                                  "10",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Comments",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.post_add),
                                Text(
                                  "10",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Posts",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SectionWidget(
                  title: "Personalisation",
                  children: [
                    SettingsButtonWidget(
                      title: "Edit profile",
                      icon: Icons.person,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PersonalInfoPage()),
                        );
                      },
                    ),
                    SettingsButtonWidget(
                      title: "Theme",
                      icon: Icons.color_lens,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThemePage()),
                        );
                      },
                    ),
                    SettingsButtonWidget(
                      title: "Language",
                      icon: Icons.language,
                      chevron: false,
                    ),
                  ],
                ),
                SectionWidget(
                  title: "Security",
                  children: [
                    SettingsButtonWidget(title: "Passwords", icon: Icons.key),      
                  ],
                ),
                SectionWidget(
                  title: "About",
                  children: [
                    SettingsButtonWidget(
                      title: "App version",
                      icon: Icons.apps,
                      chevron: false,
                      rightText: "1.0.0",
                    ),
                    SettingsButtonWidget(
                      title: "Contact and support",
                      icon: Icons.phone,
                      chevron: false,
                    ),
                  ],
                ),
                SectionWidget(
                  title: "Logout",
                  children: [
                    SettingsButtonWidget(
                      title: "Logout",
                      icon: Icons.logout,
                      chevron: false,
                      color: Colors.red,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Column(
                                children: [
                                  Lottie.asset(
                                    "assets/lotties/logout.json",
                                    height: 250,
                                  ),
                                  Text(
                                    "Are you logging out?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              content: Text(
                                "You can always log back in at any time.",
                              ),
                              actions: [
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancel"),
                                ),
                                FilledButton(
                                  onPressed: logout,
                                  child: Text("Log out"),
                                ),
                              ],
                              actionsAlignment: MainAxisAlignment.spaceEvenly,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
