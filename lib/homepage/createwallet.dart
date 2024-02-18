import 'dart:math';

import 'package:codingmoon/homepage/hommee.dart';
import 'package:flutter/material.dart';



class PasswordForm extends StatefulWidget {
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
    List<String> _words = [
    'food',
    'sky',
    'car',
    'tree',
    'house',
    'sun',
    'moon',
    'flower',
    'river',
    'mountain',
    'ocean',
    'book',
    'pen',
    'computer',
    'music',
    'friend',
    'love',
    'art',
    'smile',
    'rain',
    'snow',
    'star',
    'bird',
    'dog',
    'cat',
    'fish'
  ];
  void _generateRandomPassword() {
    final _random = Random();
    String password =
        List.generate(12, (index) => _words[_random.nextInt(_words.length)])
            .join(' ');
    setState(() {
      _passwordController.text = password;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Form'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      
                      obscureText: true, // Hide the entered text
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: Icon(Icons.remove_red_eye),
                        floatingLabelStyle: TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0, color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0, color: Colors.blue),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Add some spacing between the text fields
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true, // Hide the entered text
                      decoration: InputDecoration(
                        labelText: 'Re-enter Password',
                        suffixIcon: Icon(Icons.remove_red_eye),
                        floatingLabelStyle: TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0, color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0, color: Colors.blue),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                     TextFormField(
                      controller: _passwordController,
                      // Hide the entered text
                      decoration: InputDecoration(
                        labelText: 'Secret code',
                       
                        floatingLabelStyle: TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0, color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0, color: Colors.blue),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
               Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.075,
                  child: ElevatedButton(
                    onPressed: _generateRandomPassword,
                    child: Text('Generate Secret key'),
                    style: ElevatedButton.styleFrom(
                        enableFeedback: false,
                        elevation: 20,
                        
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                 SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => HomeScreen())));
                  print('Password: ${_passwordController.text}');
                  print('Confirm Password: ${_confirmPasswordController.text}');
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}

