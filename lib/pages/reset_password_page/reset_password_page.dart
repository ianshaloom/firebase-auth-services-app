import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/utils.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final _emailControlller = TextEditingController();

  Future resetPassword() async {
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
                Text('Sending password reset link...'),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailControlller.text.trim());
      navigateToMainPage();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Close the dialog
      Utils.showSnackBar(context, e.code.toString());
      return;
    }
  }

  void navigateToMainPage() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  void dispose() {
    _emailControlller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Enter your email to receive a password reset link',
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsetsDirectional.all(20),
            height: 60,
            decoration: BoxDecoration(
              color: const Color.fromARGB(120, 231, 231, 231),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              controller: _emailControlller,
              textInputAction: TextInputAction.next,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                fontSize: 17,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Email Address',
                icon: Icon(Icons.email),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
          ),
          MaterialButton(
            onPressed: resetPassword,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: const Color.fromARGB(255, 199, 235, 179),
            child: Text(
              'Send Link',
              style: GoogleFonts.montserrat(
                fontSize: 23,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
