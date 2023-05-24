import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Template12 extends StatefulWidget {
  const Template12({Key? key}) : super(key: key);

  @override
  State<Template12> createState() => _Template12State();
}

class _Template12State extends State<Template12> {
  double fem=1;
  double ffem=0.9;
  @override
  Widget build(BuildContext context) {
    return Container(
      // onboardingtmn (1:344)
      padding:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 34*fem),
      width:  double.infinity,
      decoration:  BoxDecoration (
        color:  Color(0xffffffff),
      ),
      child:
      Column(
        crossAxisAlignment:  CrossAxisAlignment.center,
        children:  [
          Container(
            // subtractZsv (1:345)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 32*fem),
            width:  375*fem,
            height:  490*fem,
            child:
            Image(image: AssetImage (
                '[Image url]'
            ),

            ),
          ),
          Container(
            // contentTyJ (1:352)
            margin:  EdgeInsets.fromLTRB(24*fem, 0*fem, 24*fem, 0*fem),
            width:  double.infinity,
            child:
            Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  // group1000003277oXN (1:354)
                  margin:  EdgeInsets.fromLTRB(15.5*fem, 0*fem, 15.5*fem, 33*fem),
                  width:  double.infinity,
                  child:
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Center(
                        // weareheretomakeyourholidayeasi (1:355)
                        child:
                        Container(
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                          constraints:  BoxConstraints (
                            maxWidth:  296*fem,
                          ),
                          child:
                          Text(
                            'We are here to make your holiday easier',
                            textAlign:  TextAlign.center,
                            style:  GoogleFonts.plusJakartaSans (

                              fontSize:  24*ffem,
                              fontWeight:  FontWeight.w700,
                              height:  1.3333333333*ffem/fem,
                              letterSpacing:  0.12*fem,
                              color:  Color(0xff111111),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        // loremipsumissimplydummytextoft (1:356)
                        child:
                        Container(
                          margin:  EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                          constraints:  BoxConstraints (
                            maxWidth:  272*fem,
                          ),
                          child:
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                            textAlign:  TextAlign.center,
                            style:  GoogleFonts.plusJakartaSans (

                              fontSize:  14*ffem,
                              fontWeight:  FontWeight.w500,
                              height:  1.5714285714*ffem/fem,
                              letterSpacing:  0.07*fem,
                              color:  Color(0xff78828a),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // actionrtx (1:357)
                  width:  double.infinity,
                  child:
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        // labelQQg (I1:359;23:223)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 24*fem),
                        width:  double.infinity,
                        height:  58*fem,
                        decoration:  BoxDecoration (
                          color:  Color(0xff7c73c3),
                          borderRadius:  BorderRadius.circular(24*fem),
                        ),
                        child:
                        Center(
                          child:
                          Text(
                            'Get Started',
                            style:  GoogleFonts.plusJakartaSans (

                              fontSize:  18*ffem,
                              fontWeight:  FontWeight.w600,
                              height:  1.4444444444*ffem/fem,
                              letterSpacing:  0.09*fem,
                              color:  Color(0xfffefefe),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        // donthaveanaccountregisterUQY (1:358)
                        child:
                        Container(
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                          child:
                          RichText(
                            textAlign:  TextAlign.center,
                            text:
                            TextSpan(
                              style:  GoogleFonts.plusJakartaSans (

                                fontSize:  16*ffem,
                                fontWeight:  FontWeight.w600,
                                height:  1.5*ffem/fem,
                                letterSpacing:  0.08*fem,
                                color:  Color(0xffffffff),
                              ),
                              children:  [
                                TextSpan(
                                  text:  'Don’t have an account? ',
                                  style:  GoogleFonts.plusJakartaSans (

                                    fontSize:  16*ffem,
                                    fontWeight:  FontWeight.w600,
                                    height:  1.5*ffem/fem,
                                    letterSpacing:  0.08*fem,
                                    color:  Color(0xff111111),
                                  ),
                                ),
                                TextSpan(
                                  text:  'Register',
                                  style:  GoogleFonts.plusJakartaSans (

                                    fontSize:  16*ffem,
                                    fontWeight:  FontWeight.w600,
                                    height:  1.5*ffem/fem,
                                    letterSpacing:  0.08*fem,
                                    color:  Color(0xff009b8d),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
