import 'package:flutter/material.dart';
import 'package:portfolio/components/header.dart';
import 'package:portfolio/pages/contacts.dart';
import 'package:portfolio/pages/landing.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:portfolio/pages/projetcs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LiquidController pageController = LiquidController();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              const Header(),
              Expanded(
                child: LiquidSwipe(
                    liquidController: pageController,
                    onPageChangeCallback: (index) {
                      setState(() {
                        page = index;
                      });
                    },
                    slideIconWidget: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    // scrollDirection: Axis.horizontal,
                    pages: [
                      LandingPage(
                        page: page,
                        pageController: pageController,
                      ),
                      const Projects(),
                      const Contact(),
                      Container(
                        color: Colors.blue,
                      ),
                    ]),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            border:
                Border(top: BorderSide(width: 2, color: Colors.grey.shade300)),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController.animateToPage(page: 0, duration: 400);
                    page = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == 0
                        ? Icon(
                            Icons.home_filled,
                            color: Theme.of(context).colorScheme.primary,
                            size: 20,
                          )
                        : const Icon(
                            Icons.home_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Início",
                      style: TextStyle(
                          fontSize: 12,
                          color: page == 0
                              ? Theme.of(context).colorScheme.primary
                              : Colors.black),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController.animateToPage(page: 1, duration: 400);
                    page = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == 1
                        ? Icon(
                            Icons.psychology_alt_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 20,
                          )
                        : const Icon(
                            Icons.psychology_alt,
                            color: Colors.black,
                            size: 20,
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Projetos",
                      style: TextStyle(
                          fontSize: 12,
                          color: page == 1
                              ? Theme.of(context).colorScheme.primary
                              : Colors.black),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController.animateToPage(page: 2, duration: 400);

                    page = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == 2
                        ? Icon(
                            Icons.contact_emergency,
                            color: Theme.of(context).colorScheme.primary,
                            size: 20,
                          )
                        : const Icon(
                            Icons.contact_emergency_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Contato",
                      style: TextStyle(
                          fontSize: 12,
                          color: page == 2
                              ? Theme.of(context).colorScheme.primary
                              : Colors.black),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController.animateToPage(page: 3, duration: 400);

                    page = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == 3
                        ? Icon(
                            Icons.person,
                            color: Theme.of(context).colorScheme.primary,
                            size: 20,
                          )
                        : const Icon(
                            Icons.person_2_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Sobre mim",
                      style: TextStyle(
                          fontSize: 12,
                          color: page == 3
                              ? Theme.of(context).colorScheme.primary
                              : Colors.black),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
