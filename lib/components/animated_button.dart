import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double size;
  final Color color;
  final double borderWidth;
  final Color borderColor;

  const AnimatedButton({
    Key key,
    this.child,
    this.onPressed,
    this.size = 60,
    this.color = Colors.transparent,
    this.borderWidth = 3,
    this.borderColor = Colors.white,
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 + _controller.value;
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        _controller.forward();
      },
      onTapUp: (TapUpDetails details) {
        _controller.reverse();
      },
      onTap: widget.onPressed,
      child: Transform.scale(
        scale: _scale,
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.borderColor,
              width: widget.borderWidth,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
