import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';
import 'package:kontrole/views/pages/home_page.dart';
import 'package:kontrole/views/pages/map_page.dart';
import 'package:kontrole/views/widgets/drawer_widget.dart';
import 'package:kontrole/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), MapPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Kanar Radar", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
      ),
      endDrawer: DrawerWidget(),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, value, child) {
          return pages[value];
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
