import 'package:flutter/material.dart';

import 'main.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        Text('결제 방식 선택'),
        ChangeTab(page: 0),
      ],),
    );
  }
}