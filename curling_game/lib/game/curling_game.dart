import 'dart:ui';

import 'package:curling_game/game/background.dart';
import 'package:curling_game/game/curl.dart';
import 'package:curling_game/game/line.dart';
import 'package:curling_game/utils/app_constants.dart';
import 'package:curling_game/widgets/choosedish.dart';
import 'package:curling_game/widgets/score.dart';
import 'package:curling_game/widgets/text_overlay.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class CurlingGame extends FlameGame with HasCollidables , MultiTouchDragDetector{
  late Background _background;
  late Curl _curl;
  late Line _line;

  static const _imageAssets = [
    'bg.jpg',
    'curl.png',
    'line.png',
    'dotLine.png',
    'normalLine.png',
  ];

  Offset? _dragStartPosition;
  late Vector2 currentLocation;

  double totalAtt = 5;
  double attempt = 1;

  bool smashMode = false;
  bool isOverLine = false;

  @override
  Future<void>? onLoad() async {
    debugMode = false;
    await images.loadAll(_imageAssets);

    _background = Background(name: 'bg.jpg');
    await add(_background);

    curlSize = canvasSize.x /2;
    lineHeight = curlSize/20;
    line2Height = curlSize/100;

    for(int i =0; i<= 4 ; i++){

      _line = Line(name: 'line.png', hght: lineHeight);
      
      add(_line);
      _line.position = Vector2(0, lineHeight + lineHeight *2 * i.toDouble());
      
    }
    // 0 line
    _line = Line(name: 'line.png', hght: line2Height);
    add(_line);
    _line.position = Vector2(0, lineHeight *13);

    // -5 line
    _line = Line(name: 'dotLine.png', hght: line2Height);
    add(_line);
    _line.position = Vector2(0, canvasSize.y - canvasSize.y/3);

    _curl = Curl(name: 'curl.png',width: curlSize);
    add(_curl);
    _curl.setMoveDirection(Vector2(canvasSize.x + curlSize , canvasSize.y + curlSize));    

    overlays.add(ChooseDish.id);

    return super.onLoad();
  }

  void startGame(){
    resumeEngine();
    overlays.add(Score.id);
    overlays.add(TextOverlay.id);
   
    _curl.anchor = Anchor.center;
    _curl.setMoveDirection(Vector2(canvasSize.x /2 , canvasSize.y - canvasSize.y/6));
    _curl.isMoving = false;
    _curl.isVericalDragEnd = false;
  }

  void reStartGame(){
    isOverLine = false;
    attempt++;
    dataProvider.att = attempt;
    _curl.isMoving = false;
    _curl.isVericalDragEnd = false;
    _curl.setMoveDirection(Vector2(canvasSize.x /2 , canvasSize.y - canvasSize.y/6));
    resumeEngine();
  }

  void endGame(){
    // remove(_curl);
    overlays.remove(Score.id);
    attempt = 0;
    dataProvider.att = 0;
    dataProvider.avgScore = 0;
    dataProvider.totalScore = 0;
    smashMode = false;
    isOverLine = false;
  }

  @override
  void update(double dt) {
    if(_curl.position.x< 0){
      _curl.position.x += dt * _curl.dragSpeed; 
    }else if(_curl.position.x >= canvasSize.x){
      _curl.position.x -= dt * _curl.dragSpeed; 
    }else if(_curl.position.y >= canvasSize.y){
      _curl.position.y -= dt * _curl.dragSpeed; 
    }

    super.update(dt);
  }


  @override
  void onDragStart(int pointerId, DragStartInfo info) {
    currentLocation = Vector2(info.raw.globalPosition.dx, info.raw.globalPosition.dy);

    if(currentLocation.distanceTo(_curl.position) < 100){
      _dragStartPosition = info.raw.globalPosition;
    }
    super.onDragStart(pointerId, info);
  }

  

  @override
  void onDragUpdate(int pointerId, DragUpdateInfo info) {

    if(_dragStartPosition != null){
      _curl.setMoveDirection(info.eventPosition.global);
    }

    super.onDragUpdate(pointerId, info);
  }

  @override
  void onDragEnd(int pointerId, DragEndInfo info) {
    _dragStartPosition =  null;

    if(_curl.position.y < canvasSize.y - canvasSize.y/3){
      isOverLine = true;
    }else{
      isOverLine = false;
    }

    _curl.isVericalDragEnd = true;
    if(info.velocity.y < -50){
      _curl.isMoving = true;
      _curl.moveSpeed = info.velocity.y/5;
      _curl.finalDistance = canvasSize.y + info.velocity.y/5 *2;
    }
    super.onDragEnd(pointerId, info);
  }

}