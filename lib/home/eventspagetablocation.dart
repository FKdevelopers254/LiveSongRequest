
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../widgets/events.dart';

class EventsTabLocation extends StatefulWidget {


  EventsTabLocation({Key? key}) : super(key: key);

  @override
  State<EventsTabLocation> createState() => _EventsTabLocationState();
}

class _EventsTabLocationState extends State<EventsTabLocation> {

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
            hintText: "Type Event Location",
            hintStyle: TextStyle(color: Colors.white,),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
              _filteredHotels = _hotels.where((hotel) {
                final name = hotel['location'] as String;
                final address = hotel['location'] as String;
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