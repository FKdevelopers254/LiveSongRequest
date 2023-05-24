import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liverequest/main.dart';







class TrendingSingle extends StatefulWidget {
  const TrendingSingle({Key? key, required String item}) : super(key: key);

  @override
  State<TrendingSingle> createState() => _TrendingSingleState();
}

class _TrendingSingleState extends State<TrendingSingle> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                title: const Text('Dj Nash Tunic'),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      fit: BoxFit.cover,
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
                const <Widget>[
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Sunday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Monday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Tuesday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Wednesday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Thursday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Friday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Saturday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Sunday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Sunday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Sunday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Sunday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
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






