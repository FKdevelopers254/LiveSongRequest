import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  VoidCallback onTap;
  MyAppBar({
    Key? key,
    required this.title,
    required this.onTap,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedTextKit(
            animatedTexts: [

              TypewriterAnimatedText(


                title,
                textStyle: GoogleFonts.bebasNeue(fontSize:40 ),
                speed: Duration(milliseconds: 2000),


              )
            ],
            totalRepeatCount: 4,
            pause: Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,

          ),



          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: Icon(
                Icons.music_video_rounded,
                size: 36,
              ),
            ),
          ),
        ],
      ) ,
    );
  }
}
