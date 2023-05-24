import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(

      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('lib/assets/images/1.jpg'),
                  ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username', style: TextStyle(fontSize: 20.0)),
                  Text('Bio'),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text('Followers'),
                        Container(
                          margin: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Icon(Icons.person),
                        ),
                        Text('Following'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

                ],
              ),

              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10.0),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('lib/assets/images/1.jpg'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
