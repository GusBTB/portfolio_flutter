import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/utils.dart' as utils;

class ContactCards extends StatefulWidget {
  const ContactCards({super.key});

  @override
  State<ContactCards> createState() => _ContactCardsState();
}

class _ContactCardsState extends State<ContactCards> {
  @override
  Widget build(BuildContext context) {
    var ut = utils.Utils();
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ]),
          height: 90,
          width: ut.recoverSize(context),
          child: Row(
            children: [
              Container(
                width: 90,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 114, 177, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                    child: FaIcon(
                  FontAwesomeIcons.linkedinIn,
                  color: Colors.white,
                )),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "LinkedIn",
                    style: GoogleFonts.karla(
                      textStyle: const TextStyle(
                        // height: 0.8,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    "Veja detalhes da minha jornada",
                    style: GoogleFonts.karla(
                      textStyle: TextStyle(
                        // height: 0.8,
                        color: Colors.black,
                        fontSize: size.width < 394
                            ? size.width < 351
                                ? size.width < 323
                                    ? 9
                                    : 10
                                : 12
                            : 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () async {
                        await launchUrl(Uri.parse(
                            'https://www.linkedin.com/in/gustavo-gcs/'));
                      },
                      child: Text(
                        "Ver meu perfil",
                        style: GoogleFonts.karla(
                          textStyle: const TextStyle(
                            // height: 0.8,
                            color: Colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ]),
          height: 90,
          width: ut.recoverSize(context),
          child: Row(
            children: [
              Container(
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                    child: FaIcon(
                  FontAwesomeIcons.github,
                  color: Colors.white,
                )),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "GitHub",
                    style: GoogleFonts.karla(
                      textStyle: const TextStyle(
                        // height: 0.8,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    "Projetos detalhados",
                    style: GoogleFonts.karla(
                      textStyle: const TextStyle(
                        // height: 0.8,
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () async {
                        await launchUrl(Uri.parse('https://github.com/GusBTB'));
                      },
                      child: Text(
                        "Ver GitHub",
                        style: GoogleFonts.karla(
                          textStyle: const TextStyle(
                            // height: 0.8,
                            color: Colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ]),
          height: 90,
          width: ut.recoverSize(context),
          child: Row(
            children: [
              Container(
                width: 90,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(37, 211, 102, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                    child: FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.white,
                )),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "WhatsApp",
                    style: GoogleFonts.karla(
                      textStyle: const TextStyle(
                        // height: 0.8,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    "Vamos conversar",
                    style: GoogleFonts.karla(
                      textStyle: const TextStyle(
                        // height: 0.8,
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () async {
                        await launchUrl(
                            Uri.parse('https://wa.me/5511972750808'));
                      },
                      child: Text(
                        "Mandar mensagem",
                        style: GoogleFonts.karla(
                          textStyle: const TextStyle(
                            // height: 0.8,
                            color: Colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
