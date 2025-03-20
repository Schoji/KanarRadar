import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
            destinations: [
              NavigationDestination(label: "Home", icon: Icon(Icons.home)),
              NavigationDestination(label: "Maps", icon: Icon(Icons.map)),
            ],
            selectedIndex: selectedPage,
            onDestinationSelected: (int value) {
              selectedPageNotifier.value = value;
            },
          );
      },
    );
  }
}