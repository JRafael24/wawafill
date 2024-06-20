import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.pink[200],
    appBar: AppBar(
      title: Text('Hello Kiffy',
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      backgroundColor: Colors.pink[300],
      centerTitle: true,
    ),
    body: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'NAME:',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              letterSpacing: 2.0,
            ),
          ),
          Text(
            'John Rafael B De Los Reyes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
          SizedBox(height: 30.0,),
          Text(
            'YEAR:',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              letterSpacing: 2.0,
            ),
          ),
          Text(
            '4th Year',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
          SizedBox(height: 30.0,),
          Text(
            'EMAIL:',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              letterSpacing: 2.0,
            ),
          ),
          Text(
            '21-11735@g.batstate-u.edu.ph',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 27.0,
            ),
          ),
        ],
      ),
    ),
  ),
));