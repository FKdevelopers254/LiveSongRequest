
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class TrendingTab extends StatelessWidget {

  final List<Map<String, String>> events = [
    {
      'artistname': 'DJ NASH TUNIC',
      'location': 'Nairobi',
      'eventname': ' Pool Party',
      'imagepath':'lib/assets/images/1.jpg',
      'price' :'50',
      'time':'4AM - 12PM',
      'datee':'Wed.21.Jan',
      'description':'YALI Alumni Chapter of Kenya intends to hold its 4th Annual YouthLeadership & Transformation Summit towards meaningful engagement &empowerment of Africa’s youth demographic, for climate action.The two-day event seeks to meet the following objectives:1. To amplify voices of communities, fronting young people asambassadors of climate resilience2. To strategically develop pathways to influence & catalyze sustainableclimate change & development policies by key government agencies, civilsociety organizations, private sector, and other industry players.3. To facilitate authentic dialogue, boost investments, competitivenessof youth-led businesses & enterprises addressing climate change, through',
    },
    {
      'artistname': 'DJ LUCKY DUB',
      'location': 'Western',
      'eventname': 'Omoshalas',
      'imagepath':'lib/assets/images/djdoublem.jpg',
      'price' :'25',
      'time':'2AM - 2PM',
      'datee':'Fri.11.Feb',
      'description':'YALI Alumni Chapter of Kenya intends to hold its 4th Annual YouthLeadership & Transformation Summit towards meaningful engagement &empowerment of Africa’s youth demographic, for climate action.The two-day event seeks to meet the following objectives:1. To amplify voices of communities, fronting young people asambassadors of climate resilience2. To strategically develop pathways to influence & catalyze sustainableclimate change & development policies by key government agencies, civilsociety organizations, private sector, and other industry players.3. To facilitate authentic dialogue, boost investments, competitivenessof youth-led businesses & enterprises addressing climate change, through',

    },
    {
      'artistname': 'DJ FESTA',
      'location': 'Karen',
      'eventname': 'Weston Hotel',
      'imagepath':'lib/assets/images/djfesta.jpg',
      'price' :'66',
      'time':'4AM - 12PM',
      'datee':'Mon.20.Mar',
      'description':'YALI Alumni Chapter of Kenya intends to hold its 4th Annual YouthLeadership & Transformation Summit towards meaningful engagement &empowerment of Africa’s youth demographic, for climate action.The two-day event seeks to meet the following objectives:1. To amplify voices of communities, fronting young people asambassadors of climate resilience2. To strategically develop pathways to influence & catalyze sustainableclimate change & development policies by key government agencies, civilsociety organizations, private sector, and other industry players.3. To facilitate authentic dialogue, boost investments, competitivenessof youth-led businesses & enterprises addressing climate change, through',

    },
    {
      'artistname': 'DJ Nickdee',
      'location': 'Mombasa',
      'eventname': 'Bamburi Lounge',
      'imagepath':'lib/assets/images/djnickdee.jpg',
      'price' :'10',
      'time':'4AM - 12PM',
      'datee':'Wed.10.Jan',
      'description':'YALI Alumni Chapter of Kenya intends to hold its 4th Annual YouthLeadership & Transformation Summit towards meaningful engagement &empowerment of Africa’s youth demographic, for climate action.The two-day event seeks to meet the following objectives:1. To amplify voices of communities, fronting young people asambassadors of climate resilience2. To strategically develop pathways to influence & catalyze sustainableclimate change & development policies by key government agencies, civilsociety organizations, private sector, and other industry players.3. To facilitate authentic dialogue, boost investments, competitivenessof youth-led businesses & enterprises addressing climate change, through',

    },
  ];

  TrendingTab({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(



      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('events')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred while loading the data.'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No  details found.'),
            );
          }

          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs.map((document) {
              final eventname = document.get('eventname');
              final location = document.get('location');
              final eventdate = document.get('eventdate');
              final starttime = document.get('starttime');
              final endtime = document.get('endtime');

              final imageurl = document.get('imageurl');
              final price = document.get('price');
              final dj = document.get('dj');
              double fem=1;
              double ffem=0.9;


              return InkWell(
                // onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EventSingles(document.id),),);},
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
                  child: Container(
                    // listR44 (1:409)
                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                    width:  156*fem,
                    height:  double.infinity,
                    child:
                    Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children:  [
                        Container(
                          // group1000003468iYx (1:410)
                          padding:  EdgeInsets.fromLTRB(120*fem, 13*fem, 8*fem, 13*fem),
                          width:  double.infinity,
                          height:  150*fem,
                          decoration:  BoxDecoration (
                            borderRadius:  BorderRadius.circular(8*fem),
                            image:  DecorationImage (
                              fit:  BoxFit.cover,
                              image:  AssetImage (
                                  '$imageurl'
                              ),
                            ),
                          ),
                          child:
                          Align(
                            // group1000003464Afr (1:412)
                            alignment:  Alignment.topRight,
                            child:
                            SizedBox(
                              width:  28*fem,
                              height:  28*fem,
                              child:
                              Container(
                                margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 96*fem),
                                child:
                                Image(
                                 image: AssetImage (
                                     '$imageurl'
                                 ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height:  8*fem,
                        ),
                        Container(
                          // group1000003467z96 (1:416)
                          width:  105*fem,
                          child:
                          Column(
                            crossAxisAlignment:  CrossAxisAlignment.start,
                            children:  [
                              Container(
                                // tahitibeachXui (1:417)
                                margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                child:
                                Text(
                                  '$imageurl',
                                  style:  GoogleFonts.plusJakartaSans (

                                    fontSize:  14*ffem,
                                    fontWeight:  FontWeight.w600,
                                    height:  1.5714285714*ffem/fem,
                                    letterSpacing:  0.07*fem,
                                    color:  Color(0xff111111),
                                  ),
                                ),
                              ),
                              Container(
                                // group1000003465Smn (1:418)
                                padding:  EdgeInsets.fromLTRB(2.33*fem, 0*fem, 0*fem, 0*fem),
                                width:  double.infinity,
                                child:
                                Row(
                                  crossAxisAlignment:  CrossAxisAlignment.center,
                                  children:  [
                                    Container(
                                      // bxsmap11NQY (1:420)
                                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 6.33*fem, 0*fem),
                                      width:  9.33*fem,
                                      height:  11.67*fem,
                                      child:
                                      Image(
                                        image: AssetImage (
                                            '$imageurl'
                                        ),
                                      ),
                                    ),
                                    RichText(
                                      // polynesiafrenchss6 (1:419)
                                      text:
                                      TextSpan(
                                        style:  GoogleFonts.plusJakartaSans (

                                          fontSize:  10*ffem,
                                          fontWeight:  FontWeight.w500,
                                          height:  1.8*ffem/fem,
                                          letterSpacing:  0.05*fem,
                                          color:  Color(0xff78828a),
                                        ),
                                        children:  [
                                          TextSpan(
                                            text:  'Polynesia, ',
                                            style:  GoogleFonts.plusJakartaSans (

                                              fontSize:  10*ffem,
                                              fontWeight:  FontWeight.w500,
                                              height:  1.8*ffem/fem,
                                              letterSpacing:  0.05*fem,
                                              color:  Color(0xff78828a),
                                            ),
                                          ),
                                          TextSpan(
                                            text:  'French ',
                                            style:  GoogleFonts.plusJakartaSans (

                                              fontSize:  10*ffem,
                                              fontWeight:  FontWeight.w500,
                                              height:  1.8*ffem/fem,
                                              letterSpacing:  0.05*fem,
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
                        ),
                        SizedBox(
                          height:  8*fem,
                        ),
                        Container(
                          // group1000003466zik (1:422)
                          width:  double.infinity,
                          height:  22*fem,
                          child:
                          Row(
                            crossAxisAlignment:  CrossAxisAlignment.center,
                            children:  [
                              Container(
                                // kT2 (1:423)
                                margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 57*fem, 0*fem),
                                child:
                                Text(
                                  '\$235',
                                  style:  GoogleFonts.plusJakartaSans (

                                    fontSize:  14*ffem,
                                    fontWeight:  FontWeight.w700,
                                    height:  1.5714285714*ffem/fem,
                                    letterSpacing:  0.07*fem,
                                    color:  Color(0xff111111),
                                  ),
                                ),
                              ),
                              Container(
                                // group10000034295EQ (1:424)
                                margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 1*fem),
                                height:  double.infinity,
                                child:
                                Row(
                                  crossAxisAlignment:  CrossAxisAlignment.center,
                                  children:  [
                                    Container(
                                      // star1tk (1:425)
                                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                      width:  14*fem,
                                      height:  14*fem,
                                      child:
                                      Image(
                                        image: AssetImage (
                                            '$imageurl'
                                        ),
                                      ),
                                    ),
                                    RichText(
                                      // type167wn (1:426)
                                      text:
                                      TextSpan(
                                        style:  GoogleFonts.plusJakartaSans (

                                          fontSize:  12*ffem,
                                          fontWeight:  FontWeight.w600,
                                          height:  1.6666666667*ffem/fem,
                                          letterSpacing:  0.06*fem,
                                          color:  Color(0xffffcd19),
                                        ),
                                        children:  [
                                          TextSpan(
                                            text:  '4.4 ',
                                          ),
                                          TextSpan(
                                            text:  '(32)',
                                            style:  GoogleFonts.plusJakartaSans (

                                              fontSize:  12*ffem,
                                              fontWeight:  FontWeight.w600,
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
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );

  }
}
