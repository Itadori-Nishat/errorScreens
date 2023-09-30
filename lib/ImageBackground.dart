import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {
  const ImageBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Background Example'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/bg.png'), // Replace with your image asset
            fit: BoxFit.cover, // You can adjust the fit as needed
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello, Flutter!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Your button action here
                },
                child: Text('Click Me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

