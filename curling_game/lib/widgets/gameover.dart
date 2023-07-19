import 'dart:ui';

import 'package:curling_game/game/curling_game.dart';
import 'package:curling_game/utils/app_constants.dart';
import 'package:curling_game/widgets/choosedish.dart';
import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  static const id = 'gameover';

  final CurlingGame gameRef;
  const GameOver(this.gameRef, {Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 50,
          height: MediaQuery.of(context).size.height /3,
          color: Colors.white38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
                decoration: BoxDecoration(
                  color: Colors.white38,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(' Congratulations', 
                          style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),))),
                    ElevatedButton(
                      onPressed: (){
                        gameRef.endGame();
                        gameRef.overlays.remove(id);
                        gameRef.overlays.add(ChooseDish.id);

                    }, child: const Icon(Icons.close))
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
              
                      Text(dataProvider.totalScore.toInt().toString()+' Points', 
                        style: const TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           Column(
                             children: [
                               Text(dataProvider.att.toInt().toString(), 
                                  style: const TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                                const Text('Attempts', 
                                  style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                             ],
                           ),
                           Column(
                             children: [
                               Text(dataProvider.avgScore.toInt().toString(), 
                                  style: const TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                                const Text('Average', 
                                  style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                             ],
                           )
                        ],
                      )
              
                  ],),
                ),
              )

            ],
          ),
        )
      )
    );
  }
}