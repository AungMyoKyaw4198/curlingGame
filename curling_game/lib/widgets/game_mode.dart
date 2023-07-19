import 'dart:ui';

import 'package:curling_game/game/curling_game.dart';
import 'package:curling_game/widgets/play.dart';
import 'package:flutter/material.dart';

class GameMode extends StatefulWidget {
  static const id = 'gamemode';

  final CurlingGame gameRef;
  const GameMode(this.gameRef,{Key? key}) : super(key: key);

  @override
  _GameModeState createState() => _GameModeState();
}

class _GameModeState extends State<GameMode> {
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
            children: [

              Container(
                padding : const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white38,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )
                ),
                child: const Center(
                  child: Text(' Game Mode', 
                          style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
                          )
                ),
              ),

              Expanded(
                
                child: Container(
                  padding : const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              widget.gameRef.totalAtt = 10;
                              widget.gameRef.overlays.remove(GameMode.id);
                              widget.gameRef.overlays.add(Play.id);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                border: Border.all(color: Colors.blue),
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(300)
                              ),
                              child: Column(
                                children: const [
                                  Text('10', 
                                    style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                                    ),
                                    Text('Attempts', 
                                    style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                ],
                              )
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              widget.gameRef.totalAtt = 25;
                              widget.gameRef.overlays.remove(GameMode.id);
                              widget.gameRef.overlays.add(Play.id);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                border: Border.all(color: Colors.blue),
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(300)
                              ),
                              child: Column(
                                children: const [
                                  Text('25', 
                                    style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                                    ),
                                    Text('Attempts', 
                                    style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                ],
                              )
                            ),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: (){
                              widget.gameRef.smashMode = true;
                              widget.gameRef.totalAtt = 0;
                              widget.gameRef.overlays.remove(GameMode.id);
                              widget.gameRef.overlays.add(Play.id);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(200)
                              ),
                              child: Column(
                                children: const [
                                  Text('Till it smashed', 
                                    style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
                                    ),
                                ],
                              )
                            ),
                          )
                    ],
                  )
                ),
              ),

            ],
          )
        ),
      )
    );
  }
}