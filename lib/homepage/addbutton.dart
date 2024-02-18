import 'package:flutter/material.dart';



class CardDetailsForm extends StatefulWidget {
  @override
  _CardDetailsFormState createState() => _CardDetailsFormState();
}

class _CardDetailsFormState extends State<CardDetailsForm> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Details Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Card Details:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _cardNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _expiryDateController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Expiry Date (MM/YY)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _cvvController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'CVV',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit the form or perform any action here
                print('Card Number: ${_cardNumberController.text}');
                print('Expiry Date: ${_expiryDateController.text}');
                print('CVV: ${_cvvController.text}');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}
