import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupWidget extends StatelessWidget {
  SignupWidget({
    super.key,
    required this.onPressed,
  });

  final nameController = TextEditingController();
  final emailControlller = TextEditingController();
  final passwordController = TextEditingController();
  final Function onPressed;

  void signUpUser() {
    final name = nameController.text.trim();
    final email = emailControlller.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    print(email);

    onPressed(name, email, password);
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10),
              height: 60,
              decoration: BoxDecoration(
                color: const Color.fromARGB(120, 231, 231, 231),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  fontSize: 17,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'First Name',
                  icon: Icon(Icons.supervised_user_circle),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10),
              height: 60,
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
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10),
              height: 60,
              decoration: BoxDecoration(
                color: const Color.fromARGB(120, 231, 231, 231),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                controller: passwordController,
                textInputAction: TextInputAction.next,
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                style: const TextStyle(
                  fontSize: 17,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'New Password',
                  icon: Icon(Icons.lock),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
                onChanged: (value) {},
                onSubmitted: (String value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
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
                  onPressed: signUpUser,
                  child: Text(
                    'Sign Up',
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
