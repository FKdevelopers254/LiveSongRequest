
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../home/djtab.dart';
import '../home/eventspagetab.dart';
import '../home/eventspagetablocation.dart';











class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser!;
  late TabController tabController;
  @override
  void  initState(){
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurple.shade800.withOpacity(0.8),
                  Colors.deepPurple.shade200.withOpacity(0.8),

                ]
            )
        ),
      child: Scaffold(
       // backgroundColor: Color(0xFFF9EFEB),
        body: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()
          ),
          children: <Widget>[
            Stack(
              children: <Widget>[

                Container(
                  height: 60.0,

                  decoration:  BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                      //   color: Color(0xFFFD7465),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(75.0,),bottomLeft: Radius.circular(75.0,)



                      )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 5,),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {

                          },
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText('SEARCH FOR EVENTS ',textStyle: GoogleFonts.bebasNeue(fontSize:28,color: Colors.white)),

                              TyperAnimatedText('ANYWHERE,ANYTIME',textStyle: GoogleFonts.bebasNeue(fontSize:28,color: Colors.white)),

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
                        child: Lottie.asset('lib/assets/icons/musicburst.json',height: 70,)),

                    SizedBox(width: 5,),
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
              labelColor: Color(0xFF440206),
              unselectedLabelColor: Color(0xFF440206),
              tabs: const [
                Tab(
                  child: Text(
                    'Event Name',style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15.0,
                  ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Event Location',style: TextStyle(
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
                children:   <Widget>[

                  EventsTab(),
                  EventsTabLocation(),











                ],
              ),
            ),


          ],
        ),
      ),
    );
  }


}


