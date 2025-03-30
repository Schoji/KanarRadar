import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kontrole/logic/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:kontrole/logic/page_manager.dart';

import 'package:kontrole/data/constants.dart';

class ChangepasswordPage extends StatefulWidget {
  const ChangepasswordPage({super.key});

  @override
  State<ChangepasswordPage> createState() => _ChangepasswordPageState();
}

class _ChangepasswordPageState extends State<ChangepasswordPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerCurrentPassword = TextEditingController();
  TextEditingController controllerNewPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerCurrentPassword.dispose();
    controllerNewPassword.dispose();
    super.dispose();
  }

  void changePassword() {}

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
              Text("Change password"),
              Center(
                child: SvgPicture.asset(
                  KImages.changeImage,
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
                      controller: controllerCurrentPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Current Password",
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

                    // nowe haslo
                    TextFormField(
                      controller: controllerCurrentPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "New Password",
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
                  ],
                ),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.0),
                ),
                onPressed: changePassword,
                child: Text("Change"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
