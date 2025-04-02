import 'package:flutter/material.dart';
import 'package:kontrole/logic/auth_service.dart';
import 'package:kontrole/views/widgets/settings/section_widget.dart';
import 'package:kontrole/views/widgets/settings/settings_input_widget.dart';

class ChangeNamePage extends StatelessWidget {
  const ChangeNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(
      text: AuthService().currentUser?.displayName?.split(" ")[0] ?? "Unknown",
    );
    TextEditingController lastController = TextEditingController(
      text: AuthService().currentUser?.displayName?.split(" ")[1] ?? "Unknown",
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Name"),
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Row(children: [Icon(Icons.chevron_left), Text("Back")]),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Done"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SectionWidget(
            children: [
              SettingsInputWidget(title: "Name", textController: nameController,),
              SettingsInputWidget(title: "Last", textController: lastController,),
            ],
          ),
        ),
      ),
    );
  }
}
