import 'package:flutfolio/components/side_menu.dart';
import 'package:flutfolio/pages/certifications_page.dart';
import 'package:flutfolio/pages/contact_page.dart';
import 'package:flutfolio/pages/projects_page.dart';
import 'package:flutfolio/pages/trajectory_page.dart';
import 'package:flutfolio/utils/routes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final routes = {
      RoutesName.PROJETOS: const ProjectsPage(),
      RoutesName.TRAJETORIA: const TrajetoryPage(),
      RoutesName.CERTIFICACOES: const CertificationsPage(),
      RoutesName.CONTATO: const ContactPage(),
    };

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Row(
        children: [
          Container(
            width: 300,
            child: SideMenu(
              navigatorKey: navigatorKey,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                top: 150,
              ),
              child: Navigator(
                initialRoute: RoutesName.TRAJETORIA,
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (ctx) {
                      for (var key in routes.keys) {
                        if (key == settings.name) {
                          return routes[key] as Widget;
                        }
                      }
                      return const ProjectsPage();
                    },
                    settings: settings,
                  );
                },
                key: navigatorKey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
