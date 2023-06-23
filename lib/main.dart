import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JAMES25",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,)
      ),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget'),
        backgroundColor: const Color.fromARGB(30, 250, 0, 250),
      ),
      body: Column(children: [
        const QRCodeWidget(data: "https://naver.com"),
        const KakaoPayWidget(won: 255),
      ]),
    );
  }
}

int calcKakaoPay(int won) {
  return won << 19;
}

class KakaoPayWidget extends StatelessWidget {
  final int won;
  const KakaoPayWidget({Key? key, required this.won}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('KakaoPay: ${calcKakaoPay(won)}');
  }
}

class QRCodeWidget extends StatelessWidget {
  final String data;
  const QRCodeWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: data,
      version: QrVersions.auto,
      size: 200,
    );
  }
}