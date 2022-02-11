import 'package:flutfolio/components/cbutton.dart';
import 'package:flutfolio/utils/routes.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const SideMenu({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataButtons = [
      {
        'icon': Icons.accessibility_rounded,
        'text': 'PROJETOS',
        'onPressed': () => navigatorKey.currentState!.pushNamedAndRemoveUntil(RoutesName.PROJETOS, (r) => false),
      },
      {
        'icon': Icons.accessibility_rounded,
        'text': 'TRAJETÓRIA',
        'onPressed': () => navigatorKey.currentState!.pushNamedAndRemoveUntil(RoutesName.TRAJETORIA, (r) => false),
      },
      {
        'icon': Icons.accessibility_rounded,
        'text': 'CERTIFICAÇÕES',
        'onPressed': () => navigatorKey.currentState!.pushNamedAndRemoveUntil(RoutesName.CERTIFICACOES, (r) => false),
      },
      {
        'icon': Icons.accessibility_rounded,
        'text': 'CONTATO',
        'onPressed': () => navigatorKey.currentState!.pushNamedAndRemoveUntil(RoutesName.CONTATO, (r) => false),
      }
    ];

    return Container(
      color: Theme.of(context).drawerTheme.backgroundColor,
      child: Column(children: [
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
              ),
              const SizedBox(height: 25),
              Text(
                'Ademir Bezerra',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(height: 25),
              Text(
                'Desenvolvedor Flutter',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 25),
              const Divider(),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            children: dataButtons.map<Widget>((element) {
              return Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: CButton(
                  icon: element['icon'] as IconData,
                  text: element['text'].toString(),
                  onPressed: element['onPressed'] as Function(),
                ),
              );
            }).toList(),
          ),
        ),
      ]),
    );
  }
}
