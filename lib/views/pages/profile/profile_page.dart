import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';
import 'package:kontrole/views/widgets/settings/section_widget.dart';
import 'package:kontrole/views/widgets/settings/settings_button_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                          spacing: 60,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 54,
                              child: Text("J", style: TextStyle(fontSize: 54)),
                            ),
                            Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    Text(
                                      "John Doe",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 10,
                                  children: [Text("John.doe@wp.pl")],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Likes"),
                            Text("Comments"),
                            Text("Shares"),
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
                    ),
                    SettingsButtonWidget(
                      title: "Theme",
                      icon: Icons.color_lens,
                    ),
                    SettingsButtonWidget(
                      title: "Language",
                      icon: Icons.language,
                      chevron: false,
                    ),

                    //todo zaimplementować mozliwosc wlasnego koloru akcentowego
                    //todo zobacz co to listview, moe ci się przydać
                  ],
                ),
                SectionWidget(
                  title: "Security",
                  children: [
                    SettingsButtonWidget(title: "Passwords", icon: Icons.key),
                    SettingsButtonWidget(
                      title: "Delete your account",
                      icon: Icons.delete,
                      color: Colors.red,
                      chevron: false,
                    ),
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
