import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const TextButton({
    Key key,
    this.text = "HOUSE of PLANTS",
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
