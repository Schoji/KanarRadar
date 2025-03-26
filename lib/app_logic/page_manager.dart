import 'package:flutter/material.dart';
import 'package:kontrole/app_logic/auth_service.dart';
import 'package:kontrole/views/pages/welcome_page.dart';
import '../views/pages/app_loading_page.dart';
import 'package:kontrole/views/widget_tree.dart';

// flutter_pro - lib - app - mobile - auth_service.dart
class PageManager extends StatelessWidget {
  const PageManager({super.key, this.pageIfNotConnected});

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = AppLoadingPage();
            } else if (snapshot.hasData) {
              widget = const WidgetTree();
            } else {
              widget = pageIfNotConnected ?? const WelcomePage();
            }
            return widget;
          },
        );
      },
    );
  }
}
