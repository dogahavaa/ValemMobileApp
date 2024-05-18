import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valem_application/widgets/background.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesabım"),
        centerTitle: false,
        titleSpacing: 50,
        backgroundColor: const Color(0xFFF8EDEB),
        elevation: 0.005,
        shadowColor: Colors.black,
      ),
      body: content(),
    );
  }
}

Widget content() {
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
                    onPressed: () {},
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text(
                      "Otopark'a Üye Ol",
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
