import 'package:flutter/material.dart';
import 'package:kontrole/views/pages/forgotpassword_page.dart';
import 'package:kontrole/views/widget_tree.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

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
              TextField(
                controller: controllerEmail,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              TextField(
                controller: controllerPassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.0),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => WidgetTree()),
                    (route) => false,
                  );
                },
                child: Text("Log in"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotpasswordPage()),
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
