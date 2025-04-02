import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:kontrole/logic/image_service.dart';

class SetPicturePage extends StatefulWidget {
  const SetPicturePage({super.key});

  @override
  State<SetPicturePage> createState() => _SetPicturePageState();
}

class _SetPicturePageState extends State<SetPicturePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ImageService>(
      builder: (context, imageService, child) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                spacing: 10,
                children: [
                  FilledButton(
                    style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity, 50.0),
                    ),
                    onPressed: () {},
                    child: Text("Set Picture"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
