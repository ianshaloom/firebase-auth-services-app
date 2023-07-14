import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({
    super.key,
    required this.onPressed,
    required this.passwordReset,
  });

  final emailControlller = TextEditingController();
  final passwordController = TextEditingController();
  final Function onPressed;
  final Function passwordReset;

  void signInUser() {
    final email = emailControlller.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    print(email);

    onPressed(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(0, 255, 168, 168),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 10),
                height: 55,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(120, 231, 231, 231),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: emailControlller,
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
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 10),
                height: 55,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(120, 231, 231, 231),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    icon: Icon(Icons.lock),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                  onSubmitted: (String value) {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Forgot Password? ',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    onPressed: () => passwordReset(),
                    child: Text(
                      'Reset',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 30, right: 30, bottom: 10),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 199, 235, 179),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: signInUser,
                  child: Text(
                    'Login Now',
                    style: GoogleFonts.montserrat(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
