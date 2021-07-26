import 'package:flutter/material.dart';

class FunctionButton extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final Color color;
  final String text;
  final Function onClick;

  FunctionButton({
    required this.width,
    required this.height,
    required this.fontSize,
    required this.color,
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
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
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
    );
  }
}
