import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return BottomAppBar(
          child: Column(
            spacing: 5,
            children: [
              // Divider(height: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      selectedPageNotifier.value = 0;
                    },
                    color: selectedPage == 0 ? Colors.teal : Colors.grey,
                  ),
                  IconButton(
                    icon: Icon(Icons.map),
                    onPressed: () {
                      selectedPageNotifier.value = 1;
                    },
                    color: selectedPage == 1 ? Colors.teal : Colors.grey,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, size: 30),
                      onPressed: () {
                        selectedPageNotifier.value = 2;
                      },
                      color:  Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      selectedPageNotifier.value = 3;
                    },
                    color: selectedPage == 3 ? Colors.teal : Colors.grey,
                  ),
                  IconButton(
                    icon: Icon(Icons.person_2_rounded),
                    onPressed: () {
                      selectedPageNotifier.value = 4;
                    },
                    color: selectedPage == 4 ? Colors.teal : Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}