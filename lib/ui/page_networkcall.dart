import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Photo {
  final String title;
  final String thumbnailUrl;
  Photo._({this.title, this.thumbnailUrl});
  factory Photo.fromJson(Map<String, dynamic> json) {
    return new Photo._(
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

class NetworkCalling extends StatefulWidget {
  @override
  _NetworkCallingState createState() => _NetworkCallingState();
}

class _NetworkCallingState extends State<NetworkCalling> {
  List<Photo> list = List();
  var isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
    await http.get("https://jsonplaceholder.typicode.com/photos");
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Photo.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fetch Data JSON"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: new Text("Fetch Data"),
            onPressed: _fetchData,
          ),
        ),
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: new Text(list[index].title),
                trailing: new Image.network(
                  list[index].thumbnailUrl,
                  fit: BoxFit.cover,
                  height: 40.0,
                  width: 40.0,
                ),
              );
            }));
  }
}