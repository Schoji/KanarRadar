import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kontrole/app_logic/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

  void register() async {
    if (formKey.currentState!.validate()) {
      try {
        await authService.value.createAccount(
          email: controllerEmail.text.trim(),
          password: controllerPassword.text.trim(),
        );
      } on FirebaseAuthException catch (error) {
        setState(() {
          errorMessage = error.message ?? "There is an error";
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
                width: 200,
                height: 200,
                color: Colors.red,
                child: Center(
                  child: Text("Logo", style: TextStyle(fontSize: 48)),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    // potem trzeba bedzie zrobic osobna classe dla inputu tekstowego bo tak porządek w codzie
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
                      onEditingComplete: () {
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      controller: controllerPassword,
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
                      onEditingComplete: () {
                        setState(() {});
                      },
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.0),
                ),
                onPressed: () {
                  register();
                },
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
