import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';
import 'package:kontrole/logic/auth_service.dart';
import 'package:kontrole/logic/database_service.dart';
import 'package:kontrole/views/widget_tree.dart';
import 'package:kontrole/data/constants.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  bool? locationChecked = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerDescription = TextEditingController();
    TextEditingController controllerLocation = TextEditingController();
    TextEditingController controllerDirection = TextEditingController();

    Color secondaryTextColor = Theme.of(
      context,
    ).colorScheme.onSurface.withValues(alpha: 0.6);

    void publishPost() {
      DatabaseService().create(
        path: "post",
        data: {
          'username':
              AuthService().currentUser?.displayName ?? "Nieznany uzytkownik",
          "timestamp": DateTime.now().toString(),
          "description": controllerDescription.text,
          "line": controllerLocation.text,
          "likescore": 0,
          "location": selectedCityNotifier.value,
          "direction": controllerDirection.text,
        },
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WidgetTree()),
        (route) => false,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add your post",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FilledButton(onPressed: publishPost, child: Text("Post")),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            spacing: 20,
            children: [
              Row(
                spacing: 20,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(KImages.defaultProfileImage),
                    radius: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "nomad213",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text("9:41", style: TextStyle(color: secondaryTextColor)),
                    ],
                  ),
                ],
              ),

              TextField(
                controller: controllerDescription,
                minLines: 5,
                maxLines: 20,
                decoration: InputDecoration(
                  hintText: "Description",
                  labelStyle: TextStyle(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Optional fields",
                    style: TextStyle(color: secondaryTextColor),
                  ),
                  Icon(Icons.arrow_drop_down_sharp, color: secondaryTextColor),
                ],
              ),
              TextField(
                controller: controllerLocation,
                decoration: InputDecoration(
                  labelText: "Line",
                  labelStyle: TextStyle(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              TextField(
                controller: controllerDirection,
                decoration: InputDecoration(
                  labelText: "Direction",
                  labelStyle: TextStyle(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text("Share your location"),
                    Checkbox(
                      value: locationChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          locationChecked = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
