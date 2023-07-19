import 'package:curling_game/game/curling_game.dart';
import 'package:curling_game/utils/app_constants.dart';
import 'package:flutter/material.dart';

class TextOverlay extends StatelessWidget {
  static const id = 'textoverlay';
  final CurlingGame game;

  const TextOverlay(this.game, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: game.canvasSize.x,
      height: game.canvasSize.y,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 11,
            itemBuilder: (context, index){
                return Container(
                  height: lineHeight,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                    (10 - index ).toString(), 
                    style: TextStyle(color: Colors.white,fontSize: lineHeight, fontWeight: FontWeight.bold),),
                    index == 5?
                      Text(
                      ' / '+(35).toString(), 
                      style: TextStyle(color: Colors.white,fontSize: lineHeight, fontWeight: FontWeight.bold),)
                      : const SizedBox.shrink(),
                    index == 6?
                      Text(
                      ' / '+(30).toString(), 
                      style: TextStyle(color: Colors.white,fontSize: lineHeight, fontWeight: FontWeight.bold),)
                      : const SizedBox.shrink(),
                    index == 7?
                      Text(
                      ' / '+(25).toString(), 
                      style: TextStyle(color: Colors.white,fontSize: lineHeight, fontWeight: FontWeight.bold),)
                      : const SizedBox.shrink(),
                    index == 8?
                      Text(
                      ' / '+(20).toString(), 
                      style: TextStyle(color: Colors.white,fontSize: lineHeight, fontWeight: FontWeight.bold),)
                      : const SizedBox.shrink(),
                    index == 9?
                      Text(
                      ' / '+(15).toString(), 
                      style: TextStyle(color: Colors.white,fontSize: lineHeight, fontWeight: FontWeight.bold),)
                      : const SizedBox.shrink(),
                  ],)
            );
          }),
          SizedBox(
            height: lineHeight*4,
          ),
          Text('-5', style: TextStyle(color: Colors.white,fontSize: lineHeight, fontWeight: FontWeight.bold),),
        ],
      ) 
      
      
    );
  }
}