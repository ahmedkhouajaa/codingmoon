import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedAmount = '';
  String _customAmount = '';
  String _recipient = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose Amount:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _buildAmountButton('10 \DT'),
                SizedBox(width: 10),
                _buildAmountButton('20 \DT'),
                SizedBox(width: 10),
                _buildAmountButton('50 \DT'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _buildAmountButton('100 \DT'),
                SizedBox(width: 10),
                _buildAmountButton('200 \DT'),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Other Amount',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _customAmount = value;
                        _selectedAmount = '';
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Recipient',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _recipient = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle payment logic here
                print('Selected amount: $_selectedAmount');
                print('Custom amount: $_customAmount');
                print('Recipient: $_recipient');
              },
              child: Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountButton(String amount) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            _selectedAmount = amount;
            _customAmount = '';
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return _selectedAmount == amount ? Colors.blue : Colors.white;
            },
          ),
        ),
        child: Text(
          amount,
          style: TextStyle(
            color: _selectedAmount == amount ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentScreen(),
    );
  }
}
