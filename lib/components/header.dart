import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:portfolio/components/gradient_painter.dart';

class Header extends StatefulWidget {
  const Header({super.key, required this.page, required this.pageController});
  final int page;
  final LiquidController pageController;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Widget desktopNavigator() {
      return Container(
        child: Row(children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.pageController.animateToPage(page: 0, duration: 400);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                    color: widget.page == 0
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Início",
                  style: GoogleFonts.karla(
                    textStyle: TextStyle(
                        color: widget.page == 0 ? Colors.white : Colors.black,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.pageController.animateToPage(page: 1, duration: 400);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                    color: widget.page == 1
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Projetos",
                  style: GoogleFonts.karla(
                    textStyle: TextStyle(
                        color: widget.page == 1 ? Colors.white : Colors.black,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.pageController.animateToPage(page: 2, duration: 400);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                    color: widget.page == 2
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Contato",
                  style: GoogleFonts.karla(
                    textStyle: TextStyle(
                        color: widget.page == 2 ? Colors.white : Colors.black,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.pageController.animateToPage(page: 3, duration: 400);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                    color: widget.page == 3
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Sobre mim",
                  style: GoogleFonts.karla(
                    textStyle: TextStyle(
                        color: widget.page == 3 ? Colors.white : Colors.black,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ]),
      );
    }

    Widget mobileHeader() {
      return Container(
        child: AppBar(
          titleSpacing: 0,
          shape: Border(
              bottom: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 4)),
          title: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text("Gustavo da Costa e Silva"),
          ),
        ),
      );
    }

    Widget desktopHeader() {
      return SizedBox(
        height: 60,
        width: size.width,
        child: CustomPaint(
          painter: GradientBorderPainter(
            gradientColors: [
              Theme.of(context).colorScheme.primary,
              widget.page == 0
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary
            ],
            strokeWidth: 4.0,
          ),
          child: Container(
            // decoration: BoxDecoration(
            //   border: Border(
            //     bottom: BorderSide(color: LinearGradient(colors: ), width: 4),
            //   ),

            // ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Gustavo da Costa e Silva",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                desktopNavigator(),
              ],
            ),
          ),
        ),
      );
    }

    return size.width < 700 ? mobileHeader() : desktopHeader();
  }
}
