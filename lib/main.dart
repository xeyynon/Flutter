import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.purple),
      darkTheme: ThemeData(
        brightness:Brightness.dark,
      ),
      initialRoute: "/home",
      routes: {
        "/":(context) => new loginPage(),
        "/home":(context) => HomePage(),
        "/login" :(context) => loginPage()
        
      },
    );
  }
}
