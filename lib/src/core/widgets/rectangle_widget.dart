import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RectangleWidget extends StatelessWidget {
  final double width;
  final double height;
  final Icon? icon;
  final Text? text;
  const RectangleWidget(
      {super.key, required this.width, required this.height, this.icon,this.text});

  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.blue,
       borderRadius: BorderRadius.circular(5)
      ),
      child: 
      Row( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          icon ?? Container(),
          text ?? Container(),
         
        ],
      )
    );
  }
}
