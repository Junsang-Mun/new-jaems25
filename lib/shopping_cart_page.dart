import 'package:flutter/material.dart';

class Product {
  final String name;
  final int price;

  Product(this.name, this.price);
}

class Cart with ChangeNotifier {
  List<Product> products = [];

  List<Product> get items => [];

  int get total {
    return products.fold(0, (total, current) => total + current.price);
  }

  void addToCart (Product product) => products.add(product);

  void removeFromCard (Product product) => {
    products.remove(product);
    notifyListeners();
  }
}


// class ListData {
//   final String product;
//   final int price;
//   final int count;

//   ListData(this.product, this.price, this.count);
// }

// class ShoppingCartPage extends StatefulWidget {
//   const ShoppingCartPage({super.key});

//   @override
//   _ShoppingCartPageState createState() => _ShoppingCartPageState();
// }

// class _ShoppingCartPageState extends State<ShoppingCartPage> {
//     final List<ListData> datas = [
//     ListData('Swift', 800, 1),
//     ListData('Kotlin', 50000, 2),
//     ListData('Objective-c', 4000, 1),
//     ListData('Flutter', 3000, 2),
//     ListData('JAVA', 2000, 2),
//     ListData('Python', 1000, 1),
//     ListData('PHP', 1000, 2),
//   ];

// }