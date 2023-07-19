import 'dart:ui';

import 'package:curling_game/game/curling_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Play extends StatefulWidget {
  static const id = 'play';

  final CurlingGame gameRef;
  const Play(this.gameRef,{Key? key}) : super(key: key);

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  bool sequenceStart = false;
  List<String> sequenceTest = ['3', '2' , '1'];
  int index = 0;

  @override
  void initState() {
    sequenceStart = false;
    index = 0;
    super.initState();
  }

  startSequence(){
    setState(() {
      sequenceStart = true;
    });
    Future.delayed(const Duration(seconds: 1),(){
      setState(() {
        index = 1;
      });
    });
    Future.delayed(const Duration(seconds: 2),(){
      setState(() {
        index = 2;
      });
    });
    Future.delayed(const Duration(seconds: 3),(){
      widget.gameRef.overlays.remove(Play.id);
      widget.gameRef.startGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Center(
        child: sequenceStart ? 
        Container(
          padding: const EdgeInsets.all(100.0),
            decoration: const BoxDecoration(
              color: Colors.white38,
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(200)
            ),
            child: Text(sequenceTest[index], 
                          style: const TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
                          )
          )
        :InkWell(
          onTap: (){
            startSequence();
          },
          child: Container(
            padding: const EdgeInsets.all(100.0),
            decoration: const BoxDecoration(
              color: Colors.white38,
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(200)
            ),
            child: const Text('Play', 
                          style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
                          )
          ),
        ),
      ),
    );
  }
}