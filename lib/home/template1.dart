import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Template1 extends StatefulWidget {
  const Template1({Key? key}) : super(key: key);

  @override
  State<Template1> createState() => _Template1State();
}

class _Template1State extends State<Template1> {
  double fem=1;
  double ffem=0.9;
  @override
  Widget build(BuildContext context) {
    return Container(
      // list2gg (1:500)
      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 16*fem),
      width:  double.infinity,
      height:  86*fem,
      child:
      Row(
        crossAxisAlignment:  CrossAxisAlignment.center,
        children:  [
          Container(
            // rectangle22469xaL (1:501)
            width:  86*fem,
            height:  86*fem,
            decoration:  BoxDecoration (
              borderRadius:  BorderRadius.circular(8*fem),
              color:  const Color(0xffd9d9d9),
              image:  const DecorationImage (
                fit:  BoxFit.cover,
                image:  AssetImage (
                   '[Image url]'
                ),
              ),
            ),
          ),
          Container(
            // autogroupeanf59A (Eh5gjE1zGpGfQ7UekieaNF)
            padding:  EdgeInsets.fromLTRB(12*fem, 5*fem, 0*fem, 5*fem),
            height:  double.infinity,
            child:
            Row(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  // group10000034841Hi (1:502)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 43*fem, 0*fem),
                  width:  112*fem,
                  height:  double.infinity,
                  child:
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children:  [
                      Container(
                        // group1000003483Y2k (1:507)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                        width:  double.infinity,
                        child:
                        Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children:  [
                            Text(
                              // ledadubeach52g (1:508)
                              'Ledadu Beach',
                              style:  GoogleFonts.plusJakartaSans (

                                fontSize:  16*ffem,
                                fontWeight:  FontWeight.w700,
                                height:  1.5*ffem/fem,
                                letterSpacing:  0.08*fem,
                                color:  const Color(0xff111111),
                              ),
                            ),
                            Text(
                              // days2nightsozG (1:509)
                              '3 days 2 nights',
                              style:  GoogleFonts.plusJakartaSans(

                                fontSize:  12*ffem,
                                fontWeight:  FontWeight.w500,
                                height:  1.6666666667*ffem/fem,
                                letterSpacing:  0.06*fem,
                                color:  const Color(0xff78828a),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // group1000003465kPi (1:503)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 39*fem, 0*fem),
                        padding:  EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
                        width:  double.infinity,
                        child:
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          children:  [
                            Container(
                              // bxsmap11H8k (1:505)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 0*fem),
                              width:  12*fem,
                              height:  15*fem,
                              child:
                              const Image(image: AssetImage(''),

                              ),
                            ),
                            Text(
                              // australiaoMz (1:504)
                              'Australia',
                              style:  GoogleFonts.plusJakartaSans (

                                fontSize:  12*ffem,
                                fontWeight:  FontWeight.w500,
                                height:  1.6666666667*ffem/fem,
                                letterSpacing:  0.06*fem,
                                color:  const Color(0xff78828a),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  // personLMv (1:510)
                  text:
                  TextSpan(
                    style:  GoogleFonts.plusJakartaSans (
                    
                      fontSize:  12*ffem,
                      fontWeight:  FontWeight.w500,
                      height:  1.6666666667*ffem/fem,
                      letterSpacing:  0.06*fem,
                      color:  Color(0xff000000),
                    ),
                    children:  [
                      TextSpan(
                        text:  '\$20',
                        style:  GoogleFonts.plusJakartaSans (

                          fontSize:  14*ffem,
                          fontWeight:  FontWeight.w700,
                          height:  1.5714285714*ffem/fem,
                          letterSpacing:  0.07*fem,
                          color:  Color(0xff111111),
                        ),
                      ),
                      TextSpan(
                        text:  '/Person',
                        style:  GoogleFonts.plusJakartaSans (

                          fontSize:  12*ffem,
                          fontWeight:  FontWeight.w500,
                          height:  1.6666666667*ffem/fem,
                          letterSpacing:  0.06*fem,
                          color:  Color(0xff78828a),
                        ),
                      ),
                    ],
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
