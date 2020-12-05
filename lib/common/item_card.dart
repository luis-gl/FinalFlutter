import 'package:awesome_card/awesome_card.dart';
import 'package:examen/items/credit_card_class.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final CreditCardClass card;
  final double height;
  final double sideMargin;
  final double fontSize;
  final double itemBorderRadius;

  const ItemCard(
      {Key key,
      this.card,
      this.height,
      this.sideMargin,
      this.fontSize,
      this.itemBorderRadius})
      : super(key: key);

  @override
  _ItemCard createState() => _ItemCard();
}

class _ItemCard extends State<ItemCard> {
  Image getBankImagePath(CardType type) {
    int typeNumber;
    switch (type) {
      case CardType.visa:
        {
          typeNumber = 1;
        }
        break;
      case CardType.jcb:
        {
          typeNumber = 2;
        }
        break;
      case CardType.americanExpress:
        {
          typeNumber = 3;
        }
        break;
      default:
        {
          typeNumber = 0;
        }
    }
    return Image(image: AssetImage("assets/images/image 1$typeNumber.png"));
  }

  String getCardTypeName(CardType type) {
    String typeName;
    switch (type) {
      case CardType.visa:
        {
          typeName = "VISA";
        }
        break;
      case CardType.jcb:
        {
          typeName = "JCB";
        }
        break;
      case CardType.americanExpress:
        {
          typeName = "American Express";
        }
        break;
      default:
        {
          typeName = "MasterCard";
        }
    }
    return typeName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin:
          EdgeInsets.only(left: widget.sideMargin, right: widget.sideMargin, bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: widget.sideMargin,
              ),
              getBankImagePath(widget.card.cardType),
              SizedBox(
                width: widget.sideMargin,
              ),
              Text(
                getCardTypeName(widget.card.cardType),
                style: TextStyle(
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: widget.sideMargin),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            )
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.itemBorderRadius),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(1, 2))
          ]),
    );
  }
}
