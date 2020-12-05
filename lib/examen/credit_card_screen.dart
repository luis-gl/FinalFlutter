import 'package:awesome_card/awesome_card.dart';
import 'package:examen/common/item_button.dart';
import 'package:examen/common/item_card.dart';
import 'package:examen/common/normal_screen.dart';
import 'package:examen/examen/new_card_screen.dart';
import 'package:examen/global/custom_color.dart';
import 'package:examen/items/credit_card_class.dart';
import 'package:flutter/material.dart';

class CreditCardScreen extends StatefulWidget {
  @override
  _CreditCardScreenState createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  double leftMargin = 30;
  double fontSize = 20;
  double itemBorderRadius = 20;
  double itemHeight = 60;
  List<CreditCardClass> cards;

  @override
  void initState() {
    cards = new List<CreditCardClass>();
    cards.add(new CreditCardClass(
        cardNumber: "5555 6666 7777 8888",
        cvv: "159",
        cardHolderName: "CHUPETIN",
        cardExpiry: "12/99",
        bankName: "Bika",
        cardType: CardType.masterCard));
    cards.add(new CreditCardClass(
        cardNumber: "5555 6666 7777 8888",
        cvv: "159",
        cardHolderName: "CHUPETIN",
        cardExpiry: "12/99",
        bankName: "Bika",
        cardType: CardType.visa));
    cards.add(new CreditCardClass(
        cardNumber: "5555 6666 7777 8888",
        cvv: "159",
        cardHolderName: "CHUPETIN",
        cardExpiry: "12/99",
        bankName: "Bika",
        cardType: CardType.jcb));
    cards.add(new CreditCardClass(
        cardNumber: "5555 6666 7777 8888",
        cvv: "159",
        cardHolderName: "CHUPETIN",
        cardExpiry: "12/99",
        bankName: "Bika",
        cardType: CardType.americanExpress));
    cards.add(new CreditCardClass(
        cardNumber: "5555 6666 7777 8888",
        cvv: "159",
        cardHolderName: "CHUPETIN",
        cardExpiry: "12/99",
        bankName: "Bika",
        cardType: CardType.visa));
    cards.add(new CreditCardClass(
        cardNumber: "5555 6666 7777 8888",
        cvv: "159",
        cardHolderName: "CHUPETIN",
        cardExpiry: "12/99",
        bankName: "Bika",
        cardType: CardType.jcb));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NormalScreen(
      imagePath: "assets/images/image 9.png",
      title1: "Credit",
      title2: "Card",
      child: Column(
        children: [
          SizedBox(height: 30),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Select a credit card",
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.only(left: leftMargin),
          ),
          SizedBox(height: fontSize),
          Container(
            height: MediaQuery.of(context).size.width * 0.75,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cards.length,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return ItemCard(
                    card: cards[i],
                    height: itemHeight,
                    sideMargin: leftMargin,
                    fontSize: fontSize,
                    itemBorderRadius: itemBorderRadius,
                  );
                }),
          ),
          SizedBox(height: fontSize),
          ItemButton(
            height: itemHeight,
            sideMargin: leftMargin,
            fontSize: fontSize,
            text: "ADD CARD",
            action: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewCardScreen()
                  )
              );
            },
            textColor: Colors.white,
            buttonColor: CustomColor.mainColor,
          ),
        ],
      ),
    );
  }
}
