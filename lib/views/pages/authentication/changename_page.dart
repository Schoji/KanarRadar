import 'package:flutter/material.dart';
import 'package:kontrole/logic/auth_service.dart';
import 'package:provider/provider.dart';

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

  void changeName() async {}

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
