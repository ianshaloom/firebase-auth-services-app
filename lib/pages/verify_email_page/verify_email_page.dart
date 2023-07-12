import 'package:flutter/material.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50.0),
              ),
              icon: const Icon(
                Icons.email,
                size: 32,
              ),
              label: const Text(
                'Resend Email',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                
              },
              //onPressed: canResendEmail ? sendVerificationEmail : null,
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 24),
              ),
              // Within the SecondRoute widget
              onPressed: () {
                //FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}