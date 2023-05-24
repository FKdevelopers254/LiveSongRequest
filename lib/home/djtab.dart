import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:lottie/lottie.dart';

import '../djevents.dart';







class DjTab extends StatefulWidget {


   DjTab({Key? key}) : super(key: key);

  @override
  State<DjTab> createState() => _DjTabState();
}

class _DjTabState extends State<DjTab> {

  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<DocumentSnapshot> _hotels = [];
  List<DocumentSnapshot> _filteredHotels = [];


  bool _isLoading = false;




  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('djs')
        .get()
        .then((QuerySnapshot snapshot) {
      setState(() {
        _hotels = snapshot.docs;
        _filteredHotels = _hotels;
      });
    });
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2/2.5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,

      ),
      padding: const EdgeInsets.all(8),

      itemCount: _filteredHotels.length,
      itemBuilder: (context, index) => _buildItem(index),


    );
  }


  Widget _buildListView() {
    return ListView.builder(
      itemCount: _filteredHotels.length ,
      itemBuilder: (context, index) => _buildItemm(index),




    );
  }


  Widget _buildItem(int index) {
    final hotel = _filteredHotels[index];


    final hotelId = hotel.id;
    final user = FirebaseAuth.instance.currentUser;
    double rating = 2.5;






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
          .collection('djs')
          .doc(hotelId)
          .get();

      // Check if the hotel is already in the user's wishlist
      final QuerySnapshot wishlistSnapshot = await FirebaseFirestore.instance
          .collection('djfollowers')
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
      await FirebaseFirestore.instance.collection('djfollowers').doc(hotelId).set({
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

    void deleteHotel(String hotelId) {
      FirebaseFirestore.instance
          .collection('djfollowers')
          .doc(hotelId)
          .delete()
          .then((value) => print('Unfollowed'))
          .catchError((error) => print('Failed to delete car: $error'));
    }




    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailScreen(hotel),),);},
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Unfollow?'),
              content: Text('Are you sure you want to unfollow?'),
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
     // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DjSingles(item: items[index]),),);},
      child: Container(
        margin: const EdgeInsets.only(right: 1),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(

              width: MediaQuery.of(context).size.width*0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(hotel['imageurl']
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              left: 10.0,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('djfollowers')
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
                              'Following',
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
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width*0.37,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.8),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        hotel['artistname'],
                        style: GoogleFonts.bebasNeue(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            hotel['location'],
                            style: GoogleFonts.bebasNeue(color: Colors.deepPurple),
                          ),
                          SizedBox(width: 10,),
                          Text('\$'+
                              hotel['price'].toString(),
                            style: GoogleFonts.bebasNeue(color: Colors.black),
                          ),


                        ],
                      )
                    ],
                  ),
                  const Icon(
                    Icons.play_circle,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            )

          ],

        ),
      ),
    );
  }


  Widget _buildItemm(int index) {
    final hotel = _filteredHotels[index];


    final hotelId = hotel.id;
    final user = FirebaseAuth.instance.currentUser;






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
          .collection('djs')
          .doc(hotelId)
          .get();

      // Check if the hotel is already in the user's wishlist
      final QuerySnapshot wishlistSnapshot = await FirebaseFirestore.instance
          .collection('djfollowers')
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
      await FirebaseFirestore.instance.collection('djfollowers').doc(hotelId).set({
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

    void deleteHotel(String hotelId) {
      FirebaseFirestore.instance
          .collection('djfollowers')
          .doc(hotelId)
          .delete()
          .then((value) => print('Unfollowed'))
          .catchError((error) => print('Failed to delete car: $error'));
    }




    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailScreen(hotel),),);},
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Unfollow?'),
              content: Text('Are you sure you want to unfollow?'),
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
      // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DjSingles(item: items[index]),),);},
      child: Container(
        margin: const EdgeInsets.only(right: 1),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(

              width: MediaQuery.of(context).size.width*0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(hotel['imageurl']
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              left: 10.0,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('djfollowers')
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
                              'Following',
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
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width*0.37,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.8),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        hotel['artistname'],
                        style: GoogleFonts.bebasNeue(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            hotel['location'],
                            style: GoogleFonts.bebasNeue(color: Colors.deepPurple),
                          ),
                          SizedBox(width: 10,),
                          Text('\$'+
                              hotel['price'].toString(),
                            style: GoogleFonts.bebasNeue(color: Colors.black),
                          ),


                        ],
                      )
                    ],
                  ),
                  const Icon(
                    Icons.play_circle,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            )

          ],

        ),
      ),
    );
  }

  bool _isGridView = true;







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Type DJ Name",
            hintStyle: TextStyle(color: Colors.white,),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
              _filteredHotels = _hotels.where((hotel) {
                final name = hotel['artistname'] as String;
                final address = hotel['artistname'] as String;
                final searchText = _searchText.toLowerCase();
                return name.toLowerCase().contains(searchText) ||
                    address.toLowerCase().contains(searchText);
              }).toList();
            });
          },




        ),
        actions: [

          MaterialButton(
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
            child: Icon(_isGridView ? Icons.view_list : Icons.view_module),

          )


        ],


      ),
      body:_filteredHotels.isEmpty
          ? Center(child: CircularProgressIndicator())
          : _isGridView ? _buildGridView() : _buildListView() ,

    );
  }
}


class DjTabLocation extends StatefulWidget {


  DjTabLocation({Key? key}) : super(key: key);

  @override
  State<DjTabLocation> createState() => _DjTabLocationState();
}

class _DjTabLocationState extends State<DjTabLocation> {

  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<DocumentSnapshot> _hotels = [];
  List<DocumentSnapshot> _filteredHotels = [];


  bool _isLoading = false;




  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('djs')
        .get()
        .then((QuerySnapshot snapshot) {
      setState(() {
        _hotels = snapshot.docs;
        _filteredHotels = _hotels;
      });
    });
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2/2.5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,

      ),
      padding: const EdgeInsets.all(8),

      itemCount: _filteredHotels.length,
      itemBuilder: (context, index) => _buildItem(index),


    );
  }


  Widget _buildListView() {
    return ListView.builder(
      itemCount: _filteredHotels.length ,
      itemBuilder: (context, index) => _buildItemm(index),




    );
  }


  Widget _buildItem(int index) {
    final hotel = _filteredHotels[index];


    final hotelId = hotel.id;
    final user = FirebaseAuth.instance.currentUser;
    double rating = 2.5;






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
          .collection('djs')
          .doc(hotelId)
          .get();

      // Check if the hotel is already in the user's wishlist
      final QuerySnapshot wishlistSnapshot = await FirebaseFirestore.instance
          .collection('djfollowers')
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
      await FirebaseFirestore.instance.collection('djfollowers').doc(hotelId).set({
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

    void deleteHotel(String hotelId) {
      FirebaseFirestore.instance
          .collection('djfollowers')
          .doc(hotelId)
          .delete()
          .then((value) => print('Unfollowed'))
          .catchError((error) => print('Failed to delete car: $error'));
    }




    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailScreen(hotel),),);},
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Unfollow?'),
              content: Text('Are you sure you want to unfollow?'),
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
      // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DjSingles(item: items[index]),),);},
      child: Container(
        margin: const EdgeInsets.only(right: 1),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(

              width: MediaQuery.of(context).size.width*0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(hotel['imageurl']
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              left: 10.0,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('djfollowers')
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
                              'Following',
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
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width*0.37,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.8),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        hotel['artistname'],
                        style: GoogleFonts.bebasNeue(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            hotel['location'],
                            style: GoogleFonts.bebasNeue(color: Colors.deepPurple),
                          ),
                          SizedBox(width: 10,),
                          Text('\$'+
                              hotel['price'].toString(),
                            style: GoogleFonts.bebasNeue(color: Colors.black),
                          ),


                        ],
                      )
                    ],
                  ),
                  const Icon(
                    Icons.play_circle,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            )

          ],

        ),
      ),
    );
  }


  Widget _buildItemm(int index) {
    final hotel = _filteredHotels[index];


    final hotelId = hotel.id;
    final user = FirebaseAuth.instance.currentUser;






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
          .collection('djs')
          .doc(hotelId)
          .get();

      // Check if the hotel is already in the user's wishlist
      final QuerySnapshot wishlistSnapshot = await FirebaseFirestore.instance
          .collection('djfollowers')
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
      await FirebaseFirestore.instance.collection('djfollowers').doc(hotelId).set({
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

    void deleteHotel(String hotelId) {
      FirebaseFirestore.instance
          .collection('djfollowers')
          .doc(hotelId)
          .delete()
          .then((value) => print('Unfollowed'))
          .catchError((error) => print('Failed to delete car: $error'));
    }




    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailScreen(hotel),),);},
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Unfollow?'),
              content: Text('Are you sure you want to unfollow?'),
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
      // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DjSingles(item: items[index]),),);},
      child: Container(
        margin: const EdgeInsets.only(right: 1),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(

              width: MediaQuery.of(context).size.width*0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(hotel['imageurl']
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              left: 10.0,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('djfollowers')
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
                              'Following',
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
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width*0.37,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.8),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        hotel['artistname'],
                        style: GoogleFonts.bebasNeue(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            hotel['location'],
                            style: GoogleFonts.bebasNeue(color: Colors.deepPurple),
                          ),
                          SizedBox(width: 10,),
                          Text('\$'+
                              hotel['price'].toString(),
                            style: GoogleFonts.bebasNeue(color: Colors.black),
                          ),


                        ],
                      )
                    ],
                  ),
                  const Icon(
                    Icons.play_circle,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            )

          ],

        ),
      ),
    );
  }

  bool _isGridView = true;







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Type DJ Name",
            hintStyle: TextStyle(color: Colors.white,),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
              _filteredHotels = _hotels.where((hotel) {
                final name = hotel['artistname'] as String;
                final address = hotel['artistname'] as String;
                final searchText = _searchText.toLowerCase();
                return name.toLowerCase().contains(searchText) ||
                    address.toLowerCase().contains(searchText);
              }).toList();
            });
          },




        ),
        actions: [

          MaterialButton(
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
            child: Icon(_isGridView ? Icons.view_list : Icons.view_module),

          )


        ],


      ),
      body:_filteredHotels.isEmpty
          ? Center(child: CircularProgressIndicator())
          : _isGridView ? _buildGridView() : _buildListView() ,

    );
  }
}









class HotelDetailScreen extends StatelessWidget {
  final CollectionReference _ratingsRef =
  FirebaseFirestore.instance.collection('ratinghotel');



  final DocumentSnapshot documen;





  bool isLoading = false;

  HotelDetailScreen(this.documen);





  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late String _hotelname;







  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchURLL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false, // Set this to 'true' on iOS to open in Safari ViewController
        forceWebView: false, // Set this to 'true' on Android to open in a WebView instead of the default browser
      );
    } else {
      throw 'Could not launch $url';
    }
  }




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
















  @override
  Widget build(BuildContext context) {
    double fem =0.9;
    double ffem =0.9;
   // final email= documen['email'];
    final theid= documen['id'];
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
                    TyperAnimatedText(documen['artistname'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),

                    TyperAnimatedText(documen['location'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),
                    TyperAnimatedText(documen['price'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),

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
                        Image.asset(
                          documen['imageurl'],
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          documen['imageurl'],
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          documen['imageurl'],
                          fit: BoxFit.cover,
                        ),
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

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,top: 8.0,bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Socials',style: GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w600),),


                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [


                            GestureDetector(
                                onTap: () => _launchURL('https://www.youtube.com/NashTunic'),

                                child: Lottie.asset('lib/assets/icons/yt.json',height: 70)),
                            Lottie.asset('lib/assets/icons/pp.json',height: 70,width: 50),
                            Lottie.asset('lib/assets/icons/fb.json',height: 70),
                            Lottie.asset('lib/assets/icons/mc.json',height: 70),

                          ],
                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // autogroupjuq148g (Eh5gZPy2nfg7PPw9pWjUq1)
                      padding:  EdgeInsets.fromLTRB(0, 16, 0, 0),
                      width:  double.infinity,
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children:  [
                          Container(
                            // listQCY (1:500)
                            margin:  EdgeInsets.fromLTRB(0, 0, 1, 16),
                            width:  double.infinity,
                            height:  86,
                            child:
                            Row(
                              crossAxisAlignment:  CrossAxisAlignment.center,
                              children:  [
                                Container(
                                  // rectangle22469WFa (1:501)
                                  width:  86,
                                  height:  86,
                                  decoration:  BoxDecoration (
                                    borderRadius:  BorderRadius.circular(8),
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
                                  padding:  EdgeInsets.fromLTRB(12, 5, 0, 5),
                                  height:  double.infinity,
                                  child:
                                  Row(
                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                    children:  [
                                      Container(
                                        // group1000003484k9v (1:502)
                                        margin:  EdgeInsets.fromLTRB(0, 0, 43, 0),
                                        width:  112,
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
                                                    documen['artistname'],
                                                    style:  GoogleFonts.poppins (

                                                      fontSize:  16*ffem,
                                                      fontWeight:  FontWeight.w700,
                                                      height:  1.5*ffem/fem,
                                                      letterSpacing:  0.08*fem,
                                                      color:  Color(0xff111111),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.local_airport_rounded,size: 10),
                                                      Text(
                                                        // days2nightsmKv (1:509)
                                                        documen['location'],
                                                        style:  GoogleFonts.poppins (

                                                          fontSize:  17*ffem,
                                                          fontWeight:  FontWeight.w500,
                                                          height:  1.6666666667*ffem/fem,
                                                          letterSpacing:  0.06*fem,
                                                          color:  Color(0xff78828a),
                                                        ),
                                                      ),
                                                    ],
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
                                              text:  'KES',
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

                          Row(
                            children: [
                              Icon(Icons.music_note_sharp,size: 10,),
                              Text(
                                // days2nightsmKv (1:509)
                                'Genre',
                                style:  GoogleFonts.poppins (

                                  fontSize:  14*ffem,
                                  fontWeight:  FontWeight.w500,
                                  height:  1.6666666667*ffem/fem,
                                  letterSpacing:  0.06*fem,
                                  color:  Colors.black,
                                ),
                              ),
                              Text('  '),
                              Text(
                                // days2nightsmKv (1:509)
                                documen['genre'],
                                style:  GoogleFonts.poppins (

                                  fontSize:  14*ffem,
                                  fontWeight:  FontWeight.w500,
                                  height:  1.6666666667*ffem/fem,
                                  letterSpacing:  0.06*fem,
                                  color:  Color(0xff78828a),
                                ),
                              ),
                            ],
                          ),

                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DjEvents(email: documen['email'],),),);},

                            child: Row(
                              children: [
                                Icon(Icons.music_note_sharp,size: 10,),
                                Text(
                                  // days2nightsmKv (1:509)
                                  'View My Events',
                                  style:  GoogleFonts.poppins (

                                    fontSize:  14*ffem,
                                    fontWeight:  FontWeight.w500,
                                    height:  1.6666666667*ffem/fem,
                                    letterSpacing:  0.06*fem,
                                    color:  Colors.black,
                                  ),
                                ),
                                Text('  '),
                                StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('events')
                                      .where('email', isEqualTo: documen['email'])
                                      .snapshots(),
                                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return Text('Loading...');
                                    }
                                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                                      return Text('Not found');
                                    }
                                    int count = snapshot.data!.docs.length;
                                    String eventName = snapshot.data!.docs[0]['eventname'];

                                    return Column(
                                      children: [
                                        Text('$count', style: TextStyle()),
                                        // Add additional widgets or UI components here
                                      ],
                                    );
                                  },
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
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













class EventTab extends StatefulWidget {


  EventTab({Key? key}) : super(key: key);

  @override
  State<EventTab> createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {

  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<DocumentSnapshot> _hotels = [];
  List<DocumentSnapshot> _filteredHotels = [];


  bool _isLoading = false;




  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('events')
        .get()
        .then((QuerySnapshot snapshot) {
      setState(() {
        _hotels = snapshot.docs;
        _filteredHotels = _hotels;
      });
    });
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2/2.5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,

      ),
      padding: const EdgeInsets.all(8),

      itemCount: _filteredHotels.length,
      itemBuilder: (context, index) => _buildItem(index),


    );
  }


  Widget _buildListView() {
    return ListView.builder(
      itemCount: _filteredHotels.length ,
      itemBuilder: (context, index) => _buildItemm(index),




    );
  }


  Widget _buildItem(int index) {
    final hotel = _filteredHotels[index];


    final hotelId = hotel.id;
    final user = FirebaseAuth.instance.currentUser;
    double rating = 2.5;






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

    void deleteHotel(String hotelId) {
      FirebaseFirestore.instance
          .collection('eventswishlist')
          .doc(hotelId)
          .delete()
          .then((value) => print('Unfollowed'))
          .catchError((error) => print('Failed to delete car: $error'));
    }




    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailScreen(hotel),),);},
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Unfollow?'),
              content: Text('Are you sure you want to unfollow?'),
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
      // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DjSingles(item: items[index]),),);},
      child: Container(
        margin: const EdgeInsets.only(right: 1),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(

              width: MediaQuery.of(context).size.width*0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(hotel['imageurl']
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
                              'Following',
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
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width*0.37,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.8),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        hotel['eventname'],
                        style: GoogleFonts.bebasNeue(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            hotel['location'],
                            style: GoogleFonts.bebasNeue(color: Colors.deepPurple),
                          ),
                          SizedBox(width: 10,),
                          Text('\$'+
                              hotel['price'].toString(),
                            style: GoogleFonts.bebasNeue(color: Colors.black),
                          ),


                        ],
                      )
                    ],
                  ),
                  const Icon(
                    Icons.play_circle,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            )

          ],

        ),
      ),
    );
  }


  Widget _buildItemm(int index) {
    final hotel = _filteredHotels[index];


    final hotelId = hotel.id;
    final user = FirebaseAuth.instance.currentUser;






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
          .collection('djs')
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

    void deleteHotel(String hotelId) {
      FirebaseFirestore.instance
          .collection('eventswishlist')
          .doc(hotelId)
          .delete()
          .then((value) => print('Unfollowed'))
          .catchError((error) => print('Failed to delete car: $error'));
    }




    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EventsDetailScreen(hotel),),);},
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Unfollow?'),
              content: Text('Are you sure you want to unfollow?'),
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
      // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DjSingles(item: items[index]),),);},
      child: Container(
        margin: const EdgeInsets.only(right: 1),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(

              width: MediaQuery.of(context).size.width*0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(hotel['imageurl']
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
                              'Following',
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
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width*0.37,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.8),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        hotel['eventname'],
                        style: GoogleFonts.bebasNeue(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            hotel['location'],
                            style: GoogleFonts.bebasNeue(color: Colors.deepPurple),
                          ),
                          SizedBox(width: 10,),
                          Text('\$'+
                              hotel['price'].toString(),
                            style: GoogleFonts.bebasNeue(color: Colors.black),
                          ),


                        ],
                      )
                    ],
                  ),
                  const Icon(
                    Icons.play_circle,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            )

          ],

        ),
      ),
    );
  }

  bool _isGridView = true;







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Type Event Name",
            hintStyle: TextStyle(color: Colors.white,),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
              _filteredHotels = _hotels.where((hotel) {
                final name = hotel['eventname'] as String;
                final address = hotel['eventname'] as String;
                final searchText = _searchText.toLowerCase();
                return name.toLowerCase().contains(searchText) ||
                    address.toLowerCase().contains(searchText);
              }).toList();
            });
          },




        ),
        actions: [

          MaterialButton(
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
            child: Icon(_isGridView ? Icons.view_list : Icons.view_module),

          )


        ],


      ),
      body:_filteredHotels.isEmpty
          ? Center(child: CircularProgressIndicator())
          : _isGridView ? _buildGridView() : _buildListView() ,

    );
  }
}









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
















  @override
  Widget build(BuildContext context) {
    double fem =0.9;
    double ffem =0.9;
    // final email= documen['email'];
    final theid= documen['id'];
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
                    TyperAnimatedText(documen['eventname'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),

                    TyperAnimatedText(documen['location'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),
                    TyperAnimatedText(documen['price'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),

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
                        Image.asset(
                          documen['imageurl'],
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          documen['imageurl'],
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          documen['imageurl'],
                          fit: BoxFit.cover,
                        ),
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

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,top: 8.0,bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Socials',style: GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w600),),


                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [


                            Lottie.asset('lib/assets/icons/yt.json',height: 70),
                            Lottie.asset('lib/assets/icons/pp.json',height: 70,width: 50),
                            Lottie.asset('lib/assets/icons/fb.json',height: 70),
                            Lottie.asset('lib/assets/icons/mc.json',height: 70),

                          ],
                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // autogroupjuq148g (Eh5gZPy2nfg7PPw9pWjUq1)
                      padding:  EdgeInsets.fromLTRB(0, 16, 0, 0),
                      width:  double.infinity,
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children:  [
                          Container(
                            // listQCY (1:500)
                            margin:  EdgeInsets.fromLTRB(0, 0, 1, 16),
                            width:  double.infinity,
                            height:  86,
                            child:
                            Row(
                              crossAxisAlignment:  CrossAxisAlignment.center,
                              children:  [
                                Container(
                                  // rectangle22469WFa (1:501)
                                  width:  86,
                                  height:  86,
                                  decoration:  BoxDecoration (
                                    borderRadius:  BorderRadius.circular(8),
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
                                  padding:  EdgeInsets.fromLTRB(12, 5, 0, 5),
                                  height:  double.infinity,
                                  child:
                                  Row(
                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                    children:  [
                                      Container(
                                        // group1000003484k9v (1:502)
                                        margin:  EdgeInsets.fromLTRB(0, 0, 43, 0),
                                        width:  112,
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
                                                  Row(
                                                    children: [
                                                      Icon(Icons.local_airport_rounded,size: 10),
                                                      Text(
                                                        // days2nightsmKv (1:509)
                                                        documen['location'],
                                                        style:  GoogleFonts.poppins (

                                                          fontSize:  17*ffem,
                                                          fontWeight:  FontWeight.w500,
                                                          height:  1.6666666667*ffem/fem,
                                                          letterSpacing:  0.06*fem,
                                                          color:  Color(0xff78828a),
                                                        ),
                                                      ),
                                                    ],
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
                                              text:  'KES',
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

                          Row(
                            children: [
                              Icon(Icons.music_note_sharp,size: 10,),
                              Text(
                                // days2nightsmKv (1:509)
                                'Genre',
                                style:  GoogleFonts.poppins (

                                  fontSize:  14*ffem,
                                  fontWeight:  FontWeight.w500,
                                  height:  1.6666666667*ffem/fem,
                                  letterSpacing:  0.06*fem,
                                  color:  Colors.black,
                                ),
                              ),
                              Text('  '),
                              Text(
                                // days2nightsmKv (1:509)
                                documen['location'],
                                style:  GoogleFonts.poppins (

                                  fontSize:  14*ffem,
                                  fontWeight:  FontWeight.w500,
                                  height:  1.6666666667*ffem/fem,
                                  letterSpacing:  0.06*fem,
                                  color:  Color(0xff78828a),
                                ),
                              ),
                            ],
                          ),

                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DjEvents(email: documen['email'],),),);},

                            child: Row(
                              children: [
                                Icon(Icons.music_note_sharp,size: 10,),
                                Text(
                                  // days2nightsmKv (1:509)
                                  'View My Events',
                                  style:  GoogleFonts.poppins (

                                    fontSize:  14*ffem,
                                    fontWeight:  FontWeight.w500,
                                    height:  1.6666666667*ffem/fem,
                                    letterSpacing:  0.06*fem,
                                    color:  Colors.black,
                                  ),
                                ),
                                Text('  '),
                                StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('events')
                                      .where('email', isEqualTo: documen['email'])
                                      .snapshots(),
                                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (!snapshot.hasData) {
                                      return Text('Loading...');
                                    }
                                    int count = snapshot.data!.docs.length;
                                    String eventName = snapshot.data!.docs[0]['eventname'];


                                    return Column(
                                      children: [
                                        Text('$count', style: TextStyle(),),

                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
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
