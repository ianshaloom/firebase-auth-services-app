import 'package:authapp/model/validate_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/utils.dart';
import '../../model/validate_email.dart';
import '../homepage/widgets/homepage.dart';
import 'widgets/login_widget.dart';
import 'widgets/signup_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  late final String username;

  int _pageIndex = 0;

  void setSignupPage() {
    setState(() {
      _pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void setLoginPage() {
    setState(() {
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void newPageIndex(int value) {
    setState(() {
      _pageIndex = value;
    });
  }

  // Email Validation
  late String _emailError = '';
  late String _passwordError = '';
  Color _errorColor = Colors.transparent;
  void validateCredentials(String email, String password) {
    setState(() {
      if (!EmailValidator.validate(email)) {
        _emailError = 'Please Validate Email';
        _errorColor = Colors.red;
      }
      if (!PasswordValidator.validate(password)) {
        _passwordError = 'Please Validate Password';
        _errorColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 20),
                height: 180,
                child: _pageIndex == 0 ? _buildPad1() : _buildPad2(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        setLoginPage();
                      },
                      child: Text(
                        'I Am An Old User /',
                        style: GoogleFonts.montserrat(
                          color: _pageIndex == 0
                              ? Colors.black
                              : Colors.grey.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setSignupPage();
                      },
                      child: Text(
                        'Create New',
                        style: GoogleFonts.montserrat(
                          color: _pageIndex == 1
                              ? Colors.black
                              : Colors.grey.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //----------------------------->>>>>>>
              SizedBox(
                height: 400,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) => newPageIndex(value),
                  children: [
                    LoginWidget(
                      onPressed: signIn,
                    ),
                    SignupWidget(
                      onPressed: createNewUser,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPad1() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey',
                style: GoogleFonts.marcellus(
                  fontSize: 60,
                ),
              ),
              Text(
                'Login Here Now',
                style: GoogleFonts.marcellus(
                  fontSize: 30,
                ),
              ),
            ],
          ),
          /* Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                CupertinoIcons.exclamationmark_circle,
                color: _errorColor,
              ),
              FittedBox(
                child: Text(
                  _emailError,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  _passwordError,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ) */
        ],
      ),
    );
  }

  Widget _buildPad2() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Glad',
                style: GoogleFonts.marcellus(
                  fontSize: 60,
                ),
              ),
              Text(
                'You Are Joining Us',
                style: GoogleFonts.marcellus(
                  fontSize: 30,
                ),
              ),
            ],
          ),
          /* Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                CupertinoIcons.exclamationmark_circle,
                color: _errorColor,
              ),
              FittedBox(
                child: Text(
                  _emailError,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  _passwordError,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ) */
        ],
      ),
    );
  }

  bool isEmailVerified = false;
  final navigatorKey = GlobalKey<NavigatorState>();

  Future checkEmailVerified() async {
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified == false) {
      navigateToEmailVerification();
    }
  }

  Future signIn(String email, String password) async {
    validateCredentials(email, password);
    print(password);
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
                Text('Loging In...'),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        navigateToEmailVerification();
        return; // Return here to prevent further navigation
      }

      navigateToHomePage();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Close the dialog
      Utils.showSnackBar(context, e.code.toString());
      return;
    }
  }

  Future createNewUser(String email, String password,
      [String name = 'User']) async {
    validateCredentials(email, password);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        // Add a WillPopScope to handle back button press
        onWillPop: () async => false,
        child: Dialog(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16.0),
                Text('Signing Up...'),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      username = name;

      navigateToEmailVerification();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Close the dialog
      Utils.showSnackBar(context, e.code.toString());
      return;
    }
  }

  // Navigations
  void navigateToHomePage() {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed('/home_page/');
  }

  void navigateToEmailVerification() {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed('/verify_email_page/');
  }
}
