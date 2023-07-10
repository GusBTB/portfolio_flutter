import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/components/project.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/providers/projects_provider.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    final ProjectsProvider provider = ProjectsProvider();
    Size size = MediaQuery.of(context).size;
    var ut = Utils();
    return ListenableBuilder(
        listenable: provider,
        builder: (context, child) {
          return Container(
            color: Colors.white,
            width: size.width,
            padding: EdgeInsets.only(
                top: 15,
                left: (size.width - ut.recoverSize(context)) / 2,
                right: (size.width - ut.recoverSize(context)) / 2),
            child: ListView(children: [
              Visibility(
                visible:
                    provider.gsOpen || provider.myoOpen || provider.portOpen
                        ? false
                        : true,
                child: Project(
                  provider: provider,
                  description:
                      "NoWaste visa a diminuição de desperdício de comida por meio de entregas flash de estabelecimentos no final do expediente. Criada com React, ContextAPI e Axios.",
                  list: const [
                    FaIcon(
                      color: Colors.white,
                      FontAwesomeIcons.js,
                    ),
                    FaIcon(
                      color: Colors.white,
                      FontAwesomeIcons.react,
                    ),
                  ],
                  text: "NoWaste - Web App",
                  btnsList: const [
                    {
                      "icon": Icon(
                        size: 20,
                        color: Colors.white,
                        FontAwesomeIcons.github,
                      ),
                      "url": "https://github.com/vih-cisne/NoWaste",
                      "text": "GitHub",
                    },
                    {
                      "icon": Icon(
                        size: 20,
                        color: Colors.white,
                        FontAwesomeIcons.share,
                      ),
                      "url": "https://final-project-blush.vercel.app/",
                      "text": "Aplicação",
                    },
                  ],
                ),
              ),
              Visibility(
                visible: provider.nwOpen ||
                        provider.myoOpen ||
                        provider.portOpen ||
                        provider.gsOpen
                    ? false
                    : true,
                child: const SizedBox(
                  height: 20,
                ),
              ),
              Visibility(
                visible:
                    provider.nwOpen || provider.myoOpen || provider.portOpen
                        ? false
                        : true,
                child: Project(
                  provider: provider,
                  description:
                      "Fornece um sistema de gerenciamento de campeonatos de e-sports com apostas em seus jogos. Criada com Python, Django e APScheduler",
                  list: const [
                    FaIcon(
                      color: Colors.white,
                      FontAwesomeIcons.python,
                    ),
                  ],
                  text: "Gamers Society - API",
                  btnsList: const [
                    {
                      "icon": Icon(
                        size: 20,
                        color: Colors.white,
                        FontAwesomeIcons.github,
                      ),
                      "url":
                          "https://github.com/gamer-society-org/gamer-society",
                      "text": "GitHub",
                    },
                    {
                      "icon": Icon(
                        size: 20,
                        color: Colors.white,
                        FontAwesomeIcons.share,
                      ),
                      "url":
                          "https://app.swaggerhub.com/apis/GUSTAVOCS81/gamers-society/1.0.0#/api",
                      "text": "Documentação",
                    },
                  ],
                ),
              ),
              Visibility(
                visible: provider.nwOpen ||
                        provider.myoOpen ||
                        provider.portOpen ||
                        provider.gsOpen
                    ? false
                    : true,
                child: const SizedBox(
                  height: 20,
                ),
              ),
              Visibility(
                visible: provider.nwOpen || provider.portOpen || provider.gsOpen
                    ? false
                    : true,
                child: Project(
                  provider: provider,
                  description:
                      "Automatização processos de uma organização pequena por meio de posts, comentários e reuniões. Criada com Node, Express, TypeScript, Postgree, TypeORM, Docker e Jest. ",
                  list: const [
                    FaIcon(
                      color: Colors.white,
                      FontAwesomeIcons.js,
                    ),
                  ],
                  text: "MYO - API",
                  btnsList: const [
                    {
                      "icon": Icon(
                        size: 20,
                        color: Colors.white,
                        FontAwesomeIcons.github,
                      ),
                      "url": "https://github.com/app-toca/apptoca",
                      "text": "GitHub",
                    },
                    {
                      "icon": Icon(
                        size: 20,
                        color: Colors.white,
                        FontAwesomeIcons.share,
                      ),
                      "url": "https://app-toca.github.io/apptoca/",
                      "text": "Documentação",
                    },
                  ],
                ),
              ),
              Visibility(
                visible: provider.nwOpen ||
                        provider.myoOpen ||
                        provider.portOpen ||
                        provider.gsOpen
                    ? false
                    : true,
                child: const SizedBox(
                  height: 20,
                ),
              ),
              Visibility(
                visible: provider.nwOpen || provider.myoOpen || provider.gsOpen
                    ? false
                    : true,
                child: Project(
                  provider: provider,
                  description: "aaugaug",
                  list: [
                    // FaIcon(
                    //   FontAwesomeIcons.flutter
                    // )
                    SvgPicture.asset(
                      'flutter_icon.svg', // Define a cor do ícone como branco
                      height: 20,
                      width: 20,
                    ),
                  ],
                  text: "Portfólio - Web App",
                  btnsList: const [
                    {
                      "icon": Icon(
                        size: 20,
                        color: Colors.white,
                        FontAwesomeIcons.github,
                      ),
                      "url": "https://github.com/GusBTB/portfolio_flutter",
                      "text": "GitHub",
                    },
                  ],
                ),
              ),
            ]),
          );
        });
  }
}
