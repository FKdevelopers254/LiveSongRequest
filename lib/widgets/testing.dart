import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:liverequest/widgets/songmodel.dart';


import 'mixcloudpage.dart';



class MusicScreen extends StatelessWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;

    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _DiscoverMusic(),

              _TrendingMusic(songs: songs),

            ],
          ),
        ),
      ),

    );
  }
}




class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20 ,top:20 ,bottom:20 ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text('Trending Mixes'),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.27,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: songs.length,
                itemBuilder: (context, index){
                  return SongCard(song: songs[index]);

                }

            ),
          ),

        ],
      ),
    );
  }
}











class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),
          ),
          const SizedBox(height: 5,),
          Text(
            'Choose your Playlist',
            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),
          ),
          const SizedBox(height: 5,),
          TextFormField(
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                )




            ),),




        ],
      ),
    );
  }
}


class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
          ),
        )
      ],



    );
  }
}
