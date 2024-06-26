import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valem_application/widgets/appBarDesigns.dart';
import 'package:valem_application/widgets/background.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BrownValemAppBar(),
      body: content(context),
    );
  }
}

Widget content(BuildContext context) {
  return Stack(children: [
    const BackgroundWidget(),
    SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        //physics: AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Merhaba",
                style: GoogleFonts.montserrat(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Hesabınıza giriş yapabilir veya üye olarak aramıza katılabilirsiniz..",
              style: GoogleFonts.montserrat(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/loginScreen');
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text(
                      "Otopark Üye Girişi",
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 16,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  //padding: EdgeInsets.symmetric(vertical: 50),
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registerScreen');
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text(
                      "Otopark Kayıt Et",
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 16,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  ]);
}
