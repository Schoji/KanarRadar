import 'package:flutter/material.dart';
import 'package:kontrole/views/pages/posts/confirmation_page.dart';

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

    void goToConfirmationPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => ConfirmPost(
                description: controllerDescription.text,
                location: controllerLocation.text,
                direction: controllerDirection.text,
              ),
        ),
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
            child: FilledButton(
              onPressed: goToConfirmationPage,
              child: Text("Next"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            spacing: 20,
            children: [
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
