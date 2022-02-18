import 'package:flutfolio/components/side_menu.dart';
import 'package:flutfolio/models/certification.dart';
import 'package:flutfolio/models/contact.dart';
import 'package:flutfolio/models/person.dart';
import 'package:flutfolio/models/project.dart';
import 'package:flutfolio/models/project_image.dart';
import 'package:flutfolio/models/tags.dart';
import 'package:flutfolio/models/trajectory.dart';
import 'package:flutfolio/pages/certifications_page.dart';
import 'package:flutfolio/pages/contact_page.dart';
import 'package:flutfolio/pages/projects_page.dart';
import 'package:flutfolio/pages/trajectory_page.dart';
import 'package:flutfolio/utils/image_helper.dart';
import 'package:flutfolio/utils/routes.dart';
import 'package:flutfolio/utils/video_helper.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final person = Person(
    projects: [
      Project(
        title: 'Tela login Tinder',
        description: 'Reprodução de tela do aplicativo Tinder.',
        gitUrl: 'https://github.com/ademir2011/flutter_playground/tree/master/lib/screens/mockups',
        projectImages: [
          ProjectImage(
            urlImage: 'https://drive.google.com/uc?export=view&id=1HCG2x_-RHrjBNnAQhHrqcRwyqlvbsMRS',
          ),
        ],
        videoUrl: 'https://drive.google.com/uc?export=view&id=1s-0lK1jPYUWGl0vFoEX-zh2Ov3mZeu8e',
        tags: [
          Tags(title: 'gradient'),
          Tags(title: 'richText'),
        ],
      ),
      Project(
        title: 'Tela aplicação financeira',
        description: 'Reprodução de tela de um aplicativo financeiro.',
        gitUrl: 'https://github.com/ademir2011/flutter_playground/tree/master/lib/screens/mockups',
        projectImages: [
          ProjectImage(
            urlImage: 'https://drive.google.com/uc?export=view&id=1v-hzI9-5ZYE3ak1gqW8kV5adibkmd0KP',
          ),
        ],
        videoUrl: 'https://drive.google.com/uc?export=view&id=1kHp9qtruJYd5pGcMgy0nM-KSz4_jueEn',
        tags: [],
      ),
      Project(
        title: 'Animação implícita e controlada 1',
        description:
            'Criando uma animação implícita com widgets de animações levando um botão flutuante ao topo central e replicando a animação utilizando animação controlada.',
        gitUrl: 'https://github.com/ademir2011/flutter_playground/tree/master/lib/screens/animations',
        projectImages: [
          ProjectImage(
            urlImage: 'https://drive.google.com/uc?export=view&id=1g-JXibyP8gepneCUU3MgDfmj9_3Utc2i',
          ),
          ProjectImage(
            urlImage: 'https://drive.google.com/uc?export=view&id=1FMm8pULQQ9AQC10Jlk3y4q4mV7bg06n0',
          ),
        ],
        videoUrl: 'https://drive.google.com/uc?export=view&id=1VC10xmR4g_Ppekh6X_Y6r_5ULCKhIiUp',
        tags: [
          Tags(title: 'animações implícitas'),
          Tags(title: 'animações controladas'),
        ],
      ),
      Project(
        title: 'Animação implícita e controlada 2',
        description:
            'Criando uma animação implícita com widgets de animações igual ao ExpandedList apenas com widgets de animações de forma implícita e replicando a animação utilizando animação controlada.',
        gitUrl: 'https://github.com/ademir2011/flutter_playground/tree/master/lib/screens/animations',
        projectImages: [
          ProjectImage(
            urlImage: 'https://drive.google.com/uc?export=view&id=1mk8wGzW1HLLr2g33-wFSE0MGt4jZaXF2',
          ),
          ProjectImage(
            urlImage: 'https://drive.google.com/uc?export=view&id=1mMJd6Uf4E9Gto0kPW_PpMFkk9kYYNME6',
          ),
        ],
        videoUrl: 'https://drive.google.com/uc?export=view&id=1cGcc7gfIXr6GXrFqQ8zV_zsFUsI3Nqnc',
        tags: [
          Tags(title: 'animações implícitas'),
          Tags(title: 'animações controladas'),
        ],
      ),
      Project(
        title: 'Aplicativo portifólio masterclass',
        description:
            'Criando um aplicativo a partir do mockup apresentado para listagem dos exercícios realizados e apresentação pessoal da masterclass de Flutter com o professor Jacob Moura.',
        gitUrl: 'https://github.com/ademir2011/flutter_playground',
        projectImages: [
          ProjectImage(
            urlImage: 'https://drive.google.com/uc?export=view&id=1o2uhz3D3pParE5aWBTKgxKWyruyDqjxB',
          ),
          ProjectImage(
            urlImage: 'https://drive.google.com/uc?export=view&id=1ehEb6qvcFqtzLIW8FAp_bdZ-P68TMcMk',
          ),
          ProjectImage(
            urlImage: 'https://drive.google.com/uc?export=view&id=12neho7mlbdd3M2c9GJ1Vx6nJGvw4I-b7',
          ),
          ProjectImage(
            urlImage: 'https://drive.google.com/uc?export=view&id=1WQhvkqwD_xeEhBX-CBa8rx3pnh0vU84A',
          ),
          ProjectImage(
            urlImage: 'https://drive.google.com/uc?export=view&id=1H7zzwaohWryv4PilTcgQNcIhHmYqrznS',
          ),
        ],
        videoUrl: 'https://drive.google.com/uc?export=view&id=1RE2Zkq-jjLxmAlY4boo3QB1FLGchhMlG',
        tags: [
          Tags(title: 'Temas'),
          Tags(title: 'Navegação'),
          Tags(title: 'Componentização'),
        ],
      ),
    ],
    trajectories: [
      Trajectory(
        position: 'Desenvolvedor full stack - Java/Spring/Flutter',
        entepriseName: 'NuT - Núcleo de Tecnologia',
        startDate: DateTime.parse('2021-01-01'),
        endDate: DateTime.parse('2021-09-01'),
        tasks: [
          'Desenvolvendo sistemas da área de saúde com as tecnologias Java/Spring, além de realizar manutenção em sistema mobile Android utilizando a tecnologia Flutter.',
        ],
      ),
      Trajectory(
        entepriseName: 'Instituto Metrópole Digital - UFRN',
        position: 'Desenvolvedor Full Stack',
        startDate: DateTime.parse('2019-07-01'),
        endDate: DateTime.parse('2020-12-01'),
        tasks: [
          'Trabalho relacionado a pós-graduação com o objetivo de desenvolver e prestar manutenção em sistemas do próprio instituto utilizando as tecnologias Spring/Java/Html/Css/JS/Ajax/Jquery/Gitlab/Git/Postgresql/PGadmin/Selenium/VSCode.',
        ],
      ),
      Trajectory(
        entepriseName: 'CTIS Tecnologia',
        position: 'Analista de Service Desk',
        startDate: DateTime.parse('2017-07-01'),
        endDate: DateTime.parse('2018-12-01'),
        tasks: [
          'Empresa prestadora de serviços de TI. Minha função era atuar como nível 1 no suporte remoto auxiliando usuários com dificuldades em utilizar os sistemas de sua empresa.',
        ],
      ),
      Trajectory(
        entepriseName: 'One Dreams',
        position: 'Desenvolvedor Mobile | Android/Groovy/Grails',
        startDate: DateTime.parse('2016-04-01'),
        endDate: DateTime.parse('2017-01-01'),
        tasks: [
          'Startup iniciada com um grupo de 5 jovens empreendedores e apaixonados por inovação focada no desenvolvimento de soluções de TI para empresas fornecendo para estas o desenvolvimento de sistemas, manutenção e criação de novos módulos para aplicações já existentes',
        ],
      ),
    ],
    certifications: [
      Certification(
        title: 'Lógica de Programação com Dart',
        description: 'Curso especializado no ensino de lógica de programação utilizando a linguagem Dart.',
        imageUrl: 'https://drive.google.com/uc?export=view&id=1V3tjCRdYacuOJ--331cOlDdGRryXT9NQ',
      ),
    ],
    contact: Contact(
      name: 'Ademir Bezerra da Silva Júnior',
      birthDate: DateTime(1995, 9, 17),
      city: 'Parnamirim',
      state: 'Rio Grande do Norte',
      number: '+5584994282929',
      githubUrl: 'https://github.com/ademir2011',
      linkedinUrl: 'https://www.linkedin.com/in/ademir-bezerra/',
    ),
  );

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final routes = {
      RoutesName.PROJETOS: ProjectsPage(projects: person.projects),
      RoutesName.TRAJETORIA: TrajetoryPage(trajectories: person.trajectories),
      RoutesName.CERTIFICACOES: CertificationsPage(certifications: person.certifications),
      RoutesName.CONTATO: ContactPage(
        contact: person.contact,
      ),
    };

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Row(
        children: [
          SizedBox(
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
                top: 50,
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
                      return ProjectsPage(
                        projects: person.projects,
                      );
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
