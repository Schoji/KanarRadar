import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kontrole/views/widgets/post_widget.dart';
import 'package:kontrole/views/widgets/posttype_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseReference postsRef = FirebaseDatabase.instance.ref().child(
    'post',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20,
            children: [
              Row(
                spacing: 10,
                children: [
                  PosttypeWidget(buttonId: 0, text: "New"),
                  PosttypeWidget(buttonId: 1, text: "Top"),
                  PosttypeWidget(buttonId: 2, text: "Near you"),
                ],
              ),
              StreamBuilder(
                stream: postsRef.onValue,
                builder: (context, snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.data?.snapshot.value == null) {
                    return CircularProgressIndicator();
                  }
                  Map<dynamic, dynamic> posts =
                      snapshot.data!.snapshot.value as Map<dynamic, dynamic>;

                  List<Widget> postWidgets =
                      posts.entries.map((entry) {
                        return PostWidget(
                          username: entry.value["username"] ?? "nic",
                          city: entry.value["location"] ?? "nic",
                          timestamp: entry.value["timestamp"] != null ? DateTime.parse(entry.value["timestamp"]) : DateTime.now(),
                          content: entry.value["description"] ?? "nic",
                          likeScore: entry.value["likescore"] ?? "nic",
                        );
                      }).toList();

                  return Column(children: postWidgets);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
