import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';

List<Color> colors = [
  Colors.red,
  Colors.amber,
  Colors.blue,
  Colors.teal,
  Colors.pink,
];

String getColorName(Color color) {
  Map<Color, String> colorNames = {
    Colors.red: "Red",
    Colors.amber: "Amber",
    Colors.blue: "Blue",
    Colors.teal: "Teal",
    Colors.pink: "Pink",
  };

  return colorNames[color] ?? "Custom Color";
}

class ColorSelectionWidget extends StatefulWidget {
  const ColorSelectionWidget({super.key});

  @override
  State<ColorSelectionWidget> createState() => _ColorSelectionWidgetState();
}

class _ColorSelectionWidgetState extends State<ColorSelectionWidget> {
  Color? selectedColor = accentColor.value;
  

  @override
  Widget build(BuildContext context) {
    Color secondaryTextColor = Theme.of(
      context,
    ).colorScheme.onSurface.withValues(alpha: 0.6);
    List<Widget> colorTiles = List.generate(colors.length, (index) {
      return SizedBox(
        width: 30,
        child: RadioListTile<Color>(
          value: colors[index],
          fillColor: WidgetStateProperty.all(colors[index]),
          groupValue: selectedColor,
          onChanged: changeColor,
        ),
      );
    });

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: colorTiles,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [Icon(Icons.color_lens, color: selectedColor), Expanded(child: Text("Selected color")), Text(getColorName(selectedColor!), style: TextStyle(color: secondaryTextColor))],
          ),
        ],
      ),
    );
  }

  void changeColor(Color? value) {
    setState(() {
      selectedColor = value;
      accentColor.value = value!;
    });
  }
}
