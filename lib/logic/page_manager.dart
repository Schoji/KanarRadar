import 'package:flutter/material.dart';
import 'package:kontrole/views/pages/welcome/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:kontrole/logic/auth_service.dart';
import 'package:kontrole/views/pages/authentication/login_page.dart';
import 'package:kontrole/views/pages/app_loading_page.dart';
import 'package:kontrole/views/widget_tree.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageManager extends StatelessWidget {
  final bool wasOpenedBefore;

  PageManager({super.key, required this.wasOpenedBefore});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoadingPage();
        } else if (snapshot.hasData) {
          return const WidgetTree();
        } else {
          return wasOpenedBefore ? const LoginPage() : const WelcomePage();
        }
      },
    );
  }
}
