import 'package:flutfolio/src/widgets/button_widget.dart';
import 'package:flutfolio/utils/icon_helper.dart';
import 'package:flutfolio/utils/routes.dart';
import 'package:flutter/material.dart';

class SideMenuWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const SideMenuWidget({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataButtons = [
      {
        'icon': IconHelper.getPath(IconName.projects),
        'text': 'PROJETOS',
        'onPressed': () => navigatorKey.currentState!.pushNamedAndRemoveUntil(RoutesName.PROJETOS, (r) => false),
      },
      {
        'icon': IconHelper.getPath(IconName.trajectory),
        'text': 'TRAJETÓRIA',
        'onPressed': () => navigatorKey.currentState!.pushNamedAndRemoveUntil(RoutesName.TRAJETORIA, (r) => false),
      },
      {
        'icon': IconHelper.getPath(IconName.certificate),
        'text': 'CERTIFICAÇÕES',
        'onPressed': () => navigatorKey.currentState!.pushNamedAndRemoveUntil(RoutesName.CERTIFICACOES, (r) => false),
      },
      {
        'icon': IconHelper.getPath(IconName.contact),
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
              ClipRRect(
                child: Image.asset(
                  'lib/assets/images/eu.jpg',
                  height: 125,
                  width: 125,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(100),
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
                child: ButtonWidget(
                  iconUrl: element['icon'].toString(),
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
