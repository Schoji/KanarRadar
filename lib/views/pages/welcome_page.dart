import 'package:flutter/material.dart';
import 'package:kontrole/views/pages/onboarding_page.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lotties/welcome.json", height: 250),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 50.0),
              ),
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingPage()),
                  ),
              child: Text("Welcome to Kanar Radar"),
            ),
          ],
        ),
      ),
    );
  }
}
