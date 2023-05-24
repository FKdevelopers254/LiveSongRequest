import 'package:flutter/material.dart';

import 'bible.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final _words = [
    "Machakos",
    "Kisumu",
    "Nairobi",
    "Mlolongo",
    "Mlol",
    "Ml",
    "grape",
    "honeydew",
  ];

  final TextEditingController _controller = TextEditingController();
  String _filter = "";
  List<Map<String, String>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _filter = _controller.text;
        _filteredItems = ritems;

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _filter = _controller.text.toLowerCase();
            _filteredItems = ritems.where((item) =>
                item['book_name']!.toLowerCase().startsWith(_filter))
                .toList();
          });
        },
        child: Icon(Icons.search),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: _controller,
                onSubmitted: (value) {
                  setState(() {
                    _filter = _controller.text.toLowerCase();
                    _filteredItems = ritems.where((item) =>
                        item['book_name']!.toLowerCase().startsWith(_filter))
                        .toList();
                  })  ;
                },

            ),
          ),
          Expanded(
            child: _filteredItems == null || _filteredItems.isEmpty
                ? Container(
              child: Center(
                child: Text("No entries"),
              ),
            )
                : ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(

                  title: Column(
                    children: [

                      Row(
                        children: [
                          Text(_filteredItems[index]['book_name']!),
                          Text('-'),
                          Text(_filteredItems[index]['chapter']!),
                          Text(':'),
                          Text(_filteredItems[index]['verse']!),
                        ],
                      ),

                    ],
                  ),
                  onTap: (){

                    _filter = _controller.text.toLowerCase();
                  _filteredItems = ritems.where((item) =>
                      item['book_name']!.toLowerCase().startsWith(_filter))
                      .toList();},


                  // other properties
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
