import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kontrole/logic/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:kontrole/logic/page_manager.dart';

import 'package:kontrole/data/constants.dart';

class DeletaccountPage extends StatefulWidget {
  const DeletaccountPage({super.key});

  @override
  State<DeletaccountPage> createState() => _DeletaccountPageState();
}

class _DeletaccountPageState extends State<DeletaccountPage> {
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

  void deleteAccount() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.deleteAccount(
        email: controllerEmail.text.trim(),
        password: controllerPassword.text.trim(),
      );
      popPage();
    } catch (e) {
      print(e.toString());
    }
  }

  void popPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PageManager(wasOpenedBefore: false),
      ),
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
            spacing: 10,
            children: [
              Text("Delete my account"),
              Center(
                child: SvgPicture.asset(
                  KImages.deleteAccountImage,
                  height: 100,
                  width: 100,
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
              Spacer(),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.0),
                ),
                onPressed: deleteAccount,
                child: Text("Delete Permanently"),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
