import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/login_widget.dart';
import 'widgets/signup_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();

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
                  children: const [
                    LoginWidget(),
                    SignupWidget(),
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
      child: Column(
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
    );
  }

  Widget _buildPad2() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
      ),
      child: Column(
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
    );
  }
}
