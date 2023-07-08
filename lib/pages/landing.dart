import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/utils/utils.dart' as utils;

class LandingPage extends StatefulWidget {
  LandingPage({super.key, required this.page, required this.pageController});
  int page;
  LiquidController pageController;
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _objectY = 0.0;
  final double _gravity = 9.8;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    final Tween<double> _tween = Tween(begin: 0.0, end: 11.0);
    _animation = _tween
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _animation.addListener(() {
      setState(() {
        _objectY = _objectY > 100
            ? (_gravity * _animation.value * _animation.value) / 2
            : 100;
      });
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var ut = utils.Utils();

    return Container(
      color: Colors.white,
      width: size.width,
      child: Center(
        child: Container(
          width: ut.recoverSize(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/eufoto.jpg"))),
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      // ),
                      SizedBox(
                        width: ut.recoverSize(context) - 65,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "FULL-STACK",
                            style: GoogleFonts.koulen(
                              textStyle: TextStyle(
                                height: 0.8,
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 50,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                  SizedBox(
                    width: ut.recoverSize(context),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "DEVELOPER",
                        style: GoogleFonts.koulen(
                          textStyle: TextStyle(
                            height: 0.8,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 50,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.pageController
                            .animateToPage(page: 1, duration: 400);
                        widget.page = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: ut.paddingResponsive(context)),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 2, // thickness
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary // color
                                ),
                            // border radius
                            borderRadius: BorderRadius.circular(7))),
                    child: Text(
                      "Ver Projetos",
                      style: GoogleFonts.karla(
                        textStyle: TextStyle(
                          // height: 0.8,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text(
                        "CONTATOS",
                        style: GoogleFonts.koulen(
                          textStyle: const TextStyle(
                            height: 0.8,
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          await launchUrl(
                              Uri.parse('https://github.com/GusBTB'));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          height: 40,
                          width: 40,
                          child: const Center(
                              child: FaIcon(
                            color: Colors.white,
                            FontAwesomeIcons.github,
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              'https://mail.google.com/mail/u/0/#inbox?compose=GTvVlcSBpgcmKnkwxGmMvqPvFQcCPFfpmmdZJmdRwPXXrqNSRpPhDMgzFKvggzsgnRZDfQQmzRfTk'));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          height: 40,
                          width: 40,
                          child: const Center(
                              child: FaIcon(
                            color: Colors.white,
                            FontAwesomeIcons.envelope,
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              'https://www.linkedin.com/in/gustavo-gcs/'));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          height: 40,
                          width: 40,
                          child: const Center(
                              child: FaIcon(
                            color: Colors.white,
                            FontAwesomeIcons.linkedinIn,
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await launchUrl(
                              Uri.parse('https://wa.me/5511972750808'));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          height: 40,
                          width: 40,
                          child: const Center(
                              child: FaIcon(
                            size: 28,
                            color: Colors.white,
                            FontAwesomeIcons.whatsapp,
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: SizedBox(
                      width: 260.0,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontFamily: 'Cascadia Mono',
                          fontWeight: FontWeight.w700,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText('Hello World',
                                cursor: "_",
                                speed: Duration(milliseconds: 400)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
