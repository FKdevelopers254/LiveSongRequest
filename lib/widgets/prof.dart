import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'addevent.dart';
import 'addliveshow.dart';
import 'addticketevent.dart';



class PointPages extends StatefulWidget {



  @override
  _PointPagesState createState() => _PointPagesState();
}

class _PointPagesState extends State<PointPages> {

  final user = FirebaseAuth.instance.currentUser!;
  bool _isFollowing = false;

  Future<int> getEventCountForEmail(String email) async {
    final CollectionReference eventsCollection =
    FirebaseFirestore.instance.collection('events');

    final QuerySnapshot snapshot =
    await eventsCollection.where('email', isEqualTo: email).get();

    return snapshot.docs.length;
  }



  bool _isLoading = false;



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Container(

                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Avatar(avatar: user.email!),
                      UserName(username: user.email!,),

                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Events",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              EventCounter(email: user.email!)



                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Followers",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('djs')
                                    .where('email', isEqualTo: user.email)
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

                                  return Column(

                                    children: snapshot.data!.docs.map((document) {

                                      final id = document.get('id');
                                      print('$id');




                                      return FollowerCounter(email: '$id');
                                    }).toList(),
                                  );
                                },
                              ),

                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Followings",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('djs')
                                    .where('email', isEqualTo: user.email)
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

                                  return Column(

                                    children: snapshot.data!.docs.map((document) {

                                      final id = document.get('email');
                                      print('$id');




                                      return FollowingCounter(email: '$id');
                                    }).toList(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEvent(),),);},
                child: Row(
                  children: [
                    Lottie.asset('lib/assets/icons/musicburst.json',height: 70),
                    Text('Add Event',style: GoogleFonts.poppins()),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTicketEvent(),),);},
                child: Row(
                  children: [
                    Lottie.asset('lib/assets/icons/party.json',height: 70,width: 70),
                    Text('Add Tickets',style: GoogleFonts.poppins(),),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const AddLiveShow(),),);},
                child: Row(
                  children: [
                    Lottie.asset('lib/assets/icons/party.json',height: 70,width: 70),
                    Text('Add Live Show',style: GoogleFonts.poppins(),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class EventCounter extends StatelessWidget {
  final String email;

  EventCounter({required this.email});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('events')
          .where('email', isEqualTo: email)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        }
        int count = snapshot.data!.docs.length;
        return Text('$count',style: TextStyle(fontSize: 20),);
      },
    );
  }
}

class Avatar extends StatelessWidget {
  final String avatar;
  const Avatar({required this.avatar});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('djs')
          .where('email', isEqualTo: avatar)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        }

        String image = snapshot.data!.docs[0].get('imageurl');

        return CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage('$image'),
        );
      },
    );
  }
}

class UserName extends StatelessWidget {

  final String username;

  const UserName({required this.username});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('djs')
          .where('email', isEqualTo: username)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        }

        String image = snapshot.data!.docs[0].get('artistname');

        return Text('$image');
      },
    );
  }
}



class FollowerCounter extends StatelessWidget {
  final String email;

  FollowerCounter({required this.email});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('djfollowers')
          .where('id', isEqualTo: email)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        }
        int count = snapshot.data!.docs.length;
        return Text('$count',style: TextStyle(fontSize: 20),);
      },
    );
  }
}




class FollowingCounter extends StatelessWidget {
  final String email;

  FollowingCounter({required this.email});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('djfollowers')
          .where('email', isEqualTo: email)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        }
        int count = snapshot.data!.docs.length;
        return Text('$count',style: TextStyle(fontSize: 20),);
      },
    );
  }
}



