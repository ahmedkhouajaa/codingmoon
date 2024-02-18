import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Payment {
  final DateTime date;
  final String bank;
  final String sender;
  final String receiver;
  final double amount;

  Payment({
    required this.date,
    required this.bank,
    required this.sender,
    required this.receiver,
    required this.amount,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment History',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentHistoryScreen(),
    );
  }
}

class PaymentHistoryScreen extends StatelessWidget {
  final List<Payment> payments = [
    Payment(
      date: DateTime(2024, 2, 17),
      bank: 'Bank A',
      sender: 'ahmed mohsen',
      receiver: 'zied dhoukar',
      amount: 100.0,
    ),
    Payment(
      date: DateTime(2024, 2, 16),
      bank: 'Bank B',
      sender: 'ahmed mohsen',
      receiver: 'jiji',
      amount: 150.0,
    ),
      Payment(
      date: DateTime(2024, 2, 16),
      bank: 'Bank B',
      sender: 'ahmed mohsen',
      receiver: 'salh gouja',
      amount: 80.0,
    ),
      Payment(
      date: DateTime(2024, 2, 16),
      bank: 'Bank B',
      sender: 'ahmed mohsen',
      receiver: 'Bob Johnson',
      amount: 300.0,
    ),
      Payment(
      date: DateTime(2024, 2, 16),
      bank: 'tijeri bank',
      sender: 'ahmed mohsen',
      receiver: 'ayoub salh',
      amount: 400.0,
    ),
    // Add more payment examples as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment History'),
      ),
      body: DataTable(
        columnSpacing: 8, // Adjust column spacing
        dataRowHeight: 48, // Adjust row height
        columns: [
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Bank')),
          DataColumn(label: Text('Sender')),
          DataColumn(label: Text('Receiver')),
          DataColumn(label: Text('Amount')),
        ],
        rows: payments.map((payment) {
          return DataRow(
            
            cells: [
              DataCell(
                Text(
                  '${payment.date.toString().split(' ')[0]}',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              DataCell(
                Text(
                  payment.bank,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              DataCell(
                Text(
                  payment.sender,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              DataCell(
                Text(
                  payment.receiver,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              DataCell(
                Text(
                  '${payment.amount.toStringAsFixed(2)} \DT',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

