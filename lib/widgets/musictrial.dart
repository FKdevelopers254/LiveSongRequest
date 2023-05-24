import 'package:flutter/material.dart';
import 'package:liverequest/widgets/searchwihlocation.dart';

import 'package:liverequest/widgets/searchwithprice.dart';



// This is the main application widget.
class hMyApp extends StatelessWidget {
  const hMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeeksforGeeks',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GeeksforGeeks'),
          backgroundColor: Colors.green,
        ),
        body: const ModalBottomSheetDemo(),
      ),
    );
  }
}

class ModalBottomSheetDemo extends StatelessWidget {
  const ModalBottomSheetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {

          showModalBottomSheet<void>(

            context: context,
            builder: (BuildContext context) {

              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  <Widget>[
                      MaterialButton(
                        child: Row(
                          children: [
                            Icon(Icons.location_on),
                            Text('Search by Location'),
                          ],
                        ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MySearchPage()
                                )
                            );
                          },
                      ),
                      MaterialButton(
                        child: Row(
                          children: [
                            Icon(Icons.monetization_on),
                            Text('Search by Price'),
                          ],
                        ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => aMySearchPage()
                                )
                            );
                          },
                      ),

                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      // RaisedButton is deprecated and should not be used
      // Use ElevatedButton instead.

      // child: RaisedButton(
      //	 child: const Text('showModalBottomSheet'),
      //	 onPressed: () {

      //	 // when raised button is pressed
      //	 // we display showModalBottomSheet
      //	 showModalBottomSheet<void>(

      //		 // context and builder are
      //		 // required properties in this widget
      //		 context: context,
      //		 builder: (BuildContext context) {

      //		 // we set up a container inside which
      //		 // we create center column and display text
      //		 return Container(
      //			 height: 200,
      //			 child: Center(
      //			 child: Column(
      //				 mainAxisAlignment: MainAxisAlignment.center,
      //				 children: <Widget>[
      //				 const Text('GeeksforGeeks'),
      //				 ],
      //			 ),
      //			 ),
      //		 );
      //		 },
      //	 );
      //	 },
      // ),
    );
  }
}
