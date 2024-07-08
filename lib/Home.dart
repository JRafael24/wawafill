import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int year = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(
          'User Profile',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/download.png'),
                    backgroundColor: Colors.pinkAccent,
                    radius: 70.0,
                  ),
                ),
                Divider(height: 55.0,
                color: Colors.black,
                  thickness: 3.0,
                ),
                Row(
                  children: [
                    Icon(Icons.person,
                    color: Colors.black,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'NAME:',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'John Rafael B. De Los Reyes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(height: 22.0,),
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined,
                    color: Colors.black,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'YEAR:',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  '$year Year',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(height: 22.0,),
                Row(
                  children: [
                    Icon(Icons.email_outlined,
                    color: Colors.black,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'EMAIL:',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  '21-11735@g.batstate-u.edu.ph',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 28.0,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        year +=1;
                      });
                    },
                    child: Text('Add Year',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.yellow),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
