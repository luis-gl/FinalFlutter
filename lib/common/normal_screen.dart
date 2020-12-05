import 'package:examen/global/custom_color.dart';
import 'package:flutter/material.dart';

class NormalScreen  extends StatefulWidget {
  final String imagePath;
  final String title1;
  final String title2;
  final Widget child;

  const NormalScreen(
      {Key key,
      this.imagePath,
      this.title1 = "",
      this.title2 = "",
      this.child}) : super(key: key);

  @override
  _NormalScreen createState() => _NormalScreen();

}

class _NormalScreen extends State<NormalScreen> {
  double itemBorderRadius = 20;
  double titleFontSize = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage(widget.imagePath),
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: 80,),
                          Text(
                            widget.title1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            widget.title2,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
            Positioned(
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: CustomColor.boxColor,
                      borderRadius: BorderRadius.circular(itemBorderRadius)
                  ),
                  child: widget.child,
                )),
          ],
        ),
      ),
    );
  }

}