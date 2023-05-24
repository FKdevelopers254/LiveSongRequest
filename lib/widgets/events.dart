
import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:liverequest/widgets/trendingsingle.dart';
import 'package:lottie/lottie.dart';

import 'eventsingle.dart';
import 'musicai.dart';



class EventsDetailScreen extends StatelessWidget {
  final CollectionReference _ratingsRef =
  FirebaseFirestore.instance.collection('ratinghotel');



  final DocumentSnapshot documen;






  bool isLoading = false;

  EventsDetailScreen(this.documen);





  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late String _hotelname;









  void _submitForm() {


    _formKey.currentState?.save();

    _uploadData();

  }

  void _uploadData() async {

    final url = Uri.https('markiniltd.com', '/add.php');
    final response = await http.post(url,
        body: {'title': _title, 'description': _description});

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['status'] == 'success') {

        print('Succesfull');
      }

      else {
        print('Error');
      }
    } else {
      print('Error');
    }
  }




  Text _buildRatingStars(double rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }





























  @override
  Widget build(BuildContext context) {
    double ffem=0.9;
    double fem=0.9;
    // final email= documen['email'];
  //  final theid= documen['id'];
    // print(theid);



    return Scaffold(
      body:  DefaultTabController(
        length: 1,
        child: CustomScrollView(

          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
              pinned: true,
              stretch: true,
              onStretchTrigger: () {
                // Function callback for stretch
                return Future<void>.value();
              },
              expandedHeight: 300.0,
              shadowColor: Colors.red[100],
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,

                ],
                centerTitle: true,
                title:  AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(documen['dj'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),

                    TyperAnimatedText(documen['location'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),

                  ],
                  pause: const Duration(milliseconds: 3000),

                  stopPauseOnTap: true,
                  repeatForever: true,
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg', fit: BoxFit.cover,),

                    CarouselSlider(
                      items: [
                        CachedNetworkImage(imageUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',fit: BoxFit.cover,
                          placeholder: (context, url) => CircularProgressIndicator(), // Placeholder widget while loading
                          errorWidget: (context, url, error) => Icon(Icons.error),)
                      ],
                      options: CarouselOptions(
                        height: 355,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        enlargeCenterPage: false,
                      ),

                    ),


                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Text(
                        '${3} Pictures', // replace 3 with the actual count of images
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                  ],
                ),
              ),
            ),


            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 8.0,bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Details',style: GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ),






                    ],

                  ),





                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // autogroupjuq148g (Eh5gZPy2nfg7PPw9pWjUq1)
                      padding:  EdgeInsets.fromLTRB(0*fem, 16*fem, 0*fem, 0*fem),
                      width:  double.infinity,
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children:  [
                          Container(
                            // listQCY (1:500)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 16*fem),
                            width:  double.infinity,
                            height:  86*fem,
                            child:
                            Row(
                              crossAxisAlignment:  CrossAxisAlignment.center,
                              children:  [
                                Container(
                                  // rectangle22469WFa (1:501)
                                  width:  86*fem,
                                  height:  86*fem,
                                  decoration:  BoxDecoration (
                                    borderRadius:  BorderRadius.circular(8*fem),
                                    color:  Color(0xffd9d9d9),
                                    image:  DecorationImage (
                                      fit:  BoxFit.cover,
                                      image:  AssetImage (
                                          documen['imageurl']
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupeanf1i8 (Eh5gjE1zGpGfQ7UekieaNF)
                                  padding:  EdgeInsets.fromLTRB(12*fem, 5*fem, 0*fem, 5*fem),
                                  height:  double.infinity,
                                  child:
                                  Row(
                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                    children:  [
                                      Container(
                                        // group1000003484k9v (1:502)
                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 43*fem, 0*fem),
                                        width:  112*fem,
                                        height:  double.infinity,
                                        child:
                                        Column(
                                          crossAxisAlignment:  CrossAxisAlignment.start,
                                          children:  [
                                            Container(
                                              // group1000003483Ubi (1:507)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                              width:  double.infinity,
                                              child:
                                              Column(
                                                crossAxisAlignment:  CrossAxisAlignment.start,
                                                children:  [
                                                  Text(
                                                    // ledadubeachE56 (1:508)
                                                    documen['eventname'],
                                                    style:  GoogleFonts.poppins (

                                                      fontSize:  16*ffem,
                                                      fontWeight:  FontWeight.w700,
                                                      height:  1.5*ffem/fem,
                                                      letterSpacing:  0.08*fem,
                                                      color:  Color(0xff111111),
                                                    ),
                                                  ),
                                                  Text(
                                                    // days2nightsmKv (1:509)
                                                    documen['eventdate'],
                                                    style:  GoogleFonts.poppins (

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
                                      RichText(
                                        // personrkg (1:510)
                                        text:
                                        TextSpan(
                                          style:  GoogleFonts.poppins (

                                            fontSize:  12*ffem,
                                            fontWeight:  FontWeight.w500,
                                            height:  1.6666666667*ffem/fem,
                                            letterSpacing:  0.06*fem,
                                            color:  Color(0xff000000),
                                          ),
                                          children:  [
                                            TextSpan(
                                              text:  documen['price'],
                                              style:  GoogleFonts.poppins (

                                                fontSize:  14*ffem,
                                                fontWeight:  FontWeight.w700,
                                                height:  1.5714285714*ffem/fem,
                                                letterSpacing:  0.07*fem,
                                                color:  Color(0xff111111),
                                              ),
                                            ),
                                            TextSpan(
                                              text:  '/Person',
                                              style:  GoogleFonts.poppins (

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
                          ),

                        ],
                      ),
                    ),
                  ),


                  MaterialButton(onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Column(
                            children: [

                              Text(documen['eventname']),
                            ],
                          ),
                          content: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Form(
                              key: _formKey,
                              child: Container(
                                height: 220,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: 'Contact Number',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0), // Adds rounded corners to the border
                                            borderSide: BorderSide(color: Colors.grey), // Changes the color of the border
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(color: Colors.blue), // Changes the color of the border when the field is focused
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.grey, // Changes the color of the label text
                                          ),
                                        ),
                                        onSaved: (value) => _title = value!,
                                      ),

                                      SizedBox(height: 16.0),
                                      TextFormField(
                                        maxLength: 400, // Sets a maximum length of 400 characters
                                        maxLines: null, // Allows for multiple lines of text
                                        decoration: InputDecoration(
                                          labelText: 'Enquire with details',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(color: Colors.blue),
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          helperText: 'Enter up to 400 characters', // Adds helper text to provide feedback on character count
                                        ),
                                        onSaved: (value) => _description = value!,
                                      ),



                                      const SizedBox(height: 16.0),

                                      MaterialButton(
                                        color: Colors.red,
                                        child: Text('Submit'),
                                        onPressed: () async {
                                          _submitForm();
                                          // initiate cURL request to Twilio API to send SMS message
                                          final response = await http.post(
                                            Uri.parse('https://markiniltd.com/twilio.php'),
                                            body: {
                                              'to': '+254794155449', // replace with recipient phone number
                                              'message': 'Event name: ${documen["eventname"]},,Contact Number: $_title,Description: $_description,', // use the title and description as the message body
                                            },
                                          );
                                          print(response.body);

                                          Navigator.of(context).pop();

                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text('Message sent successfully'),
                                              duration: Duration(seconds: 3),
                                            ),
                                          );



                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          actions:  [

                            ElevatedButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),

                          ],
                        );
                      },
                    );



                  }, child: Row(children: [Icon(Icons.book_outlined),Text('BUY TICKETS')],),),



                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,top: 8.0,bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description',style: GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),

                  Stack(
                    children: <Widget>[
                      Container(



                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 300.0,
                                    child: Text(
                                      documen['location'],
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2000,
                                    ),
                                  ),

                                ],
                              ),




                            ],
                          ),
                        ),
                      ),

                    ],
                  ),

                 
















                  // ListTiles++
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}


class Eventss extends StatefulWidget {
  const Eventss({Key? key}) : super(key: key);

  @override
  State<Eventss> createState() => _EventssState();
}

class _EventssState extends State<Eventss> {





  @override
  Widget build(BuildContext context) {


    return Container(



      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('events')
            .where('availability', isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred while loading the data.'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset('lib/assets/icons/party.json',height: 120),
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
              final eventname = document.get('eventname');
              final location = document.get('location');
              final eventdate = document.get('eventdate');
              final starttime = document.get('starttime');
              final endtime = document.get('endtime');

              final imageurl = document.get('imageurl');
              final price = document.get('price');
              final dj = document.get('dj');
              final hotelId = document.get('id');

              void deleteHotel(String hotelId) {
                FirebaseFirestore.instance
                    .collection('eventswishlist')
                    .doc(hotelId)
                    .delete()
                    .then((value) => print('Unfollowed'))
                    .catchError((error) => print('Failed to delete car: $error'));
              }

              bool _isLoading = false;

              void _djfollowers(String hotelId, BuildContext context) async {
                // Set the loading state to true
                setState(() {
                  _isLoading = true;
                });
                // Get the current user's email and name
                final FirebaseAuth auth = FirebaseAuth.instance;
                final User? user = auth.currentUser;
                final String? email = user!.email;
                // final String email = user?.email ?? 'nashtunic@gmail.com';


                // Get the hotel data using its ID
                final DocumentSnapshot snapshot = await FirebaseFirestore.instance
                    .collection('events')
                    .doc(hotelId)
                    .get();

                // Check if the hotel is already in the user's wishlist
                final QuerySnapshot wishlistSnapshot = await FirebaseFirestore.instance
                    .collection('eventswishlist')
                    .where('email', isEqualTo: email)
                    .where('id', isEqualTo: hotelId)
                    .get();
                final isWishlisted = wishlistSnapshot.docs.isNotEmpty;
                if (isWishlisted) {
                  // Hotel is already in the wishlist, show a snackbar and return

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'Failed ',
                        message: 'Retry Again Later.',
                        contentType: ContentType.failure,
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  // Set the loading state back to false
                  setState(() {
                    _isLoading = false;
                  });
                  return;
                }

                // Add the hotel data to   the wishlisthotels collection
                await FirebaseFirestore.instance.collection('eventswishlist').doc(hotelId).set({
                  'email': email,


                  'id': hotelId,
                });

                // Show a snackbar to the user
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: user.email!,
                      message: 'Thank you for following me.',
                      contentType: ContentType.success,
                    ),
                    duration: Duration(seconds: 2),
                  ),

                );

                // Set the loading state back to false
                setState(() {
                  _isLoading = false;
                });
              }

              final user = FirebaseAuth.instance.currentUser;



              return InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EventsDetailScreen(document),),);},

                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Remove From Wishlist?'),
                          content: Text('Are you sure you want to unfollow event?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                deleteHotel(hotelId);

                                Navigator.pop(context);
                              },
                              child: const Text('Unfollow'),
                            ),
                          ],
                        );
                      },
                    );
                  },

                // onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EventSingles(document.id),),);},
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0,left: 10.0,right: 10.0),
                  child: Column(
                    children: [
                      Container(



                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.red.shade400.withOpacity(0.1),
                                Colors.redAccent.withOpacity(0.3),


                              ]
                          ),
                          // color: <Colors>[Colors.grey.withOpacity(0.5),Colors.grey.withOpacity(0.5)],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              '$imageurl'),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 10.0,
                                          left: 10.0,
                                          child: StreamBuilder<QuerySnapshot>(
                                            stream: FirebaseFirestore.instance.collection('eventswishlist')
                                                .where('email', isEqualTo: user!.email)
                                                .where('id', isEqualTo: hotelId)
                                                .snapshots(),
                                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                              if (snapshot.hasError) {
                                                return Text('Error: ${snapshot.error}');
                                              }

                                              switch (snapshot.connectionState) {
                                                case ConnectionState.waiting:
                                                  return CircularProgressIndicator();
                                                default:
                                                  if (snapshot.data!.docs.isNotEmpty) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(15.0),
                                                        color: Colors.white.withOpacity(0.8),
                                                      ),

                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 2.0,right: 2),
                                                        child: Text(
                                                          'Wishlisted',
                                                          style: TextStyle(
                                                            color: Theme.of(context).primaryColor.withOpacity(0.8),
                                                            fontSize: 10.0,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      height: 30,



                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          GestureDetector(

                                                            child: Lottie.asset('lib/assets/icons/musicburst.json',height: 230,),
                                                            onTap:_isLoading
                                                                ? null // Disable the button while loading
                                                                : () => _djfollowers(hotelId, context),),



                                                          if (_isLoading)
                                                            Positioned.fill(
                                                              child: Container(
                                                                color: Theme.of(context).primaryColor.withOpacity(0.5),
                                                                child: Center(
                                                                  child: CircularProgressIndicator(
                                                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),


                                                        ],
                                                      ),
                                                    );
                                                  }
                                              }
                                            },
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            width: 45,
                                            height: 45,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: Container(

                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  15),

                                              color: Colors.white.withOpacity(
                                                  0.8),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                '$dj',
                                                style: GoogleFonts.bebasNeue(
                                                    color: Colors.black),),
                                            ),
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
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [

                                                Row(
                                                  children: [
                                                    Icon(Icons.holiday_village,
                                                        size: 17,
                                                        color: Colors.red.shade900
                                                            .withOpacity(0.8)),
                                                    // Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),
                                                    Text(
                                                        '$eventname',
                                                        style: GoogleFonts
                                                            .bebasNeue(
                                                            fontSize: 22,
                                                            color: Colors.white)),
                                                  ],
                                                ),
                                                const SizedBox(height: 5,),


                                                Container(
                                                  decoration: BoxDecoration(

                                                      borderRadius: BorderRadius
                                                          .circular(15),

                                                      color: Colors.white
                                                          .withOpacity(0.2)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .only(right: 8.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.location_on,
                                                            size: 15,
                                                            color: Colors.red
                                                                .shade900
                                                                .withOpacity(
                                                                0.8)),
                                                        //Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),
                                                        Text(
                                                            '$location',
                                                            style: GoogleFonts
                                                                .bebasNeue(
                                                                fontSize: 17,
                                                                color: Colors
                                                                    .black)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 5,),
                                                Row(
                                                  children: [
                                                    Icon(Icons.timelapse_rounded,
                                                        size: 15,
                                                        color: Colors.red.shade900
                                                            .withOpacity(0.8)),
                                                    Text('$starttime''-' '$endtime',
                                                        style: GoogleFonts
                                                            .bebasNeue(
                                                            fontSize: 17,
                                                            color: Colors.white)),
                                                    const SizedBox(width: 12.0),
                                                    const Icon(
                                                        Icons.monetization_on,
                                                        size: 15,
                                                        color: Colors.grey),

                                                    Text(
                                                        '\$''$price',
                                                        style: GoogleFonts
                                                            .bebasNeue(
                                                            fontSize: 17,
                                                            color: Colors.red
                                                                .shade900
                                                                .withOpacity(
                                                                0.8))),
                                                  ],
                                                ),
                                                const SizedBox(height: 5,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(15),

                                                      color: Colors.white
                                                          .withOpacity(0.2)
                                                  ),


                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.location_on,
                                                          size: 15,
                                                          color: Colors.red
                                                              .shade900
                                                              .withOpacity(0.8)),
                                                      //Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .only(right: 8.0),
                                                        child: Text(
                                                            '$eventdate',
                                                            style: GoogleFonts
                                                                .bebasNeue(
                                                                fontSize: 17,
                                                                color: Colors
                                                                    .black)),
                                                      ),
                                                    ],
                                                  ),
                                                ),


                                              ],
                                            ),

                                          ),

                                        ],
                                      ),
                                    ],
                                  ),

                                ],

                              ),

                            ],
                          ),
                        ),
                      ),


                    ],
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

