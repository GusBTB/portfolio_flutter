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
    with TickerProviderStateMixin {
  late AnimationController _opacityAnimationController;
  late AnimationController _animationController;
  double _circleWidth = 150.0;
  late double _circleRadiusTL;
  late double _circleRadiusTR;
  late double _circleRadiusBL;
  late double _circleRadiusBR;
  late double _circleHeight;
  double _initialHW = 150;
  double xPosition = 0;
  late Animation<double> _opacityAnimation;
  @override
  void initState() {
    super.initState();
    _circleRadiusTL = _circleWidth;
    _circleRadiusTR = _circleWidth;
    _circleRadiusBR = _circleWidth;
    _circleRadiusBL = _circleWidth;
    _circleHeight = _circleWidth;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _opacityAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2900),
      vsync: this,
    );

    _opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_opacityAnimationController);

    _animationController.addListener(() {
      setState(() {
        double maxX = MediaQuery.of(context).size.width - _circleWidth;
        xPosition = (_animationController.value * maxX);
        _circleWidth = 150 + (_animationController.value * (maxX / 2));
        _circleHeight = 150 +
            (_animationController.value * MediaQuery.of(context).size.height);
        _circleRadiusTR =
            _circleWidth - (_animationController.value * _circleWidth);
        _circleRadiusBR =
            _circleWidth - (_animationController.value * _circleWidth);
      });
    });

    _animationController.forward();
    _opacityAnimationController.forward();
  }

  @override
  void dispose() {
    // Dispose o AnimationController ao final
    _animationController.dispose();
    _opacityAnimationController.dispose();
    // _animationController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var ut = utils.Utils();

    Widget mobileLanding({mobile = true}) {
      return ListView(
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
              if (mobile)
                const SizedBox(
                  height: 50,
                ),
              if (mobile)
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
                              color:
                                  Theme.of(context).colorScheme.primary // color
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
                      await launchUrl(Uri.parse('https://github.com/GusBTB'));
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
                      await launchUrl(Uri.parse('https://wa.me/5511972750808'));
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
                            cursor: "_", speed: Duration(milliseconds: 400)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    }

    Widget desktopLanding() {
      return Stack(children: [
        Container(
          color: Colors.white,
          width: size.width,
          height: size.height,
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Positioned(
              top: 0,
              left: xPosition,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.pageController
                          .animateToPage(page: 1, duration: 400);
                      widget.page = 1;
                    });
                  },
                  child: Container(
                    width: _circleWidth,
                    height: _circleHeight,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(_circleRadiusTL),
                          topRight: Radius.circular(_circleRadiusTR),
                          bottomLeft: Radius.circular(_circleRadiusBL),
                          bottomRight: Radius.circular(_circleRadiusBR)),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          top: 100,
          left: 150,
          height: 480,
          width: 380,
          child: mobileLanding(mobile: false),
        ),
        Positioned(
          top: (size.height / 2) - 50,
          right: 150,
          child: FadeTransition(
            opacity: _opacityAnimationController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "VER PROJETOS",
                  style: GoogleFonts.koulen(
                    textStyle: const TextStyle(
                      height: 0.8,
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white,
                  size: 50,
                )
              ],
            ),
          ),
        ),
      ]);
    }

    return size.width > 1000
        ? desktopLanding()
        : Container(
            color: Colors.white,
            width: size.width,
            padding: EdgeInsets.only(
                top: 15,
                left: (size.width - ut.recoverSize(context)) / 2,
                right: (size.width - ut.recoverSize(context)) / 2),
            child: mobileLanding(),
          );
  }
}
