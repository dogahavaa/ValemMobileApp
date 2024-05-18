// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:valem_application/widgets/background.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Üye Kayıt"),
        centerTitle: false,
        titleSpacing: 50,
        backgroundColor: const Color(0xFFF8EDEB),
        elevation: 0.005,
        shadowColor: Colors.black,
      ),
      body: _content(),
    );
  }
}

Widget _content() {
  return Stack(
    children: <Widget>[
      BackgroundWidget(),
      SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 10,
          ),
          child: Column(
            children: <Widget>[
              _MyTextFormField(fieldText: "Otopark Adı"),
              _MyTextFormField(fieldText: "Telefon Numarası"),
              _MyTextFormField(fieldText: "Mail Adresi"),
              _MyTextFormField(fieldText: "Şifre"),
              _MyTextFormField(fieldText: "Şifre Tekrar"),
              SizedBox(height: 30),
              OutlinedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 253, 239, 228),
                  shadowColor: Colors.brown,
                  elevation: 1,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
                child: const Text(
                  "Otopark Üye Girişi",
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 16,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

class _MyTextFormField extends StatelessWidget {
  final String fieldText;
  const _MyTextFormField({required this.fieldText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        // Validator ekle
        decoration: InputDecoration(
            label: Text(
              fieldText,
              style: TextStyle(color: Colors.brown, fontSize: 14),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.brown),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.brown))),
      ),
    );
  }
}
