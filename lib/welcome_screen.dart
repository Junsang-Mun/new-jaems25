import 'package:flutter/material.dart';
import 'cart_screen.dart'; // Import the cart screen file

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('잼스25 키오스크')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/images/jaemjeon.png')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              child: const Text('쑈오핑카트 들어가기'),
            ),
          ],
        ),
      ),
    );
  }
}
