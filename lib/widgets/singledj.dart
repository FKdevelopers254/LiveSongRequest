import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';






  //item['artistname']!




class DjSingles extends StatelessWidget {
  final Map<String, String> item;

  const DjSingles({required this.item});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(item['artistname']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.asset(
                      item['imagepath']!,
                      fit: BoxFit.cover,
                    ),

                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(icon: Icon(Icons.info), text: "Profile"),
                        Tab(icon: Icon(Icons.info), text: "Gigs"),
                        Tab(icon: Icon(Icons.lightbulb_outline), text: "Audio"),
                        Tab(icon: Icon(Icons.lightbulb_outline), text: "Video"),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body:
            TabBarView(
              children: [


                //Profile TAB
                InkWell(
                  //onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TrendingSingles(items: items[index]),),);},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0,left: 10,right: 10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.deepPurple.withOpacity(0.8),
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(item['imagepath']!),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
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
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Row(
                                                  children: [
                                                    Icon(Icons.youtube_searched_for,size: 15, color: Colors.grey),
                                                    // Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),
                                                    Text(item['artistname']!,style: GoogleFonts.bebasNeue(fontSize:22,color: Colors.black))


                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Icon(Icons.mic_external_on,size: 15, color: Colors.grey),
                                                    //Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),

                                                    Text(item['youtube']!,style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.white)),



                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(Icons.monetization_on_outlined,size: 15, color: Colors.grey),
                                                    //Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),
                                                    Text(item['mixcloud']!,style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.white)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(Icons.timelapse_rounded,size: 15, color: Colors.grey),
                                                    Text(item['mixcloud']!,style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.white)),
                                                    SizedBox(width: 12.0),
                                                    Icon(Icons.monetization_on,size: 15, color: Colors.grey),

                                                    Text('\$' + item['mixcloud']!,style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.white)),
                                                  ],
                                                ),




                                              ],
                                            ),

                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                  const Divider(thickness: 1,color: Colors.black,)
                                ],
                              ),
                            ],
                          ),
                        ),







                      ],
                    ),
                  ),
                ),

                //Gigs
                Container(
                  height: 100,

                  child: GridView.builder(



                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2/2.6,

                        crossAxisSpacing: 2,


                      ),
                      padding: const EdgeInsets.all(8),



                      itemBuilder: (BuildContext context,int index){


                        return InkWell(
                          onTap: (){

                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const TrendingSingle(item: '',)),);
                          },
                          onDoubleTap: (){

                            //Get.toNamed('/song', arguments:documentId);
                            // Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: const TrendingSingle()));

                          },

                          child: Column(


                            children: [

                              Image.asset(item['imagepath']!,),


                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.green.shade200
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [

                                        Text(item['artistname']!,style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.green[900]),),


                                        Icon(Icons.play_circle_outline_outlined,color: Colors.green,size: 10,),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Genre:',style: GoogleFonts.bebasNeue(fontSize:15),),

                                        Text('Afro',style: GoogleFonts.bebasNeue(fontSize:15),),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Best Of HipHop 2023',style: GoogleFonts.bebasNeue(fontSize:15),),

                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );

                      }
                  ),
                ),

                //Audio
                Container(
                  height: 100,

                  child: GridView.builder(



                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2/3,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,


                      ),
                      padding: const EdgeInsets.all(8),



                      itemBuilder: (BuildContext context,int index){


                        return InkWell(
                          onTap: (){

                            //  Navigator.push(context, MaterialPageRoute(builder: (context) => const TrendingSingle(item: '',)),);
                          },
                          onDoubleTap: (){

                            //Get.toNamed('/song', arguments:documentId);
                            // Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: const TrendingSingle()));

                          },

                          child: Column(


                            children: [

                              Image.asset('lib/assets/images/1.jpg',),


                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.green.shade200
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [

                                        Text('Nash Tunic',style: GoogleFonts.bebasNeue(fontSize:17,color: Colors.green[900]),),


                                        Icon(Icons.play_circle_outline_outlined,color: Colors.green,size: 10,),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Genre:',style: GoogleFonts.bebasNeue(fontSize:15),),

                                        Text('Afro',style: GoogleFonts.bebasNeue(fontSize:15),),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Best Of HipHop 2023',style: GoogleFonts.bebasNeue(fontSize:15),),

                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );

                      }
                  ),),




                //Video
                ListView(
                  children: [
                    Container(



                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: 'AsgNQb393Jk',
                                flags: YoutubePlayerFlags(
                                  autoPlay: false,
                                  mute: false,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: 'AsgNQb393Jk',
                                flags: YoutubePlayerFlags(
                                  autoPlay: false,
                                  mute: false,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                )


              ],
            )
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
