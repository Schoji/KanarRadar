import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kontrole/app_logic/auth_service.dart';
import 'package:kontrole/views/pages/welcome_page.dart';
import 'package:kontrole/views/pages/app_loading_page.dart';
import 'package:kontrole/views/widget_tree.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageManager extends StatelessWidget {
  const PageManager({super.key, this.pageIfNotConnected});

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        print("Auth state changed: ${snapshot.data}");

        if (snapshot.connectionState == ConnectionState.waiting) {
          return AppLoadingPage();
        } else if (snapshot.hasData) {
          return const WidgetTree();
        } else {
          return pageIfNotConnected ?? const WelcomePage();
        }
      },
    );
  }
}
