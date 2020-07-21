import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const green_accent_color = Color(0xFF20CEBA);

class TopBar extends StatelessWidget {
  final String header;
  final String subheader;
  final String subheader_content;
  final bool back_button;

  TopBar(
      {this.header,
      this.subheader,
      this.subheader_content,
      this.back_button = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      width: double.infinity,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (back_button)
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    header,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (!(subheader == null))
                    Text(
                      subheader,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  if (!(subheader_content == null))
                    Text(
                      subheader_content,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 30,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF6CEEA9),
            const Color(0xFF20CEBA)
          ], // whitish to gray
          //tileMode:TileMode.clamp, // repeats the gradient over the canvas
        ),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  final String text;

  HeaderText({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
