import 'package:flutter/material.dart';

class ItemButton extends StatefulWidget {
  final double height;
  final double sideMargin;
  final double fontSize;
  final String text;
  final VoidCallback action;
  final Color textColor;
  final Color buttonColor;

  const ItemButton(
    {Key key,
      this.height,
      this.sideMargin,
      this.fontSize,
      this.text = "",
      this.action,
      this.textColor = Colors.white,
      this.buttonColor = Colors.blue}) : super(key: key);

  @override
  _ItemButton createState() => _ItemButton();
}

class _ItemButton extends State<ItemButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.action != null) {
          widget.action();
        }
      },
      child: Container(
        height: widget.height,
        margin: EdgeInsets.only(left: widget.sideMargin, right: widget.sideMargin),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: FontWeight.bold,
              color: widget.textColor,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

}