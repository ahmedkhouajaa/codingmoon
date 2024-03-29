


import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codingmoon/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'amindashbord.dart';


class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  var adminemail, adminpassword;
  GlobalKey<FormState> adminhawk = new GlobalKey<FormState>();

  signinadmin() async {
      var z;
    String documentId = '';
    
    FirebaseFirestore.instance
        .collection('admin')
        .where('email', isEqualTo: adminemail)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        documentId = querySnapshot.docs.first.id;
        // Do something with the retrieved document ID
        print('## got doc ID = $documentId');
        z = querySnapshot.docs.first["email"];

        /// add your code here
      } else {
        print('## doc NOT found');

        // Document not found
      }
    });
  var formdata = adminhawk.currentState;
  if (formdata!.validate()) {
    formdata.save();
    print("mrigel");
    try {
      UserCredential admin = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: adminemail, password: adminpassword);
      
      var r = admin.user;
        if (r!.email == z) {
          return admin;
        } else
         AwesomeDialog(
              context: context, title: "error", body: Text('Verifier vos '))
            ..show();
          return print("galt");
    } on FirebaseAuthException catch (e) {
       
    if (e.code == 'user-not-found') {
      AwesomeDialog(
              context: context, title: "error", body: Text('No user found for that email.'))..show();
     
    print('No user found for that email.');
    return CircularProgressIndicator();
  } else if (e.code == 'wrong-password') {
     AwesomeDialog(
              context: context, title: "error", body: Text('Wrong password provided for that user.'))..show();
    print('Wrong password provided for that user.');
    
  }
    } 
  } 
}// else {

  //AwesomeDialog(
  //    context: context,
  //    title: 'error',
  //  body: Text("Wrong password provided for that user."))
  //  ..show;
  // }
  // }
  var fbm = FirebaseMessaging.instance;
  @override
  void initState() {
    fbm.getToken().then((value) => print(value));
    super.initState();
  }

  final number = TextEditingController();
  final password = TextEditingController();
  bool showpass = false;
  var username, passsword, email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue.withOpacity(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                  //  Center(
                   ///   child: Container(
                    //    child: Image.asset('images/gifs/splash_image.gif'),
                    //  ),
                 //   ),
                  ],
                ),
              ),
            ),
            Form(
              key: adminhawk,
              child: Expanded(
                flex: 5,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 15),
                        width: double.infinity,
                        child: Text(
                          'WELCOME\nBACK ! ',
                          style: TextStyle(
                            fontFamily: 'Bowlby',
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.aspectRatio * 70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                           validator: ((val) {
                            if (val!.length > 100) {
                              return "email can't be larged than 100 letter";
                            }
                            if (val.length < 7) {
                              return"email can't be less than 2 letter";
                            }
                            return null;
                          }),
                          onSaved: (val) {
                            adminemail = val;
                          },
                          
                          decoration: InputDecoration(
                            labelText: '  e-mail',
                            suffixIcon: Icon(Icons.people),
                            floatingLabelStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.black)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.green)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          onSaved: (val) {
                            adminpassword = val;
                          },
                           validator: ((val) {
                            if (val!.length > 100) {
                              return "email can't be larged than 100 letter";
                            }
                            if (val.length < 7) {
                              return"email can't be less than 2 letter";
                            }
                            return null;
                          }),
                          obscureText: showpass ? false : true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: password,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: showpass
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.remove_red_eye),
                            floatingLabelStyle: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.black)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.green)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Checkbox(
                              splashRadius: 30,
                              side: BorderSide(width: 2),
                              activeColor: Colors.green,
                              value: showpass,
                              onChanged: (newval) {
                                setState(() {
                                  showpass = newval!;
                                });
                              },
                            ),
                            Text(
                              'Show Password',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      showpass ? Colors.green : Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 6),
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => SignUp())));
                              },
                              child: Text(
                                '',
                                style: TextStyle(color: Colors.green,
                                    fontSize: 22,
                                    decoration: TextDecoration.underline),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  shadowColor: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 10),
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.075,
                            child: ElevatedButton(
                              onPressed: ()async {
                                var userss = await signinadmin();
                                if (userss != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              AdmiDashbord())));
                                }
                              },
                              child: Text(
                                'LOG IN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'DelaGothic'),
                              ),
                              style: ElevatedButton.styleFrom(
                                  enableFeedback: false,
                                  elevation: 10,
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ),
                            
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logg() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AdminLogin()));
  }

  void sign() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }
}