import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

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
              child: const TextField(
                //controller: _fname,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  fontSize: 17,
                ),
                decoration: InputDecoration(
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
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '_errorTextMessage',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
              child: Container(
                height: 55,
                width: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 199, 235, 179)),
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
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
