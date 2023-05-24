import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem=1;
    double ffem=0.9;
    return SafeArea(
      child: ListView(
        children: [
          Container(
            // loginoptionPWY (2:2077)


            decoration:  BoxDecoration (
              color:  const Color(0xff2c2c2c),
              borderRadius:  BorderRadius.only (
                bottomRight:  Radius.circular(50*fem),
              ),
            ),
            child:
            Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [

                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  // title2LY (2:2083)

                  child:
                  RichText(
                    text:
                    TextSpan(
                      style:  GoogleFonts.raleway (

                        fontSize:  25*ffem,
                        fontWeight:  FontWeight.w500,
                        height:  1.6*ffem/fem,
                        letterSpacing:  0.75*fem,
                        color:  Color(0xff252b5c),
                      ),
                      children:  [
                        TextSpan(
                          text:  'Party Live with',
                          style:  GoogleFonts.abrilFatface (

                            fontSize:  24*ffem,
                            fontWeight:  FontWeight.w500,
                            height:  1.6*ffem/fem,
                            letterSpacing:  0.75*fem,
                            color:  Color(0xff252b5c),
                          ),
                        ),
                        TextSpan(
                          text:  ' Your Favourite DJS',
                          style:  GoogleFonts.abrilFatface (

                            fontSize:  24*ffem,
                            fontWeight:  FontWeight.w800,
                            height:  1.6*ffem/fem,
                            letterSpacing:  0.75*fem,
                            color:  Color(0xff1f4c6b),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10,),
                Container(


                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      Container(
                        // rectangle8BhJ (2:2084)


                        height:  100*fem,
                        child:
                        ClipRRect(
                          borderRadius:  BorderRadius.circular(20*fem),
                          child:
                          Image(image: AssetImage('lib/assets/images/djfesta.jpg'),

                          ),
                        ),
                      ),
                      Container(


                        height:  100*fem,
                        child:
                        ClipRRect(
                          borderRadius:  BorderRadius.circular(20*fem),
                          child: Image(image: AssetImage('lib/assets/images/1.jpg'),)
                        ),
                      ),
                      Container(
                        // rectangle115Gt (2:2087)

                        height:  100*fem,
                        child:
                        ClipRRect(
                          borderRadius:  BorderRadius.circular(20*fem),
                          child: Image(image: AssetImage('lib/assets/images/djtopaz.jpg'),)
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Container(

                  // title2LY (2:2083)

                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text:
                      TextSpan(
                        style:  GoogleFonts.raleway (

                          fontSize:  25*ffem,
                          fontWeight:  FontWeight.w500,
                          height:  1.6*ffem/fem,
                          letterSpacing:  0.75*fem,
                          color:  Color(0xff252b5c),
                        ),
                        children:  [
                          TextSpan(
                            text:  'Request Any',
                            style:  GoogleFonts.abrilFatface (

                              fontSize:  22*ffem,
                              fontWeight:  FontWeight.w500,
                              height:  1.6*ffem/fem,
                              letterSpacing:  0.75*fem,
                              color:  Color(0xff252b5c),
                            ),
                          ),
                          TextSpan(
                            text:  ' Song',
                            style:  GoogleFonts.abrilFatface (

                              fontSize:  22*ffem,
                              fontWeight:  FontWeight.w800,
                              height:  1.6*ffem/fem,
                              letterSpacing:  0.75*fem,
                              color:  Color(0xff1f4c6b),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12)
                  ),
                ),
                SizedBox(height: 5,),
                Container(


                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      Container(
                        // rectangle8BhJ (2:2084)


                        height:  100*fem,
                        child:
                        ClipRRect(
                          borderRadius:  BorderRadius.circular(20*fem),
                          child:
                          Image(image: AssetImage('lib/assets/images/djjoemfalme.jpg'),

                          ),
                        ),
                      ),
                      Container(


                        height:  100*fem,
                        child:
                        ClipRRect(
                          borderRadius:  BorderRadius.circular(20*fem),
                          child: Image(image: AssetImage('lib/assets/images/djnickdee.jpg'),)
                        ),
                      ),
                      Container(
                        // rectangle115Gt (2:2087)

                        height:  100*fem,
                        child:
                        ClipRRect(
                          borderRadius:  BorderRadius.circular(20*fem),
                          child: Image(image: AssetImage('lib/assets/images/djrudeboy.jpg'),)
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12)
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          // title2LY (2:2083)

                          child:
                          RichText(
                            text:
                            TextSpan(
                              style:  GoogleFonts.raleway (

                                fontSize:  25*ffem,
                                fontWeight:  FontWeight.w500,
                                height:  1.6*ffem/fem,
                                letterSpacing:  0.75*fem,
                                color:  Color(0xff252b5c),
                              ),
                              children:  [
                                TextSpan(
                                  text:  'Ready to ',
                                  style:  GoogleFonts.lato (

                                    fontSize:  25*ffem,
                                    fontWeight:  FontWeight.w500,
                                    height:  1.6*ffem/fem,
                                    letterSpacing:  0.75*fem,
                                    color:  Color(0xff252b5c),
                                  ),
                                ),
                                TextSpan(
                                  text:  'Attend Events?',
                                  style:  GoogleFonts.lato (

                                    fontSize:  25*ffem,
                                    fontWeight:  FontWeight.w800,
                                    height:  1.6*ffem/fem,
                                    letterSpacing:  0.75*fem,
                                    color:  Color(0xff1f4c6b),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // title2LY (2:2083)

                          child:
                          RichText(
                            text:
                            TextSpan(
                              style:  GoogleFonts.raleway (

                                fontSize:  25*ffem,
                                fontWeight:  FontWeight.w500,
                                height:  1.6*ffem/fem,
                                letterSpacing:  0.75*fem,
                                color:  Color(0xff252b5c),
                              ),
                              children:  [
                                TextSpan(
                                  text:  'Ready to',
                                  style:  GoogleFonts.lato (

                                    fontSize:  25*ffem,
                                    fontWeight:  FontWeight.w500,
                                    height:  1.6*ffem/fem,
                                    letterSpacing:  0.75*fem,
                                    color:  Color(0xff252b5c),
                                  ),
                                ),
                                TextSpan(
                                  text:  ' Hire Djs?',
                                  style:  GoogleFonts.lato (

                                    fontSize:  25*ffem,
                                    fontWeight:  FontWeight.w800,
                                    height:  1.6*ffem/fem,
                                    letterSpacing:  0.75*fem,
                                    color:  Color(0xff1f4c6b),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // title2LY (2:2083)

                          child:
                          RichText(
                            text:
                            TextSpan(
                              style:  GoogleFonts.raleway (

                                fontSize:  25*ffem,
                                fontWeight:  FontWeight.w500,
                                height:  1.6*ffem/fem,
                                letterSpacing:  0.75*fem,
                                color:  Color(0xff252b5c),
                              ),
                              children:  [
                                TextSpan(
                                  text:  'Ready to',
                                  style:  GoogleFonts.lato (

                                    fontSize:  25*ffem,
                                    fontWeight:  FontWeight.w500,
                                    height:  1.6*ffem/fem,
                                    letterSpacing:  0.75*fem,
                                    color:  Color(0xff252b5c),
                                  ),
                                ),
                                TextSpan(
                                  text:  ' Earn Points?',
                                  style:  GoogleFonts.lato (

                                    fontSize:  25*ffem,
                                    fontWeight:  FontWeight.w800,
                                    height:  1.6*ffem/fem,
                                    letterSpacing:  0.75*fem,
                                    color:  Color(0xff1f4c6b),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30,),

                Container(
                  // autogroupnakgoPE (US595h4HNrb4ibQx42nakG)
                  margin:  EdgeInsets.fromLTRB(36*fem, 0*fem, 36*fem, 41*fem),
                  padding:  EdgeInsets.fromLTRB(55.67*fem, 24*fem, 45*fem, 19*fem),
                  width:  double.infinity,
                  decoration:  BoxDecoration (
                    color:  Color(0xff8bc83f),
                    borderRadius:  BorderRadius.circular(10*fem),
                  ),
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        // iconemailHpC (2:2089)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 6.67*fem, 4*fem),

                        height:  11.67*fem,
                        child:
                        Image(
                          image: AssetImage('lib/assets/images/djdoublem.jpg'),
                        ),
                      ),
                      Text(
                        // textR9i (2:2090)
                        'You Must be a Registered User',
                        textAlign:  TextAlign.center,
                        style:  GoogleFonts.lato (

                          fontSize:  16*ffem,
                          fontWeight:  FontWeight.w700,
                          height:  1.2*ffem/fem,

                          color:  Color(0xffffffff),
                        ),
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


              ],
            ),
          ),
        ],
      ),
    );
  }
}
