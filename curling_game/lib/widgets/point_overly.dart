import 'dart:ui';

import 'package:curling_game/game/curling_game.dart';
import 'package:curling_game/utils/app_constants.dart';
import 'package:flutter/material.dart';

class PointOverlay extends StatelessWidget {
  static const id = 'pointoverlay';

  final CurlingGame gameRef;
  const PointOverlay(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            gamePoints.isNegative ? 
              const SizedBox.shrink():
              Text('+', style: TextStyle(color: color , fontSize: 50 ,fontWeight: FontWeight.bold),),

            Text(gamePoints.toInt().toString(), style: TextStyle(color: color, fontSize: 50 ,fontWeight: FontWeight.bold),),
            Text(' Points', style: TextStyle(color: color, fontSize: 50, fontWeight: FontWeight.bold),),
          ],
        ),
      )
    );
  }
}