import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:kontrole/app_logic/auth_service.dart';
import 'package:kontrole/app_logic/page_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerRepeatPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  void dispose() {
    controllerUsername.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerRepeatPassword.dispose();
    super.dispose();
  }

  void register() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    if (formKey.currentState!.validate()) {
      try {
        await authService.createAccount(
          email: controllerEmail.text.trim(),
          password: controllerPassword.text.trim(),
        );
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('wasOpenedBefore', true);

        // Pobieramy wartość wasOpenedBefore
        bool wasOpenedBefore = prefs.getBool('wasOpenedBefore') ?? false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PageManager(wasOpenedBefore: wasOpenedBefore),
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
              const SizedBox(height: 20),

              Form(
                key: formKey,
                child: Column(
                  children: [
                    // nazwa
                    TextFormField(
                      controller: controllerUsername,
                      decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Nazwa użytkownika jest wymagana";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

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
                    TextFormField(
                      controller: controllerRepeatPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Repeat Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Powtórzenie hasła jest wymagane";
                        }
                        if (value != controllerPassword.text) {
                          return "Hasła nie są identyczne";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.0),
                ),
                onPressed: register,
                child: Text("Register"),
              ),
              const SizedBox(height: 10),

              Text(errorMessage, style: TextStyle(color: Colors.redAccent)),
            ],
          ),
        ),
      ),
    );
  }
}
