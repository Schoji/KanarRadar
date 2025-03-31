import 'package:flutter/material.dart';
import 'package:kontrole/logic/page_manager.dart';
import 'package:kontrole/data/notifiers.dart';
import 'package:kontrole/logic/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();
  bool wasOpenedBefore = prefs.getBool('wasOpenedBefore') ?? false;

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthService())],
      child: MyApp(wasOpenedBefore: wasOpenedBefore),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool wasOpenedBefore;

  const MyApp({super.key, required this.wasOpenedBefore});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: accentColor,
      builder: (context, accent, child) {
        return ValueListenableBuilder(
          valueListenable: isDarkModeNotifier,
          builder: (context, isDarkMode, child) {
            return MaterialApp(
              title: 'Kanar Radar',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: accentColor.value,
                  brightness: isDarkMode ? Brightness.dark : Brightness.light,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: PageManager(wasOpenedBefore: wasOpenedBefore),
            );
          },
        );
      },
    );
  }
}
