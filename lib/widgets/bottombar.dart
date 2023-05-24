import 'package:flutter/material.dart';
import 'package:liverequest/widgets/prof.dart';

import 'package:liverequest/widgets/search.dart';

import 'package:liverequest/widgets/shows_page.dart';
import 'package:liverequest/widgets/testing.dart';

import '../home/homepage.dart';
import '../home/profilepage.dart';







class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(

          child: getSelectedWidget(index: index),

        ),

        bottomNavigationBar:BottomNavigationBar(
          items:   const [
            BottomNavigationBarItem(
                icon: Image(image: AssetImage('lib/assets/icons/mylogo.png'),height: 20,),activeIcon: Icon(Icons.home_filled), label: 'HOME'),
            BottomNavigationBarItem(
                icon: Icon(Icons.music_video_rounded,),activeIcon: Icon(Icons.music_video), label: 'EVENTS') ,
            BottomNavigationBarItem(
                icon: Icon(Icons.spoke),activeIcon: Icon(Icons.spa), label: 'DJS'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),activeIcon: Icon(Icons.person), label: 'ACCOUNT'),
          ],
          currentIndex: index,
          elevation: 40,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.deepPurple[900],
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,


          backgroundColor: Colors.grey[300],

          onTap: (selectedIndex){
            setState(() {
              index = selectedIndex;
            });
          },








        )

    );
  }






  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = const MyHomePage();
        break;

      case 1:
        widget =  const MyPage();
        break;
      case 2:
        widget = const HotelP();
       // widget = const MusicScreen();
        break;
      default:
        widget = const ProfilePage();
      //  widget = bMyApp();

        break;
    }
    return widget;
  }










}



