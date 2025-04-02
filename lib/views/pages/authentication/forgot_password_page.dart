import 'package:flutter/material.dart';
import 'package:kontrole/views/widget_tree.dart';
import 'package:kontrole/logic/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:kontrole/views/pages/authentication/login_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController controllerEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  void dispose() {
    controllerEmail.dispose();
    super.dispose();
  }

  void resetXD() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => WidgetTree()),
      (route) => false,
    );
  }

  void sendEmailWithPassword() async {
    // walidacja z formularza
    final authService = Provider.of<AuthService>(context, listen: false);
    await authService.resetPassword(email: controllerEmail.text.trim());
    // jakaś wiadomość ze email zostal wyslany ??
    popPage();
  }

  void popPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            //SizedBox???x
            spacing: 10,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: Center(
                  child: Text("Logo", style: TextStyle(fontSize: 48)),
                ),
              ),
              TextField(
                controller: controllerEmail,
                decoration: InputDecoration(
                  hintText: "Your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onEditingComplete: () {
                  setState(() {});
                },
              ),

              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.0),
                ),
                onPressed: sendEmailWithPassword,
                child: Text("Change password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
