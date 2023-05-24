
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


import '../widgets/editevent.dart';
import '../widgets/editliveshow.dart';
import '../widgets/prof.dart';
import 'djtab.dart';









class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser!;
  late TabController tabController;
  @override
  void  initState(){
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9EFEB),
      body: ListView(

        children: <Widget>[
          Stack(
            children: <Widget>[

              Container(
                height: 60.0,

                decoration:  BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    //   color: Color(0xFFFD7465),
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(75.0,),bottomLeft: Radius.circular(75.0,)



                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 5,),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {

                        },
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText('Account Page ',textStyle: GoogleFonts.bebasNeue(fontSize:28,color: Colors.white)),

                            TyperAnimatedText('A DJ',textStyle: GoogleFonts.bebasNeue(fontSize:28,color: Colors.white)),

                            TyperAnimatedText('WE GOT you!!',textStyle: GoogleFonts.bebasNeue(fontSize:28,color: Colors.white)),

                          ],
                          pause: const Duration(milliseconds: 3000),

                          stopPauseOnTap: true,
                          repeatForever: true,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Lottie.asset('lib/assets/icons/120498-dj-controler.json',height: 70,)),

                  const SizedBox(width: 5,),
                ],
              ),



            ],
          ),

          TabBar(
            controller: tabController,
            indicatorColor: Theme.of(context).primaryColor.withOpacity(0.8),
            // indicatorColor: Color(0xFFFE8A7E),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4.0,
            isScrollable: true,
            labelColor: const Color(0xFF440206),
            unselectedLabelColor: const Color(0xFF440206),
            tabs:  const [
              Tab(
                child: Text(
                  'Profile',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                ),
                ),
              ),
              Tab(
                child: Text(
                  'Live Shows',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),
              Tab(
                child: Text(
                  'Events',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),




            ],



          ),
          const SizedBox(height: 10.0,),
          Container(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              controller: tabController,
              children:  <Widget>[
              //  Profile(),
                PointPages(),


                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('liveshows')
                     // .where('live', isEqualTo: true)
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
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()
                      ),
                      scrollDirection: Axis.vertical,
                      children: snapshot.data!.docs.map((document) {

                        final location = document.get('location');

                        final starttime = document.get('starttime');
                        final endtime = document.get('endtime');
                        final clubname = document.get('clubname');

                        final imageurl = document.get('imageurl');
                        final price = document.get('price');
                        final dj = document.get('dj');
                        bool carAvailability = document.get('live');
                        bool _isAvailable = carAvailability;

                        void deleteCar(String carId) {
                          FirebaseFirestore.instance
                              .collection('liveshows')
                              .doc(carId)
                              .delete()
                              .then((value) => print('Car deleted'))
                              .catchError((error) => print('Failed to delete car: $error'));
                        }



                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: InkWell(
                               onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EditLiveshow(docId: document.id,),),);},
                            onLongPress: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Delete LiveShow??'),
                                    content: Text('Are you sure you want to delete this?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          deleteCar(document.id);
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  );
                                },
                              );

                            },

                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0,left: 10,right: 10),
                              child: Column(
                                children: [
                                  Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: _isAvailable ? Colors.deepPurple.withOpacity(0.8) : Colors.deepOrange.withOpacity(0.5),
                                      //  color: Colors.deepPurple.withOpacity(0.8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(

                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: 100,
                                                    width: 100,
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
                                                                  SizedBox(width: 10,),
                                                                  // Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),
                                                                  Container(
                                                                      width: 85,
                                                                      height: 25,
                                                                      child: Text('$dj',style: GoogleFonts.bebasNeue(fontSize:22,color: Colors.black))),
                                                                ],
                                                              ),

                                                              Row(
                                                                children: [
                                                                  Icon(Icons.holiday_village,size: 15, color: Colors.grey),
                                                                  SizedBox(width: 10,),
                                                                  //Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),

                                                                  Text('$clubname',style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.white)),



                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(Icons.location_on,size: 15, color: Colors.grey),
                                                                  SizedBox(width: 10,),
                                                                  //Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),
                                                                  Text('$location',style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.white)),
                                                                  Row(
                                                                    children: [
                                                                      IconButton(

                                                                        icon: Icon(


                                                                          carAvailability ? Icons.toggle_on : Icons.toggle_off,
                                                                          color: carAvailability ? Colors.green : Colors.red,
                                                                        ),
                                                                        onPressed: () {
                                                                          setState(() {
                                                                            _isAvailable = !_isAvailable;
                                                                          });
                                                                          FirebaseFirestore.instance
                                                                              .collection('liveshows')
                                                                              .doc(document.id)
                                                                              .update({'live': _isAvailable})
                                                                              .then((value) => print(document.id))
                                                                              .catchError((error) => print('Failed to update availability: $error'));
                                                                        },
                                                                      ),

                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(Icons.timelapse_rounded,size: 15, color: Colors.grey),
                                                                  SizedBox(width: 10,),
                                                                  Text('$starttime - $endtime',style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.white)),



                                                                ],
                                                              ),
                                                              Row(
                                                                children: [

                                                                  Icon(Icons.monetization_on,size: 15, color: Colors.grey),

                                                                  Text('KES' + '$price',style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.green)),
                                                                ],
                                                              )






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
                                        Lottie.asset('lib/assets/icons/reques.json',height: 120,),

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


                //EVENTS
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('events')
                     // .where('availability', isEqualTo: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('An error occurred while loading the data.'),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Lottie.asset('lib/assets/icons/party.json'),
                      );
                    }

                    if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text('No  details found.'),
                      );
                    }

                    return ListView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()
                      ),
                      scrollDirection: Axis.vertical,
                      children: snapshot.data!.docs.map((document) {

                        final location = document.get('location');

                        final starttime = document.get('starttime');
                        final endtime = document.get('endtime');
                        final clubname = document.get('eventname');

                        final imageurl = document.get('imageurl');
                        final price = document.get('price');
                        final dj = document.get('dj');
                        bool carAvailability = document.get('availability');
                        bool _isAvailable = carAvailability;
                        void deleteCar(String carId) {
                          FirebaseFirestore.instance
                              .collection('events')
                              .doc(carId)
                              .delete()
                              .then((value) => print('Event deleted'))
                              .catchError((error) => print('Failed to delete car: $error'));
                        }



                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: InkWell(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EditEvent(docId: document.id,),),);},
                            onLongPress: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Delete Event??'),
                                    content: Text('Are you sure you want to delete this?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          deleteCar(document.id);
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  );
                                },
                              );

                            },

                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0,left: 10,right: 10),
                              child: Column(
                                children: [
                                  Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: carAvailability ? Colors.deepPurple.withOpacity(0.8) : Colors.deepOrangeAccent.withOpacity(0.5),
                                    //  color: Colors.deepPurple.withOpacity(0.8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(

                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        image: DecorationImage(
                                                          image: AssetImage('$imageurl'),
                                                          fit: BoxFit.cover,
                                                        )
                                                    ),
                                                    child: Stack(
                                                      children: [carAvailability ?
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
                                                        ) :Positioned(
                                                        bottom: 5,
                                                        right: 5,
                                                        child: Container(
                                                          width: 60,
                                                          height: 20,


                                                        ),
                                                      ),

                                                      ],
                                                    ),
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
                                                                  Container(width:70,height:22,child: Text('$dj',style: GoogleFonts.bebasNeue(fontSize:22,color: Colors.black))),
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
                                                                  Row(
                                                                    children: [
                                                                      IconButton(

                                                                        icon: Icon(


                                                                          carAvailability ? Icons.toggle_on : Icons.toggle_off,
                                                                          color: carAvailability ? Colors.green : Colors.red,
                                                                        ),
                                                                        onPressed: () {
                                                                          setState(() {
                                                                            _isAvailable = !_isAvailable;
                                                                          });
                                                                          FirebaseFirestore.instance
                                                                              .collection('events')
                                                                              .doc(document.id)
                                                                              .update({'availability': _isAvailable})
                                                                              .then((value) => print(document.id))
                                                                              .catchError((error) => print('Failed to update availability: $error'));
                                                                        },
                                                                      ),

                                                                    ],
                                                                  )
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
                                        Lottie.asset('lib/assets/icons/request.json',height: 90,),
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














              ],
            ),
          ),


        ],
      ),
    );
  }


}


class Mad extends StatelessWidget {
  const Mad({Key? key}) : super(key: key);

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
          scrollDirection: Axis.horizontal,
          children: snapshot.data!.docs.map((document) {

            final location = document.get('location');

            final starttime = document.get('starttime');
            final endtime = document.get('endtime');
            final clubname = document.get('clubname');

            final imageurl = document.get('imageurl');
            final price = document.get('price');
            final dj = document.get('dj');


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
                                                      Text('$dj',style: GoogleFonts.bebasNeue(fontSize:22,color: Colors.black)),
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
                            Lottie.asset('lib/assets/icons/reques.json',height: 120,),
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



