import 'package:flutter/material.dart';

class PanelView extends StatelessWidget {
  final Widget child;
  final bool visible;
  final double height;

  const PanelView({
    Key key,
    this.visible = false,
    this.height,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = height ?? MediaQuery.of(context).size.height / 1.4;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn,
          height: visible ? _height : 0,
          color: Colors.white,
          child: child,
        ),
      ],
    );
  }
}
