import 'package:flutter/material.dart';

class CurrencyConverterView extends StatefulWidget {
  const CurrencyConverterView({super.key});
  
  @override
  State<CurrencyConverterView> createState() => _CurrencyConverterViewState();
}

class _CurrencyConverterViewState extends State<CurrencyConverterView> {
  final _textController = TextEditingController();
  final _currencyExchange = 23000;
  var _amount = 0.0;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  static const outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlue,
      width: 2,
      style: BorderStyle.solid,
      strokeAlign: BorderSide.strokeAlignCenter,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );

  String formatAmount(String amount) {
    var temp = "";
    for (int i = amount.length; i > 0; i -= 3) {
      if (i > 3) {
        temp = ".${amount.substring(i - 3, i)}$temp";
      } else {
        temp = "${amount.substring(0, i)}$temp VND";
      }
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 125, 155, 175),
      ),
      backgroundColor: const Color.fromARGB(255, 125, 155, 175),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              formatAmount(_amount.toInt().toString()),
              style: const TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: TextField(
                controller: _textController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Please enter the amount in USD",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(Icons.monetization_on),
                  prefixIconColor: Colors.black,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  setState(() {
                    _amount =
                        double.parse(_textController.text) * _currencyExchange;
                  });
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: (Colors.white),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(
                    color: Colors.lightBlue,
                    width: 2,
                  ),
                ),
                fixedSize: const Size(200, 50),
                foregroundColor: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text(
                "Convert to VND",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
