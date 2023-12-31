import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components/contact_cards.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:flutter/services.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var ut = Utils();

    Widget imageAndEmail({mobile = true}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("assets/eufoto.jpg"))),
            height: mobile ? 90 : 130,
            width: mobile ? 90 : 130,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Vamos nos conectar?",
                style: GoogleFonts.karla(
                  textStyle: const TextStyle(
                    // height: 0.8,
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.7, color: Color.fromRGBO(160, 160, 160, 1)),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      SelectableText(
                        "gustavocs81@gmail.com",
                        style: GoogleFonts.karla(
                          textStyle: TextStyle(
                            // height: 0.8,
                            color: Colors.black,
                            fontSize: size.width < 344 ? 12 : 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () async {
                            await Clipboard.setData(const ClipboardData(
                                text: "gustavocs81@gmail.com"));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Copiado!")));
                          },
                          child: const Icon(
                            Icons.copy,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      );
    }

    Widget mobileContacts() {
      return Container(
        color: Colors.white,
        width: size.width,
        padding: EdgeInsets.only(
            top: size.height * 0.05,
            left: (size.width - ut.recoverSize(context)) / 2,
            right: (size.width - ut.recoverSize(context)) / 2),
        child: ListView(
          children: [
            imageAndEmail(),
            const SizedBox(
              height: 20,
            ),
            const ContactCards(),
          ],
        ),
      );
    }

    Widget desktopContact() {
      return Container(
        color: Colors.white,
        width: size.width,
        padding: EdgeInsets.only(
          top: size.height * 0.1,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 135,
              width: 400,
              child: imageAndEmail(mobile: false),
            ),
            const SizedBox(
              width: 50,
            ),
            const ContactCards()
          ],
        ),
      );
    }

    return size.width < 900 ? mobileContacts() : desktopContact();
  }
}
