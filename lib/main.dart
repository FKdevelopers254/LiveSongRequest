import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:liverequest/widgets/bottombar.dart';
import 'package:liverequest/widgets/mixcoudsingle.dart';

import 'auth/main.dart';
import 'intropages/onboarding_screen.dart';





Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

      ),
      home:  AnimatedSplashScreen(
        duration: 3000,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(Icons.music_video, color: Colors.deepPurple),
            //Image.asset('lib/assets/icons/ic_launcher.png'),
            AnimatedTextKit( animatedTexts: [

              ColorizeAnimatedText(
                'Jam Live with your Facourite DJ', textStyle: TextStyle(fontSize: 28.0), colors: [Colors.purple,Colors.blue,Colors.yellow,Colors.red],
              )
            ],),

          ],
        ),
       // nextScreen: const OnBoardingScreen(),
        nextScreen: const BottomBar(),
        splashTransition: SplashTransition.fadeTransition,
      ),
      getPages: [


        GetPage(name: '/', page: () => const BottomBar()),
        GetPage(name: '/song', page: () => const SongScreen()),
      ],
    );
  }
}



class HomePage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
    'artistname': 'DJ NASH TUNIC',
    'location': 'Nairobi',
    'imagepath':'',
    'price' :'50',
     'genre':'AllRound',
     'availability':'Yes',
      'mixcloud':'nashtunic',
      'youtube':'Nash Tunic',
      'paypal':'djnash',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'


    },
    {
      'artistname': 'DJ LUCKY DUB',
      'location': 'Nairobi',
      'imagepath':'',
      'price' :'40',
      'genre':'Reggea',
      'availability':'Yes',
      'mixcloud':'nashtunic',
      'youtube':'Nash Tunic',
      'paypal':'djnash',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ Tophaz',
      'location': 'Nairobi',
      'imagepath':'',
      'price' :'100',
      'genre':'AllRound',
      'availability':'Yes',
      'mixcloud':'nashtunic',
      'youtube':'Nash Tunic',
      'paypal':'djnash',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ FESTA',
      'location': 'Nairobi',
      'imagepath':'',
      'price' :'90',
      'genre':'Riddim',
      'availability':'Yes',
      'mixcloud':'nashtunic',
      'youtube':'Nash Tunic',
      'paypal':'djnash',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ DOUBLE M',
      'location': 'Nairobi',
      'imagepath':'',
      'price' :'100',
      'genre':'HipHOP,Kenyan',
      'availability':'Yes',
      'mixcloud':'nashtunic',
      'youtube':'Nash Tunic',
      'paypal':'djnash',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ RAJYZ',
      'location': 'Nairobi',
      'imagepath':'',
      'price' :'500',
      'genre':'AllRound',
      'availability':'Yes',
      'mixcloud':'nashtunic',
      'youtube':'Nash Tunic',
      'paypal':'djnash',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ KUUCH',
      'location': 'Muranga',
      'imagepath':'',
      'price' :'50',
      'genre':'AllRound',
      'availability':'Yes',
      'mixcloud':'djkuuch',
      'youtube':'Kuuch',
      'paypal':'djkuuch',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },








  ];

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter GridView Example'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          items.length,
              (index) {
            return InkWell(
            //  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(item: items[index]),),);},
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      items[index]['artistname']!,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      items[index]['Bio']!,
                      style: const TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
