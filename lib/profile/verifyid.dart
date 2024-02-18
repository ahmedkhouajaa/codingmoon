import 'package:flutter/material.dart';

import 'idid.dart';

class VerifyIDScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify ID'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Birthday'),
              keyboardType: TextInputType.datetime,
              // You might want to use a date picker here
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Country'),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: DropdownButton<String>(
                    value: '+1', // default country code
                    onChanged: (value) {},
                    items: <String>[
                      '+216',
                      '+1',
                      '+91',
                      '+44',
                      '+86'
                    ] // example country codes
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => VerifyIDScreenss())));
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
