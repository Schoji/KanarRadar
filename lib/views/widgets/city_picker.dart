import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';

class CityPickerDropdown extends StatefulWidget {
  final TextEditingController controller;

  const CityPickerDropdown({super.key, required this.controller});

  @override
  _CityPickerDropdownState createState() => _CityPickerDropdownState();
}

class _CityPickerDropdownState extends State<CityPickerDropdown> {
  String selectedCity = selectedCityNotifier.value;

  final List<String> cities = [
    "Białystok",
    "Bydgoszcz",
    "Częstochowa",
    "Gdańsk",
    "Gliwice",
    "Gdynia",
    "Katowice",
    "Kielce",
    "Kraków",
    "Lublin",
    "Łódź",
    "Poznań",
    "Radom",
    "Rzeszów",
    "Sosnowiec",
    "Szczecin",
    "Toruń",
    "Warszawa",
    "Wrocław",
    "Zabrze",
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: "Wybierz miasto",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      value: widget.controller.text.isNotEmpty ? widget.controller.text : null,
      items:
          cities.map((city) {
            return DropdownMenuItem(value: city, child: Text(city));
          }).toList(),
      onChanged: (newValue) {
        setState(() {
          widget.controller.text = newValue!;
          selectedCity = newValue;
          selectedCityNotifier.value = newValue;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Musisz wybrać miasto";
        }
        return null;
      },
    );
  }
}
