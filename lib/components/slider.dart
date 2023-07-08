import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Slider extends StatefulWidget {
  const Slider({super.key, required this.project});
  final String project;
  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  late final List<String> chosenList;
  @override
  void initState() {
    if (widget.project == "nowaste") {
      chosenList = listNw;
    } else if (widget.project == "gs") {
      chosenList = listGs;
    } else {
      chosenList = listMYO;
    }

    super.initState();
  }

  int activeIndex = 0;

  List<String> listNw = [
    "assets/dashboard_nowaste_desktop.png",
    "assets/nowaste_login_desktop.png",
    "assets/nowste_mobile_cart.png"
  ];

  List<String> listGs = [
    "assets/gs_banco_de_dados.png",
    "assets/gs_banco_de_dados1.png",
    "assets/gs_doc_json.png",
    "assets/gs_doc_rotas.png",
  ];

  List<String> listMYO = [
    "assets/mto_doc_init.png",
    "assets/myo_doc_json.png",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: ExpandingDotsEffect(
          dotWidth: 10,
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
