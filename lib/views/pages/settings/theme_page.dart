import 'package:flutter/material.dart';
import 'package:kontrole/views/widgets/settings/section_widget.dart';
import 'package:kontrole/views/widgets/settings/settings_title_widget.dart';
import 'package:kontrole/views/widgets/settings/theme/color_selection_widget.dart';
import 'package:kontrole/views/widgets/settings/theme/theme_switch_widget.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

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
                title: "Theme",
                icon: Icons.color_lens,
                description:
                    "Customize the appearance of the app by selecting an accent color and switching between light and dark modes to suit your preference.",
              ),
              SectionWidget(
                children: [
                  ColorSelectionWidget(),
                  ThemeSwitchWidget(),       
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
