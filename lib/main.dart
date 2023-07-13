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
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
      routes: routess,
    ),
  );
}
