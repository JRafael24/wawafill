import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/services/user.dart';
import 'package:http/http.dart' as http;
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;

  Widget buttonContent = Text('Log in');

  Widget loadingDisplay = CircularProgressIndicator();

  Future<bool> login(User user)async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/auth/login'),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8'
    },
      body: jsonEncode(<String, dynamic>{
        'usernameOrEmail' : user.email,
        'password' : user.password
      }),
    );
    if(response.statusCode == 200){
      return true;
    }
    return false;
    // print(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[600],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  fontSize: 26.0,
                  color: Colors.black,
                  height: 1.2, // Adjust the height as needed
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/appbar.png',
                width: 500, // Adjust width as needed
                height: 100, // Adjust height as needed
                fit: BoxFit.contain, // Adjust the fit as needed
              ),
            ],
          ),
        ),
              Divider(height: 30.0,
                color: Colors.black,
                thickness: 3.0,
              ),

          SizedBox(height: 30.0),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 60,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.white,),

                        filled: true,
                        fillColor: Colors.black,
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        // final emailRegExp = RegExp(
                        //     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                        // if (!emailRegExp.hasMatch(value)) {
                        //   return 'Please enter a valid email address';
                        // }
                        return null;
                      },
                      onSaved: (value) {
                        email = value!;
                      },
                    ),

                    SizedBox(height: 10.0),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      enableInteractiveSelection: false,
                      obscureText: _obscure,
                      maxLength: 20,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                        prefixIcon: Icon(Icons.lock, color: Colors.white,),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureIcon, color: Colors.white,),
                          onPressed: (){
                            setState(() {
                              _obscure = !_obscure;
                              if(_obscure){
                                _obscureIcon = Icons.visibility_off;
                              }else{
                                _obscureIcon = Icons.visibility;
                              }
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.black,

                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be 8 or more characters';
                        }
                        if (value.length > 20) {
                          return 'Password must be 20 characters long only';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value!;
                      },
                    ),
                    SizedBox(height: 5.0),
                    ElevatedButton(
                      onPressed: () {

                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          User user = User(
                            username: '',
                            email: email,
                            password: password
                          );
                          // if(login(user)){
                          //   Navigator.pushReplacementNamed(context, '/');
                          // }
                          setState(() {
                            buttonContent = FutureBuilder(
                                future: login(user),
                                builder: (context, snapshots){
                                  if(snapshots.connectionState == ConnectionState.waiting){
                                    return loadingDisplay;
                                  }
                                  if(snapshots.hasData){

                                  }
                                  return Text('Log in');
                                }
                            );
                          });
                          Navigator.pushReplacementNamed(context, '/');
                        }
                      },
                      child: buttonContent,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.black,
                      ),
                    ),
                   Row(
                     children: <Widget>[
                       Expanded(child: Divider(
                         color: Colors.black,
                         height: 50,
                       ),),
                       SizedBox(width: 5.0,),
                       Text("or", style: TextStyle(color: Colors.amber),),
                       SizedBox(width: 5.0,),
                       Expanded(child: Divider(
                         color: Colors.black,
                         height: 50,
                       ))
                     ],
                   ),

                    SizedBox(height: 5.0),
                    Container(
                      width: double.infinity, // Match the width of the parent
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.red, Colors.yellow, Colors.green, Colors.blue], // Gradient colors
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Placeholder for Google Sign-In
                          print('Sign in with Google button pressed');
                        },
                        icon: Icon(Icons.login), // Icon for Google Sign-In
                        label: Text(
                          'Sign in with Google',
                          style: TextStyle(
                            letterSpacing: 1.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, // Make button background transparent
                          foregroundColor: Colors.white, // Text color
                        ),
                      ),
                    ),

                    SizedBox(height: 5.0),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Placeholder for Facebook Sign-In
                        print('Sign in with Facebook button pressed');
                      },
                      icon: Icon(Icons.facebook), // Icon for Facebook Sign-In
                      label: Text(
                        'Sign in with Facebook',
                        style: TextStyle(
                          letterSpacing: 1.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Placeholder for Apple Sign-In
                        print('Sign in with Apple ID button pressed');
                      },
                      icon: Icon(Icons.apple), // Icon for Apple Sign-In
                      label: Text(
                        'Sign in with Apple ID',
                        style: TextStyle(
                          letterSpacing: 1.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Placeholder for Steam Sign-In
                        print('Sign in with Steam button pressed');
                      },
                      icon: Icon(Icons.gamepad),
                      label: Text(
                        'Sign in with Steam',
                        style: TextStyle(
                          letterSpacing: 1.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                    ),


                    SizedBox(height: 50.0,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Dont have an account?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          InkWell(
                            child: Text(
                              'Signup Here',
                              style: TextStyle(
                                color: Colors.yellow,
                                decoration: TextDecoration.underline,
                                fontSize: 15.0,
                              ),
                            ),
                            onTap: ()=> Navigator.popAndPushNamed(context, '/signup'),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
