import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Selection Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BankSelectionScreen(),
    );
  }
}

class BankSelectionScreen extends StatefulWidget {
  @override
  _BankSelectionScreenState createState() => _BankSelectionScreenState();
}

class _BankSelectionScreenState extends State<BankSelectionScreen> {
  bool faceIdChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Bank'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Search',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter bank name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    BankCard(
                      image: 'images/b1.png',
                      name: 'Bank 1',
                      onPressed: () => _showAwesomeDialog(context),
                    ),
                    BankCard(
                      image: 'images/b2.gif',
                      name: 'Bank 2',
                      onPressed: () => _showAwesomeDialog(context),
                    ),
                    BankCard(
                      image: 'images/b3.jpg',
                      name: 'Bank 3',
                      onPressed: () => _showAwesomeDialog(context),
                    ),
                    BankCard(
                      image: 'images/b4.jpg',
                      name: 'Bank 4',
                      onPressed: () => _showAwesomeDialog(context),
                    ),
                    // Add more bank cards as needed
                  ],
                ),
              ],
            ),
          ),
          if (faceIdChecked)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.6),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.face, color: Colors.green),
                        SizedBox(width: 10),
                        Text(
                          'Face ID check successful!',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showAwesomeDialog(BuildContext context) {
   
  }
}

class BankCard extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onPressed;

  const BankCard({
    required this.image,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 80,
              width: 80,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
