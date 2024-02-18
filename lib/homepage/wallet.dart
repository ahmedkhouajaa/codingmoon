import 'package:flutter/material.dart';

import 'createwallet.dart';



class GreyButtonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grey Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(
              text: 'Import Wallet',
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PasswordForm())));
                
                print('Import Wallet');
              },
            ),
            SizedBox(height: 20),
            buildButton(
              text: 'Create Wallet',
              onPressed: () {
                // Add your create wallet logic here
                print('Create Wallet');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton({required String text, required VoidCallback onPressed}) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey, // Set the background color to grey
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
