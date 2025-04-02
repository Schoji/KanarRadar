import 'package:flutter/material.dart';
import 'package:kontrole/logic/auth_service.dart';
import 'package:kontrole/views/pages/authentication/delete_account_page.dart';
import 'package:kontrole/views/pages/settings/change_name_page.dart';
import 'package:kontrole/views/widgets/settings/section_widget.dart';
import 'package:kontrole/views/widgets/settings/settings_button_widget.dart';
import 'package:kontrole/views/widgets/settings/settings_title_widget.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"), centerTitle: false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SettingsTitleWidget(
                title: "Edit profile",
                icon: Icons.person,
                description:
                    "Manage your personal information and account settings, such as updating your username, changing your password, editing your details, or deleting your account.",
              ),
              SectionWidget(
                children: [
                  SettingsButtonWidget(
                    title: "Name",
                    rightText:
                        AuthService().currentUser?.displayName ??
                        "Unknown user",
                        onTap: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNamePage(),
                        ),
                      );
                        },
                  ),

                  SettingsButtonWidget(
                    title: "Email",
                    rightText:
                        AuthService().currentUser?.email ?? "Unknown user",
                  ),
                  SettingsButtonWidget(
                    title: "Delete your account",
                    icon: Icons.delete,
                    color: Colors.red,
                    chevron: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeletaccountPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
