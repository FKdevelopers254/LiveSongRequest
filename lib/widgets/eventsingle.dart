import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EventSingles extends StatelessWidget {
  bool _showFullText = false;

  final Map<String, String> events;
    EventSingles({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DefaultTabController(
        length: 1,
        child: CustomScrollView(

          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
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
                    RotateAnimatedText(events['eventname']!),
                    RotateAnimatedText('At' +' '+ events['location']!),
                    RotateAnimatedText('On:' +' '+ events['datee']!),
                    RotateAnimatedText('From:' +' '+ events['time']!),
                  ],
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg', fit: BoxFit.cover,),
                    Image.asset(events['imagepath']!
                      ,fit: BoxFit.cover,
                    ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, 0.5),
                          end: Alignment.center,
                          colors: <Color>[
                            Color(0x60000000),
                            Color(0x00000000),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Container(




                        child: Row(

                          children: [

                            ElevatedButton(
                                onPressed: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return AlertDialog(
                                          title: Text('Book Ticket'),
                                          content: Text(events['description']!,
                                            textAlign: TextAlign.center,),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                              }, child: Text("Close"),
                                            )
                                          ],
                                        );
                                      }

                                  );

                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.book_online),
                                    Text('Book  Ticket'),
                                  ],
                                )),
                          ],
                        ),

                      ),



                    ],
                  ),




                  Container(
                    height: 600,
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

                    child: Column(
                      children:  [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Container(

                                height: 65,
                                width: 65,

                                child: Text(events['datee']!,style: TextStyle(color: Colors.white),),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.transparent.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('Date',style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text(':'),
                                      Text(events['datee']!),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Time',style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text(':'),
                                      Text(events['time']!),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Location',style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text(':'),
                                      Text(events['location']!),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Host',style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text(':'),
                                      Text(events['artistname']!),
                                    ],
                                  ),


                                ],
                              )
                            ],
                          ),

                        ),
                        Column(
                          children: [
                            Text(
                              events['description']!,

                              textAlign: TextAlign.left,
                            )






                          ],
                        ),

                      ],
                    ),
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
