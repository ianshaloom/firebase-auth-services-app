import 'package:flutter/material.dart';

import 'pages/mainpage/main_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Auth App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
