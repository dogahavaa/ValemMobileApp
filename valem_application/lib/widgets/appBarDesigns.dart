import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrownValemAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BrownValemAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "VALEM",
        style: GoogleFonts.montserrat(
          color: Colors.brown,
          fontWeight: FontWeight.bold,
          letterSpacing: 4,
        ),
      ),
      centerTitle: true,
      titleSpacing: 50,
      backgroundColor: const Color(0xFFF8EDEB),
      elevation: 0.005,
      shadowColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
