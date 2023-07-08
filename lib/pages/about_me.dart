import 'package:flutter/material.dart';
import 'package:portfolio/utils/utils.dart' as utils;

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    var ut = utils.Utils();
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          vertical: 8, horizontal: (size.width - ut.recoverSize(context)) / 2),
      height: size.height,
      width: size.width,
      child: ListView(children: const [
        Text(
          "Tenho 23 anos e sou um desenvolvedor full-stack com muita vontade de aprender.\n\nMinha paixão por programação começou quando passei 4 arduos anos em engenharia química sem gostar do que estava fazendo, assim, depois de um bootcamp sobre javascript me apaixonei por programação.\n\nDecidi fazer o curso Full-Stack da Kenzie Academy, onde aprendi toda stack Javascript com React e Express, back-end em Python com Django e outras tecnologias como Docker e Git. Neste mesmo curso tive minha primeira experiência profissional como desenvolvedor, que englobava assistência técnica para os alunos em seus projetos, tirando dúvidas, aplicando testes etc.\n\nNos dias de hoje estou me formando em Flutter e .Net por conta própria, assim ampliando meu portfólio.\n\nMeu sonho é se tornar um ótimo profissional dev ops.",
          softWrap: true,
          textAlign: TextAlign.justify,
        ),
      ]),
    );
  }
}
