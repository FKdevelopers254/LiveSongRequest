
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

import 'bottombar.dart';


class Event {
  final String id;
  final String name;

  Event({
    required this.id,
    required this.name,
  });
}



class AddTicketEvent extends StatefulWidget {

  const AddTicketEvent({Key? key}) : super(key: key);

  @override
  State<AddTicketEvent> createState() => AddTicketEventState();
}

class AddTicketEventState extends State<AddTicketEvent> {



  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();


  @override
  void dispose(){



    _nameController.dispose();
    _addressController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }


  Future<void> addHotel() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    final user = FirebaseAuth.instance.currentUser!;
    print(user.email);
    final userDetailsSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: user.email)
        .get();

    if (userDetailsSnapshot.docs.isNotEmpty) {
      final documentId = userDetailsSnapshot.docs[0].id;
      final userDetails = userDetailsSnapshot.docs.first.data();
      final email = userDetails['email'];

      final hotelsSnapshot = await FirebaseFirestore.instance
          .collection('events')
          .where('email', isEqualTo: email)
          .get();

      if (hotelsSnapshot.docs.isNotEmpty) {
        final hotelId = hotelsSnapshot.docs.first.id;









        final name = _nameController.text;


        final address = _addressController.text;
        final price = _priceController.text;
        final description = _descriptionController.text;

        print('User details found: ${userDetails.toString()}');

        try {
          // String docId = FirebaseFirestore.instance.collection('rooms').doc().id;
          final roomDocRef= await FirebaseFirestore.instance.collection('rooms').add({

            'email': email,
            'hotelId': hotelId,

            'name': name,
            'address': address,
            'price': price,
            'description': description,
            'availability': true,
            'imageurl': 'assets/images/kozi3.jpg',


          });

          final roomId = roomDocRef.id;

          await roomDocRef.update({'id': roomId});

          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(

                title: Text('Success'),
                content: Text('Your Room details have been saved.'),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBar())),
                  ),
                ],
              );
            },
          );// dismiss the progress indicator dialog
        } catch (e) {
          print('Error writing hotel details to Firestore: $e');
          Navigator.pop(context); // dismiss the progress indicator dialog
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Error'),
                content: Text('An error occurred while saving your sickness details. Please try again later.'),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // handle the case where the user details document doesn't exist
        Navigator.pop(context); // dismiss the progress indicator dialog
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('User Details Not Found'),
              content: Text('We could not find your user details. Please try again later.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      }
    }}



  Future<List<Event>> fetchEvents(User user) async {
    final CollectionReference eventsCollection =
    FirebaseFirestore.instance.collection('events');

    QuerySnapshot querySnapshot = await eventsCollection
        .where('email', isEqualTo: user.email)
        .get();


    List<Event> events = querySnapshot.docs.map((doc) {

      return Event(
        id: doc.id,
        name: doc.get('eventname'),


      );

    }).toList();

    return events;

  }


  String? _selectedEvent;


  List<Event> _eventList = [];

  Future<void> loadEvents() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    List<Event> events = await fetchEvents(currentUser!);
    setState(() {
      _eventList = events;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],

        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('lib/assets/icons/reques.json', height: 70),
            Text('Add Ticket Event', style: GoogleFonts.poppins(fontSize: 24)),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.drive_file_rename_outline),
                          hintText: 'Event Name',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                        value: _selectedEvent,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedEvent = newValue;
                          });
                        },
                        items: _eventList.map((event) {
                          return DropdownMenuItem<String>(
                            value: event.id,
                            child: Text(event.name),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),


                //greetings

                const SizedBox(height: 10,),






                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.drive_file_rename_outline),

                          hintText: 'Ticket Name',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextFormField(
                        controller: _addressController,
                        readOnly: true,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2024),
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              _addressController.text =
                                  DateFormat('yyyy-MM-dd').format(selectedDate);
                            }
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.date_range),

                          hintText: 'Ticket End Sales',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ),



                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextFormField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.monetization_on),

                          hintText: 'Enter Price',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                )
                ,
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextFormField(
                        controller: _descriptionController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.description),

                          hintText: 'Enter Description',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                )
                ,
                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: addHotel,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Add Ticket',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25,),



              ],
            ),
          ),
        ),
      ),
    );
  }
}