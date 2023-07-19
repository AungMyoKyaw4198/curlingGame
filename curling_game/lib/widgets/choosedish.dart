import 'dart:ui';

import 'package:curling_game/game/curling_game.dart';
import 'package:curling_game/widgets/game_mode.dart';
import 'package:flutter/material.dart';

class ChooseDish extends StatefulWidget {
  static const id = 'choosedish';

  final CurlingGame gameRef;
  const ChooseDish(this.gameRef,{Key? key}) : super(key: key);

  @override
  _ChooseDishState createState() => _ChooseDishState();
}

class _ChooseDishState extends State<ChooseDish> {
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
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white38,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )
                ),
                child: const Center(
                  child: Text(' Choose Your Dish', 
                          style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
                          )
                ),
              ),

              Expanded(
                child: Container(
                  height: 300,
                  
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )
                  ),

                  child: InkWell(
                          onTap: (){
                              widget.gameRef.overlays.remove(ChooseDish.id);
                              widget.gameRef.overlays.add(GameMode.id);
                            },
                          child: Container(
                            width: double.infinity,
                            child: Image.asset('assets/images/curl.png'),
                          ),
                        ),
                  
                ),
              ),

            ],
          )
        ),
      )
    );
  }
}