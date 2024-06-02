import 'package:flutter/material.dart';
import 'package:valem_application/services/auth_services.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Valem"),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.account_circle),
            color: Colors.white,
          ),
        ],
      ),
      body: _content(context),
    );
  }
}

Widget _content(BuildContext context) {
  String mail = MyAuthService().getUser();

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text("Hello, $mail"),
        ],
      ),
    ),
  );
}
