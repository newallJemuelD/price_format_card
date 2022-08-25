import 'package:flutter/material.dart';
import 'package:price_format_card/indian_currency_formatter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PriceCard(),
    );
  }
}

class PriceCard extends StatefulWidget {
  const PriceCard({Key? key}) : super(key: key);

  @override
  State<PriceCard> createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    // final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Card(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Amount to withdraw',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  // controller: ,
                  inputFormatters: [
                    IndianCurrencyFormatter(),
                    // FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
