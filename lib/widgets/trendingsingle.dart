import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liverequest/assets/requestpage.dart';

class TrendingSingles extends StatelessWidget {
  final Map<String, String> items;
  const TrendingSingles({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DefaultTabController(
        length: 3,
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
                title:  Text(items['artistname']!),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                   // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg', fit: BoxFit.cover,),
                    Image.asset(items['imagepath']!
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
                   Container(
                     decoration: BoxDecoration(
                       color: Colors.deepPurple.shade700.withOpacity(0.8),
                     ),
                     child: Row(

                       mainAxisAlignment: MainAxisAlignment.spaceBetween,

                       children: [
                         Container(

                           child: Row(

                             children: [
                               IconButton(
                                   onPressed: (){},
                                   icon: Icon(Icons.music_note_sharp)

                               ),
                               Text('Request'),
                             ],
                           ),

                         ),
                         Container(

                           child: Row(

                             children: [
                               IconButton(
                                   onPressed: (){},
                                   icon: Icon(Icons.phonelink)

                               ),
                               Text('My Profile'),
                             ],
                           ),

                         ),
                         Padding(
                           padding: const EdgeInsets.only(right: 13.0),
                           child: Container(

                             child: Row(

                               children: [
                                 MaterialButton(
                                     onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RequestSongPage()),);},
                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

                                     child: Row(
                                       children: [
                                         IconButton(
                                             onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RequestSongPage()),);},
                                             icon: const Icon(Icons.monetization_on)

                                         ),
                                         const Text('Tip'),
                                       ],
                                     ),

                                     onLongPress: (){}



                                 ),

                               ],
                             ),

                           ),
                         ),


                       ],
                     ),
                   ),

                  Container(
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
                      children: [
                        const ListTile(
                          leading: Icon(Icons.wb_sunny),
                          title: Text('Genre'),
                          subtitle: Text('hiphop,reggea,house'),
                        ),
                        const ListTile(
                          leading: Icon(Icons.wb_sunny),
                          title: Text('Genre'),
                          subtitle: Text('hiphop,reggea,house'),
                        ),
                        const ListTile(
                          leading: Icon(Icons.wb_sunny),
                          title: Text('Genre'),
                          subtitle: Text('hiphop,reggea,house'),
                        ),
                        const ListTile(
                          leading: Icon(Icons.wb_sunny),
                          title: Text('Genre'),
                          subtitle: Text('hiphop,reggea,house'),
                        ),
                        const ListTile(
                          leading: Icon(Icons.wb_sunny),
                          title: Text('Genre'),
                          subtitle: Text('hiphop,reggea,house'),
                        ),
                        const ListTile(
                          leading: Icon(Icons.wb_sunny),
                          title: Text('Genre'),
                          subtitle: Text('hiphop,reggea,house'),
                        ),
                        const ListTile(
                          leading: Icon(Icons.wb_sunny),
                          title: Text('Genre'),
                          subtitle: Text('hiphop,reggea,house'),
                        ),
                        const ListTile(
                          leading: Icon(Icons.wb_sunny),
                          title: Text('Genre'),
                          subtitle: Text('hiphop,reggea,house'),
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
