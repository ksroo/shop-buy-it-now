import 'package:flutter/material.dart';

class CustomImageBuyIcon extends StatelessWidget {
  final String text;
  final String image;

  CustomImageBuyIcon({@required this.text,@required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage(image),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                text,
                style: TextStyle(fontFamily: "Pacifico", fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

