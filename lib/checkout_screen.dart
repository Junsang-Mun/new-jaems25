import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'welcome_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final num totalAmount;

  CheckoutScreen(this.totalAmount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      '후원금액: ₩${totalAmount.toInt()}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    KakaoPayQRCodeWidget(won: totalAmount.toInt()),
                    const SizedBox(height: 20),
                    const Text(':happy_jaemjeon:'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(),
                  ),
                );
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(1000, 100)),
              ),
              child: const Text('후원 완료'),
            ),
          ),
        ],
      ),
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
      data:
          "kakaotalk://kakaopay/money/to/qr?qr_code=${dotenv.env['KAKAOPAY_UID']}${calcKakaoPay(won)}",
      version: QrVersions.auto,
      size: 200,
    );
  }
}

class TossQRCodeWidget extends StatelessWidget {
  final int won;
  const TossQRCodeWidget({Key? key, required this.won}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data:
          "supertoss://send?amount=$won&bank=${dotenv.env['TOSS_BANK']}&accountNo=${dotenv.env['TOSS_ACCNO']}&origin=qr",
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
