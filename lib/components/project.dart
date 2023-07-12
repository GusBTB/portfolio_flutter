import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/providers/projects_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/components/slider.dart' as slider;
import 'package:url_launcher/url_launcher.dart';

class Project extends StatefulWidget {
  Project(
      {super.key,
      required this.list,
      required this.text,
      required this.provider,
      required this.description,
      required this.desktopDescription,
      required this.btnsList});
  ProjectsProvider provider;
  String description;
  String desktopDescription;
  List<Map<String, dynamic>> btnsList;
  String text;
  List<dynamic> list;
  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  var ut = Utils();

  String currentProject() {
    if (widget.text[0] == "N") {
      return "nowaste";
    } else if (widget.text[0] == "G") {
      return "gs";
    } else if (widget.text[0] == "M") {
      return "myo";
    } else {
      return "port";
    }
  }

  bool isOpen() {
    if (widget.text[0] == "N") {
      return widget.provider.nwOpen;
    } else if (widget.text[0] == "G") {
      return widget.provider.gsOpen;
    } else if (widget.text[0] == "M") {
      return widget.provider.myoOpen;
    } else {
      return widget.provider.portOpen;
    }
  }

  getProvider(context) {
    if (widget.text[0] == "N") {
      widget.provider.setNwOpen();
    } else if (widget.text[0] == "G") {
      widget.provider.setGsOpen();
    } else if (widget.text[0] == "M") {
      widget.provider.setMyoOpen();
    } else {
      widget.provider.setPortOpen();
    }
  }

  Widget unselectedProject(context) {
    return Container(
      width: ut.recoverSize(context),
      decoration: BoxDecoration(
        borderRadius: isOpen()
            ? const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))
            : BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primary,
        boxShadow: isOpen()
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.text,
                  style: GoogleFonts.karla(
                    textStyle: const TextStyle(
                      // height: 0.8,
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      // getProvider();
                      setState(() {
                        getProvider(context);
                      });
                    },
                    child: FaIcon(
                      color: Colors.white,
                      isOpen()
                          ? FontAwesomeIcons.chevronUp
                          : FontAwesomeIcons.chevronDown,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Row(
                  children: widget.list.asMap().entries.map((e) {
                    return Padding(
                      padding: e.key > 0
                          ? const EdgeInsets.only(left: 10)
                          : const EdgeInsets.only(left: 0),
                      child: e.value,
                    );
                  }).toList(),
                ),
                const Expanded(child: SizedBox()),
                Row(
                  children: widget.btnsList.asMap().entries.map((e) {
                    return Container(
                      height: 26,
                      padding: e.key > 0
                          ? const EdgeInsets.only(left: 5)
                          : const EdgeInsets.only(left: 0),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, // thickness
                                    color: Colors.white // color
                                    ),
                                // border radius
                                borderRadius: BorderRadius.circular(7))),
                        onPressed: () async {
                          await launchUrl(Uri.parse(e.value["url"]));
                        },
                        icon: e.value["icon"],
                        label: Text(
                          e.value["text"],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ), // <-- Text
                      ),
                    );
                  }).toList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget selectedProject(context) {
    return Container(
      width: ut.recoverSize(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          unselectedProject(context),
          Container(
            width: ut.recoverSize(context),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Text(
                  widget.description,
                  softWrap: true,
                  style: GoogleFonts.karla(
                    fontSize: 16,
                  ),
                )),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            width: ut.recoverSize(context),
            child: slider.Slider(
              provider: widget.provider,
            ),
          ),
        ],
      ),
    );
  }

  Widget desktopSelectedProject(context) {
    return Container(
      width: ut.recoverSize(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          unselectedProject(context),
          Container(
            height: 309,
            width: ut.recoverSize(context),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                )),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.description,
                      style: GoogleFonts.karla(
                          fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "contribuidores",
                          style: GoogleFonts.koulen(
                            fontSize: 22,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(
                          widget.desktopDescription,
                          style: GoogleFonts.karla(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return size.width < 900
        ? isOpen()
            ? selectedProject(context)
            : unselectedProject(context)
        : isOpen()
            ? desktopSelectedProject(context)
            : unselectedProject(context);
  }
}
