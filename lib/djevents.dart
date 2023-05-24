 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


 class DjEvents extends StatelessWidget {
   final String email;

   DjEvents({required this.email});

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
         String eventName = snapshot.data!.docs[0]['eventname'];


         return Column(
           children: [
             Text('$count', style: TextStyle(fontSize: 20),),
             Text(eventName),
           ],
         );
       },
     );
   }
 }

