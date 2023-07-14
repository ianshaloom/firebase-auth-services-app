import 'package:authapp/pages/homepage/widgets/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'model/routes.dart';
import 'pages/mainpage/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase Init
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );

  runApp(
    MaterialApp(
      title: 'Auth App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const MainPage();
            }
          }),
      debugShowCheckedModeBanner: false,
      routes: routess,
    ),
  );
}

