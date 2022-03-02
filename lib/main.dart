import 'package:firebase_core/firebase_core.dart';
import 'package:flutfolio/src/pages/administration/auth_page.dart';
import 'package:flutfolio/src/pages/home_page.dart';
import 'package:flutfolio/src/stores/auth_store.dart';
import 'package:flutfolio/src/stores/contact_store.dart';
import 'package:flutfolio/src/stores/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerSingleton<AuthStore>(AuthStore());
  GetIt.I.registerSingleton<ContactStore>(ContactStore());
  GetIt.I.registerSingleton<ThemeStore>(ThemeStore());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeStore = GetIt.I<ThemeStore>();

  final _inicialization = Firebase.initializeApp();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    themeStore.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _inicialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeStore.typeTheme == TypeTheme.light ? ThemeMode.light : ThemeMode.dark,
            theme: ThemeData.light().copyWith(
              primaryColor: const Color(0xff0b0435),
              drawerTheme: const DrawerThemeData(
                backgroundColor: Color(0xFFf9f9f9),
              ),
              dividerTheme: DividerThemeData(
                color: const Color(0xff0b0435).withAlpha(50),
                indent: 100,
                endIndent: 100,
              ),
              textTheme: TextTheme(
                headline1: const TextStyle(
                  color: Color(0xff0b0435),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                headline2: const TextStyle(
                  color: Color(0xff0b0435),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                headline3: TextStyle(
                  color: const Color(0xff0b0435).withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                headline4: const TextStyle(
                  color: Color(0xff0b0435),
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                ),
                button: const TextStyle(
                  color: Color(0xff0b0435),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(textStyle: const TextStyle(color: Colors.red)),
              ),
              iconTheme: const IconThemeData(
                color: Color(0xff0b0435),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom().copyWith(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.hovered)) {
                        return const Color(0xFFf3f3f2);
                      } else {
                        return const Color(0xFFf9f9f9);
                      }
                    },
                  ),
                  elevation: MaterialStateProperty.resolveWith<double>((states) => 0),
                ),
              ),
              backgroundColor: const Color(0xfff3f3f2),
              cardTheme: const CardTheme(
                color: Color(0xFFf9f9f9),
              ),
              errorColor: const Color(0xFFDC3545),
            ),
            darkTheme: ThemeData.dark().copyWith(
              primaryColor: const Color(0xFFE5BE51),
              drawerTheme: const DrawerThemeData(
                backgroundColor: Color(0xff202024),
              ),
              dividerTheme: DividerThemeData(
                color: Colors.white.withAlpha(50),
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
                headline3: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                headline4: TextStyle(
                  color: Colors.white60,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                ),
                button: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(textStyle: const TextStyle(color: Colors.red)),
              ),
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
            home: const HomePage(),
            routes: {
              '/admin': (context) => const AuthPage(),
            },
          );
        } else {
          return const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
