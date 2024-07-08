import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                    fontSize: 26.0,
                    color: Colors.yellow,
                    height: 4.0,

                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 60,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        final emailRegExp = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                        if (!emailRegExp.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value!;
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: true,
                      maxLength: 20,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        prefixIcon: Icon(Icons.lock),
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
                          // Perform login logic here, e.g., send credentials to server
                          print('Email: $email');
                          print('Password: $password');
                          Navigator.pushReplacementNamed(context, '/');
                        }
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          letterSpacing: 1.0,
                        ),
                      ),
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
                         // Optional: add border radius
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
                      icon: Icon(Icons.gamepad), // Icon for Steam (using a gamepad icon as a placeholder)
                      label: Text(
                        'Sign in with Steam',
                        style: TextStyle(
                          letterSpacing: 1.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Background color of the button
                        foregroundColor: Colors.white, // Text color of the button
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
