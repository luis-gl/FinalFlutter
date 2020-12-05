import 'dart:typed_data';

import 'package:examen/common/item_button.dart';
import 'package:examen/examen/credit_card_screen.dart';
import 'package:examen/global/custom_color.dart';
import 'package:examen/common/normal_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double leftMargin = 30;
  double fontSize = 20;
  double itemBorderRadius = 20;
  double buttonBorderRadius = 100;
  double itemHeight = 60;

  Uint8List bytes = Uint8List(0);
  String balance = "Rp.76.547.000.-";

  Future _generateBarCode(String inputCode) async {
    Uint8List result = await scanner.generateBarCode(inputCode);
    setState(() {
      bytes = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _generateBarCode(balance);
  }

  @override
  Widget build(BuildContext context) {
    return NormalScreen(
      imagePath: "assets/images/image 1.png",
      title1: "Digital",
      title2: "Wallet",
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Balance",
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.only(left: leftMargin),
            ),
            SizedBox(height: fontSize),
            Container(
              height: itemHeight,
              margin: EdgeInsets.only(left: leftMargin, right: leftMargin),
              child: Center(
                child: Text(
                  balance,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(itemBorderRadius),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(1, 2))
                  ]),
            ),
            SizedBox(height: fontSize),
            ItemButton(
              height: itemHeight,
              sideMargin: leftMargin,
              fontSize: fontSize,
              text: "TOP UP",
              action: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreditCardScreen()));
              },
              textColor: Colors.white,
              buttonColor: CustomColor.mainColor,
            ),
            SizedBox(height: fontSize),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "QR Code",
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.only(left: leftMargin),
            ),
            SizedBox(height: fontSize),
            bytes.isEmpty
                ? Image(
                    image: AssetImage("assets/images/image 14.png"),
                    width: 300,
                    height: 300,
                  )
                : Image.memory(
                    bytes,
                    width: 300,
                    height: 300,
                  ),
          ],
        ),
      ),
    );
  }
}
