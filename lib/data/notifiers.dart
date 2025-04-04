import 'package:flutter/material.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(false);
ValueNotifier<int> selectedTypeNotifier = ValueNotifier(0);
ValueNotifier<String> selectedCityNotifier = ValueNotifier("Szczecin");
ValueNotifier<bool> surfaceInvertNotifier = ValueNotifier(false);
ValueNotifier<Color> accentColor = ValueNotifier(Colors.teal);
