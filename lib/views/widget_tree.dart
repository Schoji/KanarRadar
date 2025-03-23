import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';
import 'package:kontrole/views/pages/addpost_page.dart';
import 'package:kontrole/views/pages/home_page.dart';
import 'package:kontrole/views/pages/map_page.dart';
import 'package:kontrole/views/pages/notifications_page.dart';
import 'package:kontrole/views/pages/profile_page.dart';
import 'package:kontrole/views/widgets/drawer_widget.dart';
import 'package:kontrole/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), MapPage(), AddPost(), NotificationsPage(), ProfilePage()];
List<String> pageLabels = ["Home", "Map", "Add post", "Notifications", "Profile"];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: selectedPageNotifier, builder:(context, value, child) {
      return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(pageLabels[value], style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        ),
      ),
      endDrawer: DrawerWidget(),
      body: pages[value],
      bottomNavigationBar: NavbarWidget(),
    );
    },);

  }
}
