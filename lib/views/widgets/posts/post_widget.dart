import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kontrole/data/constants.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.id,
    required this.username,
    required this.city,
    required this.timestamp,
    required this.content,
    required this.likeScore,
    this.profileImage = const AssetImage(KImages.defaultProfileImage),
  });

  final String id;
  final String username;
  final String city;
  final DateTime timestamp;
  final String content;
  final int likeScore;
  final AssetImage profileImage;

  String timeAgo(DateTime datetime) {
    Duration difference = DateTime.now().difference(timestamp);
    if (difference.inMinutes < 60) {
      if (difference.inMinutes == 0) {
        return "less than minute ago";
      }
      if (difference.inMinutes == 1) {
        return "${difference.inMinutes} minute ago";
      }
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      if (difference.inHours == 1) {
        return "${difference.inHours} hour ago";
      }
      return "${difference.inHours} hours ago";
    } else if (difference.inDays < 30) {
      if (difference.inDays == 1) {
        return "${difference.inDays} day ago";
      }
      return "${difference.inDays} days ago";
    } else if (difference.inDays >= 30 && difference.inDays < 365) {
      if (difference.inDays == 30) {
        return "${difference.inDays / 30} month ago";
      }
      return "${difference.inDays / 30} months ago";
    } else {
      if (difference.inDays > 365) {
        return "${difference.inDays / 365} year ago";
      }
      return "${difference.inDays / 365} years ago";
    }
  }

  @override
  Widget build(BuildContext context) {
    Color secondaryTextColor = Theme.of(
      context,
    ).colorScheme.onSurface.withValues(alpha: 0.6);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            spacing: 10,
            children: [
              CircleAvatar(radius: 16, backgroundImage: profileImage),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        username,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(" in "),
                      Text(city),
                    ],
                  ),
                  Text(
                    timeAgo(timestamp),
                    style: TextStyle(color: secondaryTextColor, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(content),
          ),
          Divider(indent: 32, endIndent: 32, height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.favorite_border_outlined), onPressed: () async {
                  DatabaseReference ref = FirebaseDatabase.instance.ref("post/$id/likescore");
                  DatabaseEvent event = await ref.once();
                  int currentLikes = (event.snapshot.value ?? 0) as int;
                  await ref.set(currentLikes + 1);
                }),
                Text(likeScore.toString()),
                IconButton(icon: Icon(Icons.heart_broken_outlined), onPressed: () async {
                  DatabaseReference ref = FirebaseDatabase.instance.ref("post/$id/likescore");
                  DatabaseEvent event = await ref.once();
                  int currentLikes = (event.snapshot.value ?? 0) as int;
                  await ref.set(currentLikes - 1);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
