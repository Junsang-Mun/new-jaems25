import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
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
        title: const Text('JAMES25'),
        backgroundColor: const Color.fromARGB(30, 250, 0, 250),
      ),
      body: const Column(children: [
        KakaoPayQRCodeWidget(won: 255),
      ]),
    );
  }
}

String calcKakaoPay(int won) {
  return (won << 19).toRadixString(16);
}

class KakaoPayQRCodeWidget extends StatelessWidget {
  final int won;
  const KakaoPayQRCodeWidget({Key? key, required this.won}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: "kakaotalk://kakaopay/money/to/qr?qr_code=${dotenv.env['KAKAOPAY_UID']}${calcKakaoPay(won)}",
      version: QrVersions.auto,
      size: 200,
    );
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