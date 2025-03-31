import 'package:flutter/material.dart';
import 'package:kontrole/logic/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:kontrole/views/widget_tree.dart';

// jakas logika ktora umozliwi zmiane nazwy np raz w tygodniu?
// zeby nie generowac zbednego ruchu

//ustawienie w calej apcje username - ktorys notifier

class ChangenamePage extends StatefulWidget {
  const ChangenamePage({super.key});

  @override
  State<ChangenamePage> createState() => _ChangenamePageState();
}

class _ChangenamePageState extends State<ChangenamePage> {
  TextEditingController controllerName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errorMessage = '';
  @override
  void dispose() {
    controllerName.dispose();
    super.dispose();
  }

  void resetXD() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => WidgetTree()),
      (route) => false,
    );
  }

  void changeName() async {
    // walidacja z formularza

    final authService = Provider.of<AuthService>(context, listen: false);
    await authService.changeUsername(username: controllerName.text.trim());

    // jakaś wiadomość ze email zostal wyslany ??
    popPage();
  }

  void popPage() {
    Navigator.pop(context);
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
              TextField(
                controller: controllerName,
                decoration: InputDecoration(
                  hintText: "Your new name",
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
                onPressed: changeName,
                child: Text("Change name"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
