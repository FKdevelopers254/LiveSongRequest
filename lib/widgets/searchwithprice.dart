import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liverequest/widgets/singledj.dart';


class aMySearchPage extends StatefulWidget {
  const aMySearchPage({super.key});

  @override
  _aMySearchPageState createState() => _aMySearchPageState();
}

class _aMySearchPageState extends State<aMySearchPage> {
  final _searchController = TextEditingController();
  String _searchText = "";
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
  //final List<Map<String, String>> items = [    {      'artistname': 'DJ NASH TUNIC',      'location': 'Nairobi',      'imagepath':'lib/assets/images/1.jpg',      'price' :'50',      'genre':'AllRound',      'availability':'Yes',      'mixcloud':'nashtunic',      'youtube':'Nash Tunic',      'paypal':'djnash',      'facebook':'nashtunic',      'instagram':'nash.tunic',      'Bio':'Dj From Kenya Love Music'    },    {      'artistname': 'DJ LUCKY DUB',      'location': 'Nairobi',      'imagepath':'lib/assets/images/2.jpg',      'price' :'40',      'genre':'Reggea',      'availability':'Yes',      'mixcloud':'nashtunic',      'youtube':'Nash Tunic',      'paypal':'djnash',      'facebook':'nashtunic',      'instagram':'nash.tunic',      'Bio':'Dj From Kenya Love Music'    },  ];
  List<Map<String, String>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = items;
  }

  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade900.withOpacity(0.5),
          title: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: "Search with Price",
              hintStyle: TextStyle(color: Colors.black,),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {
                _searchText = value;
                _filteredItems = items
                    .where((item) => item['price']!.toLowerCase().contains(_searchText))
                    .toList();
              });
            },
          ),
          actions: const [],
        ),


        body: GridView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2/2.6,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,

            ),
            padding: const EdgeInsets.all(8),

            itemCount: _filteredItems.length,

            itemBuilder: (BuildContext content,int index){
              return InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DjSingles(item: _filteredItems[index]),),);},
                child: Container(
                  margin: const EdgeInsets.only(right: 0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(_filteredItems[index]['imagepath']!
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 37,
                        width: MediaQuery.of(context).size.width*0.37,
                        margin: const EdgeInsets.only(bottom: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.6),
                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _filteredItems[index]['artistname']!,
                                  style: GoogleFonts.bebasNeue(color: Colors.black),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _filteredItems[index]['location']!,
                                      style: GoogleFonts.bebasNeue(color: Colors.deepPurple),
                                    ),
                                    const SizedBox(width: 10,),
                                    Text('\$${_filteredItems[index]['price']!}',
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





      ),
    );
  }
}
