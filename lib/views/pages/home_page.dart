import 'package:flutter/material.dart';
import 'package:kontrole/views/widgets/post_widget.dart';
import 'package:kontrole/views/widgets/posttype_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              PostWidget(
                username: "hana23",
                city: "Szczecin",
                timestamp: DateTime.now().subtract(const Duration(minutes: 20)), //! Placeholder date, needs replacement
                content: "Dwóch miłych panów na placu kościuszki linia nr 8",
                likeScore: 24,
              ),
              PostWidget(
                username: "einerjohn64",
                city: "Szczecin",
                timestamp: DateTime.now().subtract(const Duration(minutes: 2)), //! Placeholder date, needs replacement
                content: "2, ulica krzywoustego, zielone tshirty",
                profileImage: AssetImage("assets/images/profiles/3.png"),
                likeScore: 19,
              ),
              PostWidget(
                username: "paruwa32",
                city: "Szczecin",
                timestamp: DateTime.now().subtract(const Duration(minutes: 50)), //! Placeholder date, needs replacement
                content: "siema siema o tej porze kazdy wypić moze, dwóch lamusów w 3 strona chujowice dolne",
                likeScore: -5,
                profileImage: AssetImage("assets/images/profiles/1.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
