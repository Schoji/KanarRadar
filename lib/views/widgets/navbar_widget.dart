import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';
import 'package:kontrole/views/pages/posts/add_post_page.dart';

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
                    color: selectedPage == 0 ? accentColor.value : Colors.grey,
                  ),
                  IconButton(
                    icon: Icon(Icons.map),
                    onPressed: () {
                      selectedPageNotifier.value = 1;
                    },
                    color: selectedPage == 1 ? accentColor.value : Colors.grey,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: accentColor.value,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddPost()),
                        );
                      },
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      selectedPageNotifier.value = 3;
                    },
                    color: selectedPage == 3 ? accentColor.value : Colors.grey,
                  ),
                  IconButton(
                    icon: Icon(Icons.person_2_rounded),
                    onPressed: () {
                      selectedPageNotifier.value = 4;
                    },
                    color: selectedPage == 4 ? accentColor.value : Colors.grey,
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
