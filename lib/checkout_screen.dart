import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CheckoutScreen extends StatelessWidget {
  final double totalAmount;

  CheckoutScreen(this.totalAmount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('결제금액: ₩${totalAmount.toInt()}'),
              const SizedBox(height: 20),
              // TossQRCodeWidget(won: totalAmount.toInt()),
              KakaoPayQRCodeWidget(won: totalAmount.toInt()),
              const SizedBox(height: 20),
              const Text(':happy_jaemjeon:'),
            ],
          ),
        ),
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
