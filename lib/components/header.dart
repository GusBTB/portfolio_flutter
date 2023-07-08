import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(),
        ),
      );
    }

    return size.width < 700 ? mobileHeader() : desktopHeader();
  }
}
