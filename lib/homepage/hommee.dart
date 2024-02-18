import 'package:codingmoon/homepage/payement.dart';
import 'package:codingmoon/homepage/wallet.dart';
import 'package:flutter/material.dart';

import '../profile/banksserch.dart';
import '../profile/verifyid.dart';
import 'addbutton.dart';
import 'boot1.dart';
import 'historiquepay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Home Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => GreyButtonsScreen())));
              },
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Add functionality for home page button
            },
          ),
          IconButton(
            icon: Icon(Icons.verified_user),
            onPressed: () {
              // Add functionality for verify ID button
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'My Cards',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 30),
                  Image.asset('images/card2.png'),
                  SizedBox(height: 10),
                  Image.asset(
                      'images/card2.png'), // Replace with your image path
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
               Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => CardDetailsForm())));
              
              // Add functionality for add cards button
            },
            child: Text('Add Card'),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => VerifyIDScreen())));
              },
            ),
            IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PaymentHistoryScreen())));
                // Add functionality for historique button
              },
            ),
            IconButton(
              icon: Icon(Icons.account_balance),
            onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PaymentScreen())));
                // Add functionality for historique button
              },
            ),
            IconButton(
              icon: Icon(Icons.history_toggle_off),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => BankSelectionScreen())));
                // Add functionality for historique button
              },
            ),
          ],
        ),
      ),
    );
  }
}
