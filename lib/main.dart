import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: AppBar(
        title: Center(
          child: Text('iWater App'),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfGtVygU7ada-OVDswIKTVxppKinp0N_tpTQ&s'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        ),
      ),
    ),);
}
