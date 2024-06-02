import 'package:flutter/material.dart';
import 'package:valem_application/main.dart';
import 'package:valem_application/services/auth_services.dart';
import 'package:valem_application/widgets/appBarDesigns.dart';
import 'package:valem_application/widgets/background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  signIn() {
    MyAuthService()
        .signInEmail(
            mail: mailController.text, password: passwordController.text)
        .then((user) {
      try {
        print(user!.uid.toString());
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
            (route) => false);
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BrownValemAppBar(),
      body: Stack(
        children: <Widget>[
          const BackgroundWidget(),
          Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    //height: double.infinity,
                    child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 25,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Image.asset('lib/assets/images/Logo_With_Text.png'),
                      const SizedBox(height: 40),
                      TextFormField(
                        style:
                            TextStyle(color: Color.fromARGB(255, 40, 28, 24)),
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
                      const SizedBox(height: 30),
                      TextFormField(
                        style:
                            TextStyle(color: Color.fromARGB(255, 40, 28, 24)),
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
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: signIn,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          backgroundColor: Color.fromARGB(255, 255, 246, 240),
                          shadowColor: Colors.brown,
                          elevation: 1,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
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
                )),
              ],
            ),
          )
        ],
      ),
    );
  }

  InputDecoration customInputDecoration(String fieldText) {
    return InputDecoration(
        label: Text(
          fieldText,
          style: const TextStyle(color: Colors.brown, fontSize: 14),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.brown),
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.brown)));
  }

  bool isValidEmail(String email) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }
}
