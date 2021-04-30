import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final double scale;
  final Color color;

  Indicator({Key key, @required this.scale, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: new Transform.scale(
          scale: scale,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ),
    );
  }
}