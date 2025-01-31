import 'package:flutter/material.dart';
import 'package:untitled/Home.dart';
import 'package:untitled/pages/dashboard.dart';
import 'package:untitled/pages/login.dart';
import 'package:untitled/pages/menu.dart';
import 'package:untitled/pages/signup.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/login',
 routes: {
   '/' : (context) => Dashboard(),
   '/menu' : (context) => Menu(),
   '/home' : (context) => Home(),
   '/signup' : (context) => Signup(),
   '/login' : (context) => Login(),
 },
));
