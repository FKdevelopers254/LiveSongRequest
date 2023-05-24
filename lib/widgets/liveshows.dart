
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:liverequest/widgets/trendingsingle.dart';
import 'package:lottie/lottie.dart';

class Trending extends StatelessWidget {

  final List<Map<String, String>> items = [
    {
  'artistname': 'DJ NASH TUNIC',
  'location': 'Nairobi',
  'clubname': ' Forty',
  'imagepath':'lib/assets/images/1.jpg',
  'price' :'50',
  'time':'4AM - 12PM',
  'datee':'Wed.21.Jan',
    },
    {
      'artistname': 'DJ LUCKY DUB',
      'location': 'Western',
      'clubname': 'Omoshalas',
      'imagepath':'lib/assets/images/djdoublem.jpg',
      'price' :'25',
      'time':'2AM - 2PM',
      'datee':'Fri.11.Feb',

    },
    {
      'artistname': 'DJ FESTA',
      'location': 'Karen',
      'clubname': 'Weston Hotel',
      'imagepath':'lib/assets/images/djfesta.jpg',
      'price' :'66',
      'time':'4AM - 12PM',
      'datee':'Mon.20.Mar',

    },
    {
      'artistname': 'DJ Nickdee',
      'location': 'Mombasa',
      'clubname': 'Bamburi Lounge',
      'imagepath':'lib/assets/images/djnickdee.jpg',
      'price' :'10',
      'time':'4AM - 12PM',
      'datee':'Wed.10.Jan',

    },
];

  Trending({super.key});


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('liveshows')
          .where('live', isEqualTo: true)
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
          scrollDirection: Axis.vertical,
          children: snapshot.data!.docs.map((document) {

            final location = document.get('location');

            final starttime = document.get('starttime');
            final endtime = document.get('endtime');
            final clubname = document.get('clubname');

            final imageurl = document.get('imageurl');
            final price = document.get('price');



            return AnimatedContainer(
              duration: Duration(milliseconds: 1500),
              curve: Curves.bounceIn,
              child: InkWell(
             //   onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TrendingSingles(items: items[index]),),);},
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0,left: 10,right: 10),
                  child: Column(
                    children: [
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.deepPurple.withOpacity(0.8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(

                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 160,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage('$imageurl'),
                                            fit: BoxFit.cover,
                                          )
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Container(
                                              width: 60,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),

                                                color: Colors.white,
                                              ),
                                              child:  Lottie.asset('lib/assets/icons/99714-go-live.json',height: 120,),
                                            ),
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),

                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(width: 20,),
                                        Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  Row(
                                                    children: [
                                                      Icon(Icons.music_video,size: 15, color: Colors.grey),
                                                      // Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),
                                                      Text('  fdfd',style: GoogleFonts.bebasNeue(fontSize:22,color: Colors.black)),
                                                    ],
                                                  ),

                                                  Row(
                                                    children: [
                                                      Icon(Icons.holiday_village,size: 15, color: Colors.grey),
                                                      //Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),

                                                      Text('$clubname',style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.white)),



                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.location_on,size: 15, color: Colors.grey),
                                                      //Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),
                                                      Text('$location',style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.white)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.timelapse_rounded,size: 15, color: Colors.grey),
                                                      Text('$starttime',style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.white)),
                                                      SizedBox(width: 12.0),
                                                      Icon(Icons.monetization_on,size: 15, color: Colors.grey),

                                                      Text('\$' + '$price',style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.white)),
                                                    ],
                                                  ),




                                                ],
                                              ),

                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                    const Divider(thickness: 1,color: Colors.black,)
                                  ],
                                ),

                              ],
                            ),
                            Lottie.asset('lib/assets/icons/reques.json',height: 50,),

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
    );

  }
}
