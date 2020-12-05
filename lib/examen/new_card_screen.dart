import 'package:awesome_card/awesome_card.dart';
import 'package:examen/global/custom_color.dart';
import 'package:flutter/material.dart';

class NewCardScreen extends StatefulWidget {
  @override
  _NewCardScreenState createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  double leftMargin = 30;
  double fontSize = 20;

  String cardHolderText = "";
  String cardExpiryText = "";
  String cardNumberText = "";
  String cvvText = "";
  String bankText = "";
  bool showBackSide = false;

  TextEditingController cardHolderTextController = TextEditingController();
  TextEditingController cardExpiryTextController = TextEditingController();
  TextEditingController cardNumberTextController = TextEditingController();
  TextEditingController cvvTextController = TextEditingController();
  TextEditingController bankTextController = TextEditingController();
  FocusNode focusNodeCardHolderText = FocusNode();
  FocusNode focusNodeCardExpiryText = FocusNode();
  FocusNode focusNodeCardNumberText = FocusNode();
  FocusNode focusNodeCVV = FocusNode();
  FocusNode focusNodeBankText = FocusNode();

  @override
  void initState() {
    focusNodeCVV.addListener(() {
      if(focusNodeCVV.hasFocus){
        showBackSide = true;
      } else{
        showBackSide = false;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(height: fontSize,),
                CreditCard(
                    cardHolderName: cardHolderText,
                    cardExpiry: cardExpiryText,
                    cardNumber: cardNumberText,
                    cvv: cvvText,
                    showBackSide: showBackSide,
                    bankName: bankText,
                    frontBackground: Container(color: CustomColor.mainColor),
                    backBackground: CardBackgrounds.white),
                SizedBox(height: fontSize,),
                TextField(
                    focusNode: focusNodeCardHolderText,
                    onChanged: (text){
                      setState(() {
                        cardHolderText = text;
                        showBackSide = false;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                        fontSize: fontSize, color: Colors.black),
                    keyboardType: TextInputType.name,
                    maxLength: 30,
                    decoration: InputDecoration(
                        counterText: "",
                        labelText: 'Card Holder Name'
                    )
                ),
                SizedBox(height: fontSize,),
                TextField(
                    focusNode: focusNodeCardExpiryText,
                    onChanged: (text){
                      setState(() {
                        cardExpiryText = text;
                        showBackSide = false;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                        fontSize: fontSize, color: Colors.black),
                    keyboardType: TextInputType.text,
                    maxLength: 5,
                    decoration: InputDecoration(
                        counterText: "",
                        labelText: 'Card Expiry'
                    )
                ),
                SizedBox(height: fontSize,),
                TextField(
                    focusNode: focusNodeCardNumberText,
                    onChanged: (text){
                      setState(() {
                        cardNumberText = text;
                        showBackSide = false;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                        fontSize: fontSize, color: Colors.black),
                    keyboardType: TextInputType.number,
                    maxLength: 16,
                    decoration: InputDecoration(
                        counterText: "",
                        labelText: 'Card Number'
                    )
                ),
                SizedBox(height: fontSize,),
                TextField(
                    focusNode: focusNodeCVV,
                    onChanged: (text){
                      setState(() {
                        cvvText = text;
                        showBackSide = true;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                        fontSize: fontSize, color: Colors.black),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    decoration: InputDecoration(
                      counterText: "",
                      labelText: 'Cvv',
                    )
                ),
                SizedBox(height: fontSize,),
                TextField(
                    focusNode: focusNodeBankText,
                    onChanged: (text){
                      setState(() {
                        bankText = text;
                        showBackSide = false;
                      });
                    },
                    style: TextStyle(
                        fontSize: fontSize, color: Colors.black),
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    decoration: InputDecoration(
                        counterText: "",
                        labelText: 'Bank Name'
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}