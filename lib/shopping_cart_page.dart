import 'package:flutter/material.dart';

import 'main.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        Text('쑈오핑카트'),
        ChangeTab(),
      ],),
    );
  }
}