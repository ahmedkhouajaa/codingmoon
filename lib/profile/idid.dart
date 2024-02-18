import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class VerifyIDScreenss extends StatelessWidget {
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
            Text(
              'Select ID Type:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                openCamera(context);
              },
              child: Text('Verify with Driver\'s License'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                openCamera(context);
              },
              child: Text('Verify with ID Card'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                openCamera(context);
              },
              child: Text('Verify with Passport'),
            ),
          ],
        ),
      ),
    );
  }

  void openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // Navigate to next screen or process the captured image
    }
  }
}
