import 'package:flutfolio/pages/home.dart';
import 'package:flutfolio/pages/projects_page.dart';
import 'package:flutfolio/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFFE5BE51),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xff202024),
        ),
        dividerTheme: const DividerThemeData(
          color: Color(0xFFE1E1E6),
          indent: 100,
          endIndent: 100,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          button: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        hoverColor: const Color(0xFFE5BE51),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom().copyWith(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) {
                if (states.contains(MaterialState.hovered)) {
                  return const Color(0xFFE5BE51);
                } else {
                  return const Color(0xff202024);
                }
              },
            ),
            elevation: MaterialStateProperty.resolveWith<double>((states) => 0),
          ),
        ),
        backgroundColor: const Color(0xFF121214),
        cardTheme: const CardTheme(
          color: Color(0xFF202024),
        ),
        errorColor: const Color(0xFFDC3545),
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
