import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'shopping_cart_page.dart';
import 'payment_method.dart';
import 'payment.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.shopping_cart), text: '장바구니',),
                Tab(icon: Icon(Icons.help_outline), text: '결제 방식 결정',),
                Tab(icon: Icon(Icons.credit_card), text: '결제',),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ShoppingCartPage(),
              PaymentMethodPage(),
              PaymentPage(),
            ],
          )
        )
      )
    );
  }
}

class ChangeTab extends StatelessWidget {
    const ChangeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      DefaultTabController.of(context).animateTo(1);
    },
    child: const Text('버튼이 작동하지 않더라도 어? 금지'),
    );
  }
}