import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'checkout_screen.dart';

class Product {
  String? barcode;
  String? name;
  num? price;

  Product({this.barcode, this.name, this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      barcode: json['barcode'],
      name: json['name'],
      price: int.parse(json['price']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'barcode': barcode,
      'name': name,
      'price': price,
    };
  }
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product?> cartItems = [];
  num totalAmount = 0;
  final textFieldController = TextEditingController();
  final textFieldFocusNode = FocusNode();

  Future<Product?> fetchProductDetails(String barcode) async {
    final response = await http.get(
      Uri.parse("${dotenv.env['DETA_ROOT_URL']}/items/$barcode"),
      headers: {
        'X-API-Key': dotenv.env['DETA_KEY'] ?? '',
      },
    );
    if (response.statusCode == 200) {
      // var encodedString = jsonEncode(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);
      return Product.fromJson(data);
    } else {
      throw Exception('Failed to load product details');
    }
  }

  Future<void> addToCart(String productBarcode) async {
    try {
      Product? product = await fetchProductDetails(productBarcode);
      cartItems.add(product);
      totalAmount += product?.price ?? 0;
    } catch (e) {
      print(e);
    }
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
                return ListTile(
                  title: Text(cartItems[index]?.name ?? ''),
                  leading:
                      Text("${(cartItems[index]?.price ?? '')}원".toString()),
                );
              },
            ),
          ),
          Visibility(
            visible: true,
            maintainState: true,
            child: TextField(
              controller: textFieldController,
              focusNode: textFieldFocusNode,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '바코드 입력',
              ),
              onSubmitted: (value) {
                addToCart(value);
                textFieldController.clear();
                textFieldFocusNode.requestFocus();
              },
            ),
          ),
          Text(
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              '총 금액: ${totalAmount.toInt()}원'
            ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CheckoutScreen(totalAmount)),
              );
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(1000, 100)),
            ),
            child: const Text('결제하기'),
          ),
        ],
      ),
    );
  }
}
