import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/utils.dart';
import '../homepage/widgets/homepage.dart';

class VerifiedPage extends StatefulWidget {
  const VerifiedPage({super.key});

  @override
  State<VerifiedPage> createState() => _VerifiedPageState();
}

class _VerifiedPageState extends State<VerifiedPage> {
  Color buttonColor = Colors.black38;
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    //user needs to be created before
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) {
          checkEmailVerified();
          buttonColor = const Color.fromARGB(255, 199, 235, 179);
        },
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 7));
      setState(() => canResendEmail = true);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(context, e.toString());
    }
  }

  Future checkEmailVerified() async {
    //call after email verification
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  /* Future signOutUser() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
  } */

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? HomePage()
      : Scaffold(
          appBar: AppBar(
            title: const Text('Verify Email Address'),
            leading: IconButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'A verification email has been sent to your email.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                MaterialButton(
                  height: 40,
                  onPressed: canResendEmail ? sendVerificationEmail : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: buttonColor,
                  child: Text(
                    'Resend Verification Link',
                    style: GoogleFonts.montserrat(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}
