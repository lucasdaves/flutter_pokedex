import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final Color startColor;
  final Color endColor;
  final String text;
  final Function onClick;

  GradientButton({
    required this.width,
    required this.height,
    required this.fontSize,
    required this.startColor,
    required this.endColor,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.red,
            Colors.orange,
            Colors.yellow,
            Colors.green,
            Colors.blueAccent,
            Colors.blue,
            Colors.deepPurple
          ])),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              textStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              onClick();
            },
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
