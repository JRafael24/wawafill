import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      // appBar: AppBar(
      //   title: Text(
      //     'Dashboard',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //       letterSpacing: 2.0,
      //     ),
      //   ),
      //   backgroundColor: Colors.lightBlue[900],
      //   centerTitle: true,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3.0,
        onTap: (int val){
          switch(val){
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/login');
              break;
            case 2:
              Navigator.pushNamed(context, '/menu');
              break;
          }
        },
        currentIndex: 0,
        items: const[
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'login'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'menu'
          ),

        ],
      ),
    );
  }
}
