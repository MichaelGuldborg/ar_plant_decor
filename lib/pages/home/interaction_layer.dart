import 'package:ar_plant_decor/components/animated_button.dart';
import 'package:ar_plant_decor/components/text_button.dart';
import 'package:flutter/material.dart';

class InteractionLayer extends StatelessWidget {
  final VoidCallback onFlipPress;
  final VoidCallback onLeftPress;
  final VoidCallback onTextPress;
  final VoidCallback onRightPress;

  const InteractionLayer({
    Key key,
    this.onFlipPress,
    this.onLeftPress,
    this.onTextPress,
    this.onRightPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.rotate_left,
                    color: Colors.white,
                  ),
                  onPressed: onFlipPress,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnimatedButton(
                  size: 44,
                  onPressed: onLeftPress,
                ),
                TextButton(
                  color: Colors.white,
                  onTap: onTextPress,
                ),
                AnimatedButton(
                  size: 44,
                  onPressed: onRightPress,
                  color: Colors.green,
                  borderColor: Colors.green,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
