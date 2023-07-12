import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "javascript",
              style: GoogleFonts.koulen(
                  color: Theme.of(context).colorScheme.primary, fontSize: 30),
            ),
            RatingBar.builder(
              ignoreGestures: true,
              initialRating: 4.5,
              unratedColor: Color.fromRGBO(230, 222, 236, 1),
              direction: Axis.horizontal,
              itemSize: 20,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
              itemBuilder: (context, _) => Icon(
                Icons.circle,
                color: Color.fromRGBO(202, 168, 228, 1),
              ),
              onRatingUpdate: (rating) {},
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "typescript",
              style: GoogleFonts.koulen(
                  color: Theme.of(context).colorScheme.primary, fontSize: 30),
            ),
            RatingBar.builder(
              unratedColor: Color.fromRGBO(230, 222, 236, 1),
              ignoreGestures: true,
              initialRating: 4,
              direction: Axis.horizontal,
              itemSize: 20,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
              itemBuilder: (context, _) => Icon(
                Icons.circle,
                color: Color.fromRGBO(202, 168, 228, 1),
              ),
              onRatingUpdate: (rating) {},
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "django",
              style: GoogleFonts.koulen(
                  color: Theme.of(context).colorScheme.primary, fontSize: 30),
            ),
            RatingBar.builder(
              unratedColor: Color.fromRGBO(230, 222, 236, 1),
              ignoreGestures: true,
              initialRating: 4,
              direction: Axis.horizontal,
              itemSize: 20,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
              itemBuilder: (context, _) => Icon(
                Icons.circle,
                color: Color.fromRGBO(202, 168, 228, 1),
              ),
              onRatingUpdate: (rating) {},
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "flutter",
              style: GoogleFonts.koulen(
                  color: Theme.of(context).colorScheme.primary, fontSize: 30),
            ),
            RatingBar.builder(
              unratedColor: Color.fromRGBO(230, 222, 236, 1),
              ignoreGestures: true,
              initialRating: 4,
              direction: Axis.horizontal,
              itemSize: 20,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
              itemBuilder: (context, _) => Icon(
                Icons.circle,
                color: Color.fromRGBO(202, 168, 228, 1),
              ),
              onRatingUpdate: (rating) {},
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ".net",
              style: GoogleFonts.koulen(
                  color: Theme.of(context).colorScheme.primary, fontSize: 30),
            ),
            RatingBar.builder(
              unratedColor: Color.fromRGBO(230, 222, 236, 1),
              ignoreGestures: true,
              initialRating: 3,
              direction: Axis.horizontal,
              itemSize: 20,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
              itemBuilder: (context, _) => Icon(
                Icons.circle,
                color: Color.fromRGBO(202, 168, 228, 1),
              ),
              onRatingUpdate: (rating) {},
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "docker",
              style: GoogleFonts.koulen(
                  color: Theme.of(context).colorScheme.primary, fontSize: 30),
            ),
            RatingBar.builder(
              unratedColor: Color.fromRGBO(230, 222, 236, 1),
              ignoreGestures: true,
              initialRating: 3.5,
              direction: Axis.horizontal,
              itemSize: 20,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
              itemBuilder: (context, _) => Icon(
                Icons.circle,
                color: Color.fromRGBO(202, 168, 228, 1),
              ),
              onRatingUpdate: (rating) {},
            )
          ],
        )
      ],
    );
  }
}
