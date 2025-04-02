import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';
import 'package:kontrole/views/widgets/posts/post_widget.dart';
import 'package:kontrole/views/widgets/posts/post_type_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
              ValueListenableBuilder(
                valueListenable: selectedTypeNotifier,
                builder: (context, value, child) {
                  return StreamBuilder(
                  stream: postsRef.onValue,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData ||
                        snapshot.data?.snapshot.value == null) {
                      return CircularProgressIndicator();
                    }
                    Map<dynamic, dynamic> posts =
                        snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                    
                    List <MapEntry<dynamic, dynamic>> sortedPosts = posts.entries.toList();
                
                    if (selectedTypeNotifier.value == 0) {
                    sortedPosts.sort((a, b) {
                      DateTime timeA = a.value["timestamp"] != null
                      ? DateTime.parse(a.value["timestamp"])
                      : DateTime.fromMicrosecondsSinceEpoch(0);
                
                      DateTime timeB = b.value["timestamp"] != null
                      ? DateTime.parse(b.value["timestamp"])
                      : DateTime.fromMicrosecondsSinceEpoch(0);
                
                      return timeB.compareTo(timeA);
                    });}
                    else if (selectedTypeNotifier.value == 1){
                      sortedPosts.sort((a, b) {
                        return b.value["likescore"] > a.value["likescore"] ? 1 : 0 ;
                      },);
                    }
                    else {
                      List<MapEntry<dynamic,dynamic>> filteredPosts = posts.entries.toList();
                      sortedPosts = filteredPosts.where((element) => element.value["location"] == selectedCityNotifier.value,).toList();
                      sortedPosts.sort((a, b) {
                        return b.value["likescore"] > a.value["likescore"] ? 1 : 0 ;
                      },);
                    }
                   
                    List<Widget> postWidgets =
                        sortedPosts.map((entry) {
                          return PostWidget(
                            id: entry.key,
                            username: entry.value["username"] ?? "nic",
                            city: entry.value["location"] ?? "nic",
                            timestamp:
                                entry.value["timestamp"] != null
                                    ? DateTime.parse(entry.value["timestamp"])
                                    : DateTime.now(),
                            content: entry.value["description"] ?? "nic",
                            likeScore: entry.value["likescore"] ?? "nic",
                          );
                        }).toList();
                
                    return Column(children: postWidgets);
                  },
                );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
