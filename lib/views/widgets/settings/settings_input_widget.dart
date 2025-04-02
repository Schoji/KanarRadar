import 'package:flutter/material.dart';

class SettingsInputWidget extends StatelessWidget {
  const SettingsInputWidget({super.key, required this.title, required this.textController});

  final TextEditingController textController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [
              Expanded(child: Text(title)),
              SizedBox(
                width: 200,
                height: 20,
                child: TextField(
                  controller: textController,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 10),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
