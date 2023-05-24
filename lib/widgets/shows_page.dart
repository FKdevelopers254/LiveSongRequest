
import 'package:flutter/material.dart';
import 'package:liverequest/widgets/appbar.dart';
import 'package:liverequest/widgets/events.dart';
import 'package:flutter/material.dart';



import 'package:liverequest/widgets/search.dart';

import 'package:liverequest/widgets/tabbar.dart';
import 'package:liverequest/widgets/liveshows.dart';

import '../home/trendingtab.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _searchButtonTapped() {  }
  List tabOptions =  [
    ['Events', const Eventss()],
    ['Trending',  TrendingTab()],
    ['Live', Trending()],
  ];




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: tabOptions.length,
      child: Container(
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

          body: ListView(
            children: [
              MyAppBar(
                title: 'Live Request',
                onTap: _searchButtonTapped,
              ),


              SizedBox(
                height: 600,
                child: MyTabBar(
                  tabOptions: tabOptions,
                ),
              ),





            ],
          ),


        ),

      ),
    );
  }
}




