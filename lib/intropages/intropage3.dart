import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ffem=0.9;
    double fem=1;
    return SingleChildScrollView(
      child: Column(
        children: [

          Container(
            // bannerx3J (137:1379)
            padding:  EdgeInsets.fromLTRB(30*fem, 0*fem, 0*fem, 31*fem),
            width:  double.infinity,
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
                        width:  55*fem,
                        height:  55*fem,
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


                Container(
                  // autogrouphxmiHcc (2SADViK3VXyeRbBkSUhXmi)

                  width:  double.infinity,
                  child:
                  Container(
                    // searchRD2 (137:1388)
                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 1*fem),
                    padding:  EdgeInsets.fromLTRB(24*fem, 18*fem, 24*fem, 17*fem),
                    width:  257*fem,
                    decoration:  BoxDecoration (
                      border:  Border.all(color:const Color(0xffeaeaea)),
                      borderRadius:  BorderRadius.circular(10*fem),
                    ),
                    child:
                    Text(
                      'Find the best Events,Live Shows,DJS',
                      style:  GoogleFonts.raleway (

                        fontSize:  15*ffem,
                        fontWeight:  FontWeight.w500,
                        height:  1.175*ffem/fem,
                        color:  const Color(0xffeaeaea),

                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  // autogroupd5rzX36 (2SA6SztQ1o6uyjhHRWd5Rz)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 40*fem),
                  width:  482*fem,
                  height:  142*fem,
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        // cardcarrouselpanamashotelq3n (138:1621)
                        width:  150*fem,
                        height:  double.infinity,
                        child:
                        Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children:  [
                            Container(
                              // hotelphotoy9z (I138:1621;138:1523)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                              width:  double.infinity,
                              height:  90*fem,
                              decoration:  BoxDecoration (
                                color:  Color(0xffffffff),
                                borderRadius:  BorderRadius.circular(10*fem),
                              ),
                              child:
                              Center(
                                // webalisertptxzd9moounsplash1hL (I138:1621;138:1524)
                                child:
                                SizedBox(
                                  width:  150*fem,
                                  height:  112.9*fem,
                                  child:
                                  Image(
                                    image: AssetImage('lib/assets/images/djdoublem.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // panamashotelQm6 (I138:1621;138:1518)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                              child:
                              Text(
                                'Panama’s Hotel',
                                style:  GoogleFonts.raleway (

                                  fontSize:  13*ffem,
                                  fontWeight:  FontWeight.w600,
                                  height:  1.2000000293*ffem/fem,
                                  color:  Color(0xff2c2c2c),
                                ),
                              ),
                            ),
                            Container(
                              // autogroupraeuvDe (2SA7HeA1jnPaUqjpZGrAEU)
                              width:  double.infinity,
                              height:  12*fem,
                              child:
                              Row(
                                crossAxisAlignment:  CrossAxisAlignment.center,
                                children:  [
                                  Container(
                                    // locationevL (I138:1621;138:1542)
                                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 36*fem, 0*fem),
                                    padding:  EdgeInsets.fromLTRB(0.94*fem, 0*fem, 0*fem, 0*fem),
                                    height:  double.infinity,
                                    child:
                                    Row(
                                      crossAxisAlignment:  CrossAxisAlignment.center,
                                      children:  [
                                        Container(
                                          // locationmzx (I138:1621;138:1533)
                                          margin:  EdgeInsets.fromLTRB(0*fem, 0.04*fem, 8.94*fem, 0*fem),
                                          width:  8.13*fem,
                                          height:  9.42*fem,
                                          child:
                                          Image(
                                            image: AssetImage('lib/assets/images/djkalonje.jpg'),
                                          ),
                                        ),
                                        Text(
                                          // jakartaindonesiaVAG (I138:1621;138:1532)
                                          'Jakarta, Indonesia',
                                          style:  GoogleFonts.raleway (

                                            fontSize:  10*ffem,
                                            fontWeight:  FontWeight.w500,
                                            height:  1.2*ffem/fem,
                                            color:  Color(0xff969696),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // likeRZi (I138:1621;138:1525)
                                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                    width:  12*fem,
                                    height:  10.5*fem,
                                    child:
                                    Image(
                                      image: AssetImage('lib/assets/images/gmoney.jpg'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width:  16*fem,
                      ),
                      Container(
                        // cardcarrouselcassablancaresort (138:1631)
                        width:  150*fem,
                        height:  double.infinity,
                        child:
                        Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children:  [
                            Container(
                              // photohotel3qz (I138:1631;138:1527)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                              width:  double.infinity,
                              height:  90*fem,
                              decoration:  BoxDecoration (
                                color:  Color(0xffffffff),
                                borderRadius:  BorderRadius.circular(10*fem),
                              ),
                              child:
                              Align(
                                // bernardhermantclkggwibtayunspl (I138:1631;138:1528)
                                alignment:  Alignment.bottomCenter,
                                child:
                                SizedBox(
                                  width:  150*fem,
                                  height:  226.53*fem,
                                  child:
                                  Image(
                                    image: AssetImage('lib/assets/images/djkalonje.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // cassablancaresortWUg (I138:1631;138:1521)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                              child:
                              Text(
                                'Cassablanca Resort',
                                style:  GoogleFonts.raleway (

                                  fontSize:  13*ffem,
                                  fontWeight:  FontWeight.w600,
                                  height:  1.2000000293*ffem/fem,
                                  color:  Color(0xff2c2c2c),
                                ),
                              ),
                            ),
                            Container(
                              // autogroupuark2hv (2SA6wpPiCZy7GamAqmuArk)
                              width:  double.infinity,
                              height:  12*fem,
                              child:
                              Row(
                                crossAxisAlignment:  CrossAxisAlignment.center,
                                children:  [
                                  Container(
                                    // locationazL (I138:1631;138:1544)
                                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 36*fem, 0*fem),
                                    padding:  EdgeInsets.fromLTRB(0.94*fem, 0*fem, 0*fem, 0*fem),
                                    height:  double.infinity,
                                    child:
                                    Row(
                                      crossAxisAlignment:  CrossAxisAlignment.center,
                                      children:  [
                                        Container(
                                          // location7Da (I138:1631;138:1534)
                                          margin:  EdgeInsets.fromLTRB(0*fem, 0.04*fem, 8.94*fem, 0*fem),
                                          width:  8.13*fem,
                                          height:  9.42*fem,
                                          child:
                                          Image(
                                            image: AssetImage('lib/assets/images/gmoney.jpg'),
                                          ),
                                        ),
                                        Text(
                                          // jakartaindonesia1Zr (I138:1631;138:1519)
                                          'Jakarta, Indonesia',
                                          style:  GoogleFonts.raleway (

                                            fontSize:  10*ffem,
                                            fontWeight:  FontWeight.w500,
                                            height:  1.2*ffem/fem,
                                            color:  Color(0xff969696),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // like9RA (I138:1631;138:1526)
                                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                    width:  12*fem,
                                    height:  10.5*fem,
                                    child:
                                    Image(
                                      image: AssetImage('lib/assets/images/gmoney.jpg'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width:  16*fem,
                      ),

                    ],
                  ),

                ),
                Container(
                  // autogroupd5rzX36 (2SA6SztQ1o6uyjhHRWd5Rz)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 40*fem),
                  width:  482*fem,
                  height:  142*fem,
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        // cardcarrouselpanamashotelq3n (138:1621)
                        width:  150*fem,
                        height:  double.infinity,
                        child:
                        Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children:  [
                            Container(
                              // hotelphotoy9z (I138:1621;138:1523)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                              width:  double.infinity,
                              height:  90*fem,
                              decoration:  BoxDecoration (
                                color:  Color(0xffffffff),
                                borderRadius:  BorderRadius.circular(10*fem),
                              ),
                              child:
                              Center(
                                // webalisertptxzd9moounsplash1hL (I138:1621;138:1524)
                                child:
                                SizedBox(
                                  width:  150*fem,
                                  height:  112.9*fem,
                                  child:
                                  Image(
                                    image: AssetImage('lib/assets/images/djrudeboy.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // panamashotelQm6 (I138:1621;138:1518)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                              child:
                              Text(
                                'Panama’s Hotel',
                                style:  GoogleFonts.raleway (

                                  fontSize:  13*ffem,
                                  fontWeight:  FontWeight.w600,
                                  height:  1.2000000293*ffem/fem,
                                  color:  Color(0xff2c2c2c),
                                ),
                              ),
                            ),
                            Container(
                              // autogroupraeuvDe (2SA7HeA1jnPaUqjpZGrAEU)
                              width:  double.infinity,
                              height:  12*fem,
                              child:
                              Row(
                                crossAxisAlignment:  CrossAxisAlignment.center,
                                children:  [
                                  Container(
                                    // locationevL (I138:1621;138:1542)
                                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 36*fem, 0*fem),
                                    padding:  EdgeInsets.fromLTRB(0.94*fem, 0*fem, 0*fem, 0*fem),
                                    height:  double.infinity,
                                    child:
                                    Row(
                                      crossAxisAlignment:  CrossAxisAlignment.center,
                                      children:  [
                                        Container(
                                          // locationmzx (I138:1621;138:1533)
                                          margin:  EdgeInsets.fromLTRB(0*fem, 0.04*fem, 8.94*fem, 0*fem),
                                          width:  8.13*fem,
                                          height:  9.42*fem,
                                          child:
                                          Image(
                                            image: AssetImage('lib/assets/images/gmoney.jpg'),
                                          ),
                                        ),
                                        Text(
                                          // jakartaindonesiaVAG (I138:1621;138:1532)
                                          'Jakarta, Indonesia',
                                          style:  GoogleFonts.raleway (

                                            fontSize:  10*ffem,
                                            fontWeight:  FontWeight.w500,
                                            height:  1.2*ffem/fem,
                                            color:  Color(0xff969696),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // likeRZi (I138:1621;138:1525)
                                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                    width:  12*fem,
                                    height:  10.5*fem,
                                    child:
                                    Image(
                                      image: AssetImage('lib/assets/images/gmoney.jpg'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width:  16*fem,
                      ),
                      Container(
                        // cardcarrouselcassablancaresort (138:1631)
                        width:  150*fem,
                        height:  double.infinity,
                        child:
                        Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children:  [
                            Container(
                              // photohotel3qz (I138:1631;138:1527)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                              width:  double.infinity,
                              height:  90*fem,
                              decoration:  BoxDecoration (
                                color:  Color(0xffffffff),
                                borderRadius:  BorderRadius.circular(10*fem),
                              ),
                              child:
                              Align(
                                // bernardhermantclkggwibtayunspl (I138:1631;138:1528)
                                alignment:  Alignment.bottomCenter,
                                child:
                                SizedBox(
                                  width:  150*fem,
                                  height:  226.53*fem,
                                  child:
                                  Image(
                                    image: AssetImage('lib/assets/images/djnickdee.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // cassablancaresortWUg (I138:1631;138:1521)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                              child:
                              Text(
                                'Cassablanca Resort',
                                style:  GoogleFonts.raleway (

                                  fontSize:  13*ffem,
                                  fontWeight:  FontWeight.w600,
                                  height:  1.2000000293*ffem/fem,
                                  color:  Color(0xff2c2c2c),
                                ),
                              ),
                            ),
                            Container(
                              // autogroupuark2hv (2SA6wpPiCZy7GamAqmuArk)
                              width:  double.infinity,
                              height:  12*fem,
                              child:
                              Row(
                                crossAxisAlignment:  CrossAxisAlignment.center,
                                children:  [
                                  Container(
                                    // locationazL (I138:1631;138:1544)
                                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 36*fem, 0*fem),
                                    padding:  EdgeInsets.fromLTRB(0.94*fem, 0*fem, 0*fem, 0*fem),
                                    height:  double.infinity,
                                    child:
                                    Row(
                                      crossAxisAlignment:  CrossAxisAlignment.center,
                                      children:  [
                                        Container(
                                          // location7Da (I138:1631;138:1534)
                                          margin:  EdgeInsets.fromLTRB(0*fem, 0.04*fem, 8.94*fem, 0*fem),
                                          width:  8.13*fem,
                                          height:  9.42*fem,
                                          child:
                                          Image(
                                            image: AssetImage('lib/assets/images/gmoney.jpg'),
                                          ),
                                        ),
                                        Text(
                                          // jakartaindonesia1Zr (I138:1631;138:1519)
                                          'Jakarta, Indonesia',
                                          style:  GoogleFonts.raleway (

                                            fontSize:  10*ffem,
                                            fontWeight:  FontWeight.w500,
                                            height:  1.2*ffem/fem,
                                            color:  Color(0xff969696),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // like9RA (I138:1631;138:1526)
                                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                    width:  12*fem,
                                    height:  10.5*fem,
                                    child:
                                    Image(
                                      image: AssetImage('lib/assets/images/gmoney.jpg'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width:  16*fem,
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
                  width:  51*fem,
                  height:  51*fem,
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
    );
  }
}
