import 'package:flutter/material.dart';
import 'checkout_screen.dart'; // Import the checkout screen file

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> cartItems = [];
  double totalAmount = 0.0;

  void addToCart(String productBarcode) {
    // Logic to fetch product details from the database using barcode and update cart
    // For simplicity, let's assume the product details are hardcoded.
    cartItems.add('$productBarcode             1200원');
    totalAmount += 1200;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(cartItems[index]));
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addToCart('킹갓참깨라면');
            },
            child: const Text('킹갓참깨라면 추가하기'),
          ),
          Visibility(
            visible: true,
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '바코드 입력',
              ),
              onSubmitted: (value) {
                addToCart(value);
              },
            ),
          ),
          Text('총 금액 ${totalAmount.toInt()}원'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CheckoutScreen(totalAmount)),
              );
            },
            child: const Text('결제하기'),
          ),
        ],
      ),
    );
  }
}
