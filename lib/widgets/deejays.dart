import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liverequest/widgets/singledj.dart';




class Deejays extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'artistname': 'DJ NASH TUNIC',
      'location': 'Nairobi',
      'imagepath':'lib/assets/images/1.jpg',
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
      'imagepath':'lib/assets/images/2.jpg',
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
      'imagepath':'lib/assets/images/djtopaz.jpg',
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
      'imagepath':'lib/assets/images/djfesta.jpg',
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
      'artistname': 'DJ GRAUCHI',
      'location': 'Nairobi',
      'imagepath':'lib/assets/images/djgrauchi.jpg',
      'price' :'100',
      'genre':'HipHOP,Kenyan',
      'availability':'Yes',
      'mixcloud':'djgrauchi',
      'youtube':'DJ Grauchi',
      'paypal':'djnash',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ Joe Mfalme',
      'location': 'Nairobi',
      'imagepath':'lib/assets/images/djjoemfalme.jpg',
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
      'artistname': 'DJ NickDee',
      'location': 'Muranga',
      'imagepath':'lib/assets/images/djnickdee.jpg',
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
    {
      'artistname': 'DJ Kalonje',
      'location': 'Mombasa',
      'imagepath':'lib/assets/images/djkalonje.jpg',
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
    {
      'artistname': 'DJ G Money',
      'location': 'Westlands',
      'imagepath':'lib/assets/images/gmoney.jpg',
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
    {
      'artistname': 'DJ RudeBoy',
      'location': 'Kiambu',
      'imagepath':'lib/assets/images/djrudeboy.jpg',
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
    {
      'artistname': 'DJ Double M',
      'location': 'Muranga',
      'imagepath':'lib/assets/images/djdoublem.jpg',
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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GridView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2/2.6,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,

            ),
            padding: const EdgeInsets.all(8),

            itemCount: items.length,

            itemBuilder: (BuildContext content,int index){
              return InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DjSingles(item: items[index]),),);},
                child: Container(
                  margin: const EdgeInsets.only(right: 1),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage(items[index]['imagepath']!
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width*0.37,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  items[index]['artistname']!,
                                  style: GoogleFonts.bebasNeue(color: Colors.black),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      items[index]['location']!,
                                      style: GoogleFonts.bebasNeue(color: Colors.deepPurple),
                                    ),
                                    SizedBox(width: 10,),
                                    Text('\$'+
                                      items[index]['price']!,
                                      style: GoogleFonts.bebasNeue(color: Colors.black),
                                    ),


                                  ],
                                )
                              ],
                            ),
                            const Icon(
                              Icons.play_circle,
                              color: Colors.deepPurple,
                            ),
                          ],
                        ),
                      )

                    ],

                  ),
                ),
              );
            }),
    );
  }
}
