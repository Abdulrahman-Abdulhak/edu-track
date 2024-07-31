import 'package:flutter/material.dart';


class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Payment for course', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            PaymentDetailRow('Python Programming for beginners. Basic rules in 5 hours', '\$10'),
            PaymentDetailRow('Additional Fees', '\$5'),
            Divider(),
            PaymentDetailRow('Total', '\$15', isTotal: true),
            SizedBox(height: 32),
            PaymentButton(
              color: Colors.red,
              text: 'Pay With Syriatel',
              textColor: Colors.white,
              logoAsset: 'assets/syriatel_logo.png', // احلا تيم ليدر يلي عم يشيك تصميم حيدر
            ),
            SizedBox(height: 16),
            PaymentButton(
              color: Colors.yellow,
              text: 'Pay With MTN',
              textColor: Colors.black,
              logoAsset: 'assets/mtn_logo.png',
            ),
            SizedBox(height: 32),
            Center(
              child: Text('Or Pay with Banks', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentDetailRow extends StatelessWidget {
  final String description;
  final String amount;
  final bool isTotal;

  PaymentDetailRow(this.description, this.amount, {this.isTotal = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              description,
              style: TextStyle(fontSize: isTotal ? 16 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
            ),
          ),
          Text(
            amount,
            style: TextStyle(fontSize: isTotal ? 16 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final String logoAsset;

  PaymentButton({required this.color, required this.text, required this.textColor, required this.logoAsset});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            logoAsset,
            height: 24,
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
