import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class EditLiveshow extends StatefulWidget {
  final String docId;


  EditLiveshow({required this.docId});

  @override
  _EditLiveshowState createState() => _EditLiveshowState();
}

class _EditLiveshowState extends State<EditLiveshow> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _priceController;

  late TextEditingController _descriptionController;
  late TextEditingController _imageurlController;
  late TextEditingController _eventdateController;
  late TextEditingController _starttimeController;
  late TextEditingController _endtimeController;



  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _priceController = TextEditingController();

    _descriptionController = TextEditingController();
    _imageurlController = TextEditingController();
    _eventdateController = TextEditingController();
    _starttimeController = TextEditingController();
    _endtimeController = TextEditingController();
    _loadData();
  }

  @override
  void dispose() {










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

  void _loadData() async {
    final doc = await FirebaseFirestore.instance.collection('liveshows').doc(widget.docId).get();
    final data = doc.data() as Map<String, dynamic>;
    _nameController.text = data['clubname'];
    _addressController.text = data['location'];
    _priceController.text = data['price'].toString();

    _descriptionController.text = data['description'];
    _imageurlController.text = data['imageurl'];
    _eventdateController.text = data['eventdate'];
    _starttimeController.text = data['starttime'];
    _endtimeController.text = data['endtime'];

  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final address = _addressController.text.trim();
      final price = int.parse(_priceController.text.trim());


      final description = _descriptionController.text.trim();
      final imageurl = _imageurlController.text.trim();
      final eventdate = _eventdateController.text.trim();
      final starttime = _starttimeController.text.trim();
      final endtime = _endtimeController.text.trim();

      await FirebaseFirestore.instance.collection('liveshows').doc(widget.docId).update({
        'clubname': name,
        'location': address,
        'price': price,

        'description': description,
        'imageurl': imageurl,
        'eventdate': eventdate,
        'starttime': starttime,
        'endtime': endtime,
      });

      Navigator.pop(context);
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Live Show'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Event Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a city';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),


                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),

                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Price';
                      }
                      final rating = int.tryParse(value);
                      if (rating == null || rating < 0 || rating > 50000000) {
                        return 'Please enter a rating between 0 and 5000000';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _eventdateController,
                    decoration: InputDecoration(
                      labelText: 'Event Date',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Event Date';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _starttimeController,
                    decoration: InputDecoration(
                      labelText: 'Start Time',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Start Time';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _endtimeController,
                    decoration: InputDecoration(
                      labelText: 'End Time',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter end time';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),



                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _imageurlController,
                    decoration: InputDecoration(
                      labelText: 'Image',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Image  Url';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text('Save'),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
