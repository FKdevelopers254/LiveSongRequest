import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem=1;
    double ffem=0.9;
    return Stack(



      children: [
        Container(
          decoration:  BoxDecoration (
            color:  const Color(0xff2c2c2c),
            borderRadius:  BorderRadius.only (
              bottomRight:  Radius.circular(50),
            ),
          ),

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Live Request',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 52,

                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [


                        Lottie.asset('lib/assets/icons/87952-spaceman-dj.json',height: 120,),

                      ],),
                  ],
                ),
              ),

            //  const SizedBox(height: 10,),
              Card(
                color: Colors.transparent.withOpacity(0.1),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: [
                    Lottie.asset('lib/assets/icons/6177-dj-geet.json',height: 90,),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Party With Your Favorite DJ', style: GoogleFonts.abrilFatface(fontSize: 15,),),
                              Text('Join the Party!!', style: GoogleFonts.abrilFatface(fontSize: 15,letterSpacing: 1.5),),
                            ],
                          ),
                        ),
                      ),
                    ),


                  ],),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(

                    child: Container(
                      width: 170,

                      child: Column(
                        children: [
                          Text('Request Song', style: GoogleFonts.abrilFatface(fontSize: 20),),
                          Lottie.asset('lib/assets/icons/singing.json',height: 120,),
                          Text('THEN WAIT', style: GoogleFonts.abrilFatface(fontSize: 20),),
                        ],
                      ),

                    ),
                  ),
                  //Lottie.asset('lib/assets/icons/64703-client-customization-requested.json',height: 20,),
                  Card(
                    child: Container(
                      width: 170,

                      child: Column(
                        children: [
                          Text('Song gets Played', style: GoogleFonts.abrilFatface(fontSize: 18),),
                          Lottie.asset('lib/assets/icons/musicburst.json',height: 120,),
                          Text('EARN POINTS!!', style: GoogleFonts.abrilFatface(fontSize: 20),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Card(
                color: Colors.transparent.withOpacity(0.1),
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,


                  children: [
                    Lottie.asset('lib/assets/icons/request.json',height: 90,),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,right: 8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Link Up With Requesters ', style: GoogleFonts.abrilFatface(fontSize: 19),),
                              Text('EARN POINTS', style: GoogleFonts.abrilFatface(fontSize: 20),),
                            ],
                          ),
                        ),
                      ),
                    ),


                  ],),
              ),






            ],
          ),
        ),
        Positioned(
          // ellipseblureffectwR2 (137:1380)
          left:  214*fem,
          top:  0*fem,
          child:
          ImageFiltered(
            imageFilter:  ImageFilter.blur (
              sigmaX:  114*fem,
              sigmaY:  114*fem,
            ),
            child:
            Align(
              child:
              SizedBox(
                width:  151*fem,
                height:  151*fem,
                child:
                Container(
                  decoration:  BoxDecoration (
                    borderRadius:  BorderRadius.circular(75.5*fem),
                    color:  const Color(0xff2194ff),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          // ellipseblureffectwR2 (137:1380)
          right:  214*fem,
          bottom:  0*fem,
          child:
          ImageFiltered(
            imageFilter:  ImageFilter.blur (
              sigmaX:  114*fem,
              sigmaY:  114*fem,
            ),
            child:
            Align(
              child:
              SizedBox(
                width:  151*fem,
                height:  151*fem,
                child:
                Container(
                  decoration:  BoxDecoration (
                    borderRadius:  BorderRadius.circular(75.5*fem),
                    color:  const Color(0xff2194ff),
                  ),
                ),
              ),
            ),
          ),
        ),


      ],
    );
  }
}
