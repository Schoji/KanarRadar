import 'package:flutter/material.dart';
import 'package:kontrole/data/constants.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.username,
    required this.city,
    required this.timestamp,
    required this.content,
    required this.likeScore,
    this.profileImage = const AssetImage(KImages.defaultProfileImage),
  });

  final String username;
  final String city;
  final DateTime timestamp;
  final String content;
  final int likeScore;
  final AssetImage profileImage;

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
                    "${DateTime.now().difference(timestamp).inMinutes} minutes ago",
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
                IconButton(icon: Icon(Icons.heart_broken), onPressed: () {}),
                Text(likeScore.toString()),
                IconButton(icon: Icon(Icons.heart_broken), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
