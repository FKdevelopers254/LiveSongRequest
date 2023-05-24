
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liverequest/widgets/prof.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';



class AddLiveShow extends StatefulWidget {

  const AddLiveShow({Key? key}) : super(key: key);

  @override
  State<AddLiveShow> createState() => _AddLiveShowState();
}

class _AddLiveShowState extends State<AddLiveShow> {



  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageurlController = TextEditingController();
  final _eventdateController = TextEditingController();
  final _starttimeController = TextEditingController();
  final _endtimeController = TextEditingController();






  @override
  void dispose(){



    _nameController.dispose();
    _addressController.dispose();
    _priceController.dispose();

    _descriptionController.dispose();
    _imageurlController.dispose();
    _eventdateController.dispose();
    _starttimeController.dispose();
    _endtimeController.dispose();

    super.dispose();
  }


  Future<void> addHotel() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    final user = FirebaseAuth.instance.currentUser!;
    print(user.email);
    final userDetailsSnapshot = await FirebaseFirestore.instance
        .collection('djs')
        .where('email', isEqualTo: user.email)
        .get();

    if (userDetailsSnapshot.docs.isNotEmpty) {
      final documentId = userDetailsSnapshot.docs[0].id;
      final userDetails = userDetailsSnapshot.docs.first.data();
      final email = userDetails['email'];

      final name = _nameController.text;


      final address = _addressController.text;
      final eventdate = _eventdateController.text;
      final starttime = _starttimeController.text;
      final endtime = _endtimeController.text;
      final price = _priceController.text;
      final dj = userDetails['email'];



      final description = _descriptionController.text;
      final imageurl = _imageurlController.text;



      print('User details found: ${userDetails.toString()}');

      try {
        String docId = FirebaseFirestore.instance.collection('liveshows').doc().id;
        await FirebaseFirestore.instance.collection('liveshows').doc(docId).set({

          'email': email,
          'clubname': name,
          'location': address,
          'eventdate': eventdate,
          'starttime': starttime,
          'endtime': endtime,
          'price': price,
          'dj': dj,

          'description': description,
          'imageurl': imageurl,
          'live': true,


          'id': docId

        });

        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Your Liveshow  details have been saved.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PointPages())),
                ),
              ],
            );
          },
        );// dismiss the progress indicator dialog
      } catch (e) {
        print('Error writing LiveShows details to Firestore: $e');
        Navigator.pop(context); // dismiss the progress indicator dialog
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('An error occurred while saving your car details. Please try again later.'),
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
            Text('Add LiveShow', style: GoogleFonts.poppins(fontSize: 24)),
          ],
        ),
      )
      ,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [




                const SizedBox(height: 30,),
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
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.title),

                          hintText: 'Show Name',
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
                      child: TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.local_activity_rounded),

                          hintText: 'Show Location',
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
                        controller: _eventdateController,
                        readOnly: true,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2024),
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              _eventdateController.text =
                                  DateFormat('yyyy-MM-dd').format(selectedDate);
                            }
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.date_range),

                          hintText: 'Show Date',
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
                        controller: _starttimeController,
                        readOnly: true,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((selectedTime) {
                            if (selectedTime != null) {
                              _starttimeController.text =
                                  selectedTime.format(context);
                            }
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.timelapse_rounded),

                          hintText: 'Start Time',
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
                        controller: _endtimeController,
                        readOnly: true,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((selectedTime) {
                            if (selectedTime != null) {
                              _endtimeController.text =
                                  selectedTime.format(context);
                            }
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.timelapse_rounded),

                          hintText: 'End Time',
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
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.monetization_on),

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
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.description),

                          hintText: 'Enter Description',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                )
                ,
                SizedBox(height: 10,),



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
                        controller: _imageurlController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(Icons.photo_album),


                          hintText: 'Enter Image Url',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

















                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: addHotel,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Add  Liveshow',
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
                SizedBox(height: 25,),



              ],
            ),
          ),
        ),
      ),
    );
  }
}