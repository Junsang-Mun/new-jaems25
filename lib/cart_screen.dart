import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'checkout_screen.dart'; // Import the checkout screen file

class Product {
  final String barcode;
  final String name;
  final double price;

  Product(this.barcode, this.name, this.price);

  factory Product.fromJson(String body) {
    print(body);
    return Product('1234567890', '킹갓참깨라면', 1200);
  }
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> cartItems = [];
  double totalAmount = 0.0;

  Future<Product?> fetchProductDetails(String barcode) async {
    final response = await http.get(Uri.parse(
        'https://us-central1-jaemjeon-qr.cloudfunctions.net/product/$barcode'));
    if (response.statusCode == 200) {
      return Product.fromJson(response.body);
    } else {
      throw Exception('Failed to load product details');
    }
  }

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
