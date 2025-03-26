import 'package:flutter/material.dart';
import 'package:kontrole/views/pages/forgotpassword_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:kontrole/app_logic/auth_service.dart';
import 'package:kontrole/app_logic/page_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void login() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    if (formKey.currentState!.validate()) {
      try {
        await authService.signIn(
          email: controllerEmail.text.trim(),
          password: controllerPassword.text.trim(),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PageManager(wasOpenedBefore: true),
          ),
        );
      } on FirebaseAuthException catch (error) {
        setState(() {
          errorMessage = error.message ?? "Wystąpił błąd";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            spacing: 10,
            children: [
              Container(
                child: Center(
                  child: Image.asset(
                    'assets/lotties/byczek.jpeg',
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    // nazwa

                    // e-mail
                    TextFormField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "E-mail jest wymagany";
                        }
                        if (!RegExp(
                          r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
                        ).hasMatch(value)) {
                          return "Podaj poprawny e-mail";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // hasło
                    TextFormField(
                      controller: controllerPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Hasło jest wymagane";
                        }
                        if (value.length < 6) {
                          return "Hasło musi mieć co najmniej 6 znaków";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // powtórz hasło
                  ],
                ),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.0),
                ),
                onPressed: login,
                child: Text("Log in"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotpasswordPage(),
                    ),
                  );
                },
                child: Text("Forgot password?"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
