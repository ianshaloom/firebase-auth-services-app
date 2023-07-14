import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final navigatorKey = GlobalKey<NavigatorState>();

  Future signOut() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16.0),
                Text('Signing Out...'),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      await FirebaseAuth.instance.signOut();
      navigateToMainPage();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Close the dialog
      Utils.showSnackBar(context, e.code.toString());
      return;
    }
  }

  void navigateToMainPage() {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/main_page/',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),        
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: signOut,
              child: Text(
                'sign out',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Successful as',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              user.email!,
              style: GoogleFonts.poppins(
                fontSize: 27,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
