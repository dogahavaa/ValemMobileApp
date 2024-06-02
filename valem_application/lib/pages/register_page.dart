// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:valem_application/services/auth_services.dart';
import 'package:valem_application/services/models/otopark.dart';
import 'package:valem_application/widgets/appBarDesigns.dart';
import 'package:valem_application/widgets/background.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrownValemAppBar(),
      body: content(),
    );
  }
}

Widget content() {
  return Stack(
    children: const <Widget>[
      BackgroundWidget(),
      SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 25,
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Otopark Kaydı Oluştur",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.brown,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              MyForm(),
              SizedBox(height: 30),
            ],
          ),
        ),
      )
    ],
  );
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});
  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  addCarPark() {
    if (_formKey.currentState!.validate()) {
      // bu kısım düzenlenecek
      //ScaffoldMessenger.of(context)
      //    .showSnackBar(SnackBar(content: Text('Kayıt İşlemi Yapılıyor..')));

      Otopark otopark = Otopark(
          name: nameController.text.trim(),
          phone: phoneController.text.trim(),
          email: mailController.text.trim(),
          password: passwordController.text.trim(),
          creationtime: Timestamp.now());

      MyAuthService().registerWithMail(otopark).then((value) => {
            if (value)
              {
                Fluttertoast.showToast(
                    msg: 'Otopark Kaydı Tamamlandı',
                    timeInSecForIosWeb: 3,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.green,
                    toastLength: Toast.LENGTH_LONG)
              }
          });
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          //-------------- Otopark Adı --------------//
          TextFormField(
            style: TextStyle(color: Color.fromARGB(255, 40, 28, 24)),
            controller: nameController,
            decoration: customInputDecoration("Otopark Adı"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Lütfen bir 'Otopark Adı' giriniz.";
              }
              if (value.length < 6) {
                return "Otopark adınız 3 karakterden küçük olamaz";
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          //-------------- Telefon Numarası --------------//
          TextFormField(
            style: TextStyle(color: Color.fromARGB(255, 40, 28, 24)),
            controller: phoneController,
            decoration: customInputDecoration("Telefon Numarası"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Lütfen bir 'Telefon Numarası' giriniz.";
              }

              if (!RegExp(r"^0[0-9]{10}$").hasMatch(value)) {
                return 'Geçersiz telefon numarası formatı. \n(0 ile başlamalı ve 11 haneli olmalı)';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          //-------------- Mail Adresi --------------//
          TextFormField(
            style: TextStyle(color: Color.fromARGB(255, 40, 28, 24)),
            controller: mailController,
            decoration: customInputDecoration("Mail Adresi"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Lütfen bir 'E-Posta' adresi girin";
              }
              if (!isValidEmail(value)) {
                return "Geçerli bir 'E-Posta adresi' girin";
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          //-------------- Şifre --------------//
          TextFormField(
            style: TextStyle(color: Color.fromARGB(255, 40, 28, 24)),
            controller: passwordController,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "Lütfen bir 'Şifre' girin";
              }
              return null;
            },
            decoration: customInputDecoration("Şifre"),
          ),
          SizedBox(height: 15),
          //-------------- Şifre Tekrar --------------//
          TextFormField(
            style: TextStyle(color: Color.fromARGB(255, 40, 28, 24)),
            controller: confirmPasswordController,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "Lütfen şifreyi Tekrar girin";
              }
              if (value != passwordController.text) {
                return "Şifreler Uyuşmuyor";
              }
              return null;
            },
            decoration: customInputDecoration("Şifre Tekrar"),
          ),
          SizedBox(height: 35),
          //-------------- Buton --------------//
          ElevatedButton(
            onPressed: addCarPark,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              backgroundColor: Color.fromARGB(255, 255, 246, 240),
              shadowColor: Colors.brown,
              elevation: 1,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
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
    );
  }

  InputDecoration customInputDecoration(String fieldText) {
    return InputDecoration(
        label: Text(
          fieldText,
          style: TextStyle(color: Colors.brown, fontSize: 14),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.brown),
        ),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.brown)));
  }

  bool isValidEmail(String email) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }
}
