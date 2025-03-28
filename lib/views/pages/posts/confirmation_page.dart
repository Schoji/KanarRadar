import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';
import 'package:kontrole/logic/auth_service.dart';
import 'package:kontrole/logic/database_service.dart';
import 'package:kontrole/views/widgets/posts/post_widget.dart';

class ConfirmPost extends StatelessWidget {
  final String description;
  final String location;
  final String direction;

  const ConfirmPost({
    super.key,
    required this.description,
    required this.location,
    required this.direction,
  });

  void publishPost(BuildContext context) {
    DatabaseService().create(
      path: "post",
      data: {
        'username':
            AuthService().currentUser?.displayName ?? "Nieznany użytkownik",
        "timestamp": DateTime.now().toString(),
        "description": description,
        "line": location,
        "likescore": 0,
        "location": selectedCityNotifier.value,
        "direction": direction,
      },
    );
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm your post"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FilledButton(
              onPressed: () => publishPost(context),
              child: Text("Post"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PostWidget(
          id: "temp_id",
          username:
              AuthService().currentUser?.displayName ?? "Nieznany użytkownik",
          city: selectedCityNotifier.value,
          timestamp: DateTime.now(),
          content: description,
          likeScore: 0,
        ),
      ),
    );
  }
}
