import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio/providers/projects_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Slider extends StatefulWidget {
  const Slider({super.key, required this.provider});
  final ProjectsProvider provider;
  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  List<String> chosenList = [];
  // @override
  // void initState() {

  //   super.initState();
  // }

  int activeIndex = 0;

  List<String> listGeneral = [
    "assets/nowaste_desktop_login.png",
    "assets/gs_doc_home.png",
    "assets/myo_home.png",
    "assets/carrinho_nowaste.png",
    "assets/contributors_nowaste.png",
    "assets/potfolio_contatos.png",
    "assets/database.png",
    "assets/dashboard_nowaste.png",
    "assets/gs_doc_code.png",
    "assets/myo_code.png",
    "assets/portfolio_home.png",
    "assets/portfolio_project.png",
  ];

  List<String> listNw = [
    "assets/carrinho_nowaste.png",
    "assets/contributors_nowaste.png",
    "assets/dashboard_nowaste.png",
    "assets/nowaste_desktop_login.png",
  ];

  List<String> listGs = [
    "assets/database.png",
    "assets/gs_doc_code.png",
    "assets/gs_doc_home.png",
  ];

  List<String> listMYO = [
    "assets/myo_code.png",
    "assets/myo_home.png",
  ];
  List<String> listPort = [
    "assets/portfolio_home.png",
    "assets/portfolio_project.png",
    "assets/potfolio_contatos.png",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var p = widget.provider;
    if (p.nwOpen) {
      chosenList = listNw;
    } else if (p.gsOpen) {
      chosenList = listGs;
    } else if (p.myoOpen) {
      chosenList = listMYO;
    } else if (p.portOpen) {
      chosenList = listPort;
    } else {
      chosenList = listGeneral;
    }

    return ListenableBuilder(
        listenable: widget.provider,
        builder: (context, child) {
          return SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                    itemCount: chosenList.length,
                    itemBuilder: (context, index, realIndex) {
                      final image = chosenList[index];
                      return buildImage(image, index);
                    },
                    options: CarouselOptions(
                      height: size.height > 620 ? 250 : 150,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    )),
                const SizedBox(
                  height: 12,
                ),
                buildIndicator(),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          );
        });
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: ExpandingDotsEffect(
          dotWidth: 8,
          dotHeight: 8,
          activeDotColor: Theme.of(context).colorScheme.primary,
        ),
        activeIndex: activeIndex,
        count: chosenList.length,
      );
}

Widget buildImage(String urlImage, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Image(
        image: AssetImage(urlImage),
        fit: BoxFit.cover,
      ),
    );
