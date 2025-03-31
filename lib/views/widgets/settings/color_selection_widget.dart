import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';

class ColorSelectionWidget extends StatefulWidget {
  const ColorSelectionWidget({super.key});

  @override
  State<ColorSelectionWidget> createState() => _ColorSelectionWidgetState();
}

class _ColorSelectionWidgetState extends State<ColorSelectionWidget> {
  Color? selectedColor = accentColor.value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<Color>(
          title: const Text('Red'),
          activeColor: Colors.red,
          fillColor: WidgetStateProperty.all(Colors.red),
          value: Colors.red,
          groupValue: selectedColor,
          onChanged: changeColor,
        ),
        RadioListTile<Color>(
          title: const Text('Blue'),
          activeColor: Colors.blue,
          value: Colors.blue,
          fillColor: WidgetStateProperty.all(Colors.blue),
          groupValue: selectedColor,
          onChanged: changeColor,
        ),
        RadioListTile<Color>(
          title: const Text('Teal'),
          value: Colors.teal,
          fillColor: WidgetStateProperty.all(Colors.teal),
          groupValue: selectedColor,
          onChanged: changeColor,
        ),
      ],
    );
  }

  void changeColor(Color? value) {
    setState(() {
      selectedColor = value;
      accentColor.value = value!;
    });
  }
}
