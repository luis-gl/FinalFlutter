import 'package:awesome_card/awesome_card.dart';

class CreditCardClass {
  String cardNumber;
  String cvv;
  String cardHolderName;
  String cardExpiry;
  String bankName;
  CardType cardType;
  CreditCardClass({this.cardNumber, this.cvv, this.cardHolderName, this.cardExpiry, this.bankName, this.cardType});
}