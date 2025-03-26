import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kontrole/views/pages/welcome_page.dart';
import 'package:kontrole/app_logic/auth_service.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthService())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          title: 'Kanar Radar',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const WelcomePage(),
        );
      },
    );
  }
}
