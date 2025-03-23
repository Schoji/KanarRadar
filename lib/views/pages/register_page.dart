import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:kontrole/app_logic/auth_service.dart';
import 'package:kontrole/app_logic/page_manager.dart';

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
    final authService = Provider.of<AuthService>(context, listen: false);

    if (formKey.currentState!.validate()) {
      try {
        await authService.createAccount(
          email: controllerEmail.text.trim(),
          password: controllerPassword.text.trim(),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PageManager()),
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controllerEmail,
                  decoration: InputDecoration(hintText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Podaj email";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllerPassword,
                  decoration: InputDecoration(hintText: "Hasło"),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Hasło musi mieć min. 6 znaków";
                    }
                    return null;
                  },
                ),
                FilledButton(onPressed: register, child: Text("Zarejestruj")),
                Text(errorMessage, style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
