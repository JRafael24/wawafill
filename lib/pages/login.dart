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
      backgroundColor: Colors.white,
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
                    color: Colors.black,

                  ),
                ),
              ),
              SizedBox(height: 20.0),
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value!;
                      },
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      obscureText: true,
                      maxLength: 20,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                    SizedBox(height: 14.0),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          // Perform login logic here, e.g., send credentials to server
                          print('Email: $email');
                          print('Password: $password');
                        }
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          letterSpacing: 1.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white,
                      ),
                    ),
                   Row(
                     children: <Widget>[
                       Expanded(child: Divider(
                         color: Colors.black,
                         height: 50,
                       ),),
                       SizedBox(width: 5.0,),
                       Text("or", style: TextStyle(color: Colors.blue),),
                       SizedBox(width: 5.0,),
                       Expanded(child: Divider(
                         color: Colors.black,
                         height: 50,
                       ))
                     ],
                   ),
                    SizedBox(height: 10.0),
                    ElevatedButton.icon(
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
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.0),
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
                    SizedBox(height: 10.0),
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
                                color: Colors.blue,
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
