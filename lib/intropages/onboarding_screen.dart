import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liverequest/auth/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth/login.dart';
import '../widgets/bottombar.dart';
import 'intropage1.dart';
import 'intropage2.dart';
import 'intropage3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage = (index == 2);
              });

            },
            children: [

              IntroPage1(),
              IntroPage2(),
              IntroPage3(),

            ],
          ),



          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                GestureDetector(
                  onTap: (){
                    _controller.jumpToPage(2);
                  },
                  child: Text('Skip',style: TextStyle(fontWeight: FontWeight.bold),),),

                SmoothPageIndicator(controller: _controller, count:3),


                onLastPage
                    ? GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)
                      {
                        return MainPage();
                      },),);
                  },
                  child: Text('Done',style: TextStyle(fontWeight: FontWeight.bold)),)
                    : GestureDetector(
                  onTap: (){
                    _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  },
                  child: Text('Next'),),

              ],


            ),
          ),
        ],

      ),

    );
  }
}
