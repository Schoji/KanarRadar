import 'package:flutter/material.dart';
import 'package:kontrole/views/pages/authentication/login_page.dart';
import 'package:kontrole/views/pages/authentication/register_page.dart';
import 'package:lottie/lottie.dart';

class GetstartedPage extends StatelessWidget {
  const GetstartedPage({super.key});

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
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  ),
              child: Text("Get started"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(double.infinity, 50.0),
              ),
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  ),
              child: Text("Already have an account? Log in"),
            ),
          ],
        ),
      ),
    );
  }
}
