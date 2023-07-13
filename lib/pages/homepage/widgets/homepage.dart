import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Text(
          '     Login\nSuccessful',
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
