import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';

class CitySelectionWidget extends StatefulWidget {
  const CitySelectionWidget({super.key});

 static List<String> cities = [
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

  static List<DropdownMenuItem<String>> citiesEntries =
      List<DropdownMenuItem<String>>.generate(
    cities.length,
    (index) => DropdownMenuItem(
      value: cities[index],
      child: Text(cities[index]),
    ),
  );

  @override
  State<CitySelectionWidget> createState() => _CitySelectionWidgetState();
}

class _CitySelectionWidgetState extends State<CitySelectionWidget> {
  String selectedCity = selectedCityNotifier.value; 
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonFormField<String>(
            value: selectedCity,
            items: CitySelectionWidget.citiesEntries,
            onChanged: (value) {
              setState(() {
                selectedCity = value!;
                selectedCityNotifier.value = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
