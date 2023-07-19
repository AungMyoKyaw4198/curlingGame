import 'package:curling_game/game/curling_game.dart';
import 'package:curling_game/utils/app_constants.dart';
import 'package:curling_game/widgets/gameover.dart';
import 'package:curling_game/widgets/point_overly.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Curl extends SpriteComponent with HasGameRef<CurlingGame>{
  final String name;
  final double width;

  Curl({required this.name, required this.width})
      : super(
          size: Vector2.all(width),
        ){
      // addHitbox(HitboxRectangle());
    }
  
  final double dragSpeed = 300;

  double moveSpeed = 300;
  double finalDistance = 50;
  Vector2 moveDirection = Vector2.zero();
  bool isVericalDragEnd = false;
  bool isMoving = false;
  bool calculate = false;
  double finalPosition = 0;

  double curlSize = 0;
  double lineHeight = 0;

  CurlingGame game = CurlingGame();

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite(name);

    curlSize = gameRef.canvasSize.x /2;
    lineHeight = curlSize/20;

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);


    // When User Dragging
    if(!isVericalDragEnd){
      position = moveDirection;
    }

    // When Dragging Ends and Start Moving
    if(isVericalDragEnd){
      if(y > finalDistance || y > gameRef.canvasSize.y -width *2){
        y += moveSpeed * dt;
      } else{
        setMoveDirection(Vector2.zero());
        if(!gameRef.isOverLine){
          gameRef.pauseEngine();
          finalPosition = y - curlSize/2 + ((15/100) * curlSize);
          calculateMarks();
        } else {
          gameRef.pauseEngine();
          overLineMode();
        }
        
      }
    }

    
  }

  void setMoveDirection(Vector2 newMoveDirection){
    moveDirection = newMoveDirection;
  }


  void calculateMarks(){
    bool isSmashed = false;
    if(finalPosition >= 0){

        if(finalPosition >= 0 && finalPosition < lineHeight){
          // 0 - 25
          print('10 points');
          gamePoints = 10;
          color = Colors.green;
        } else if(finalPosition >= lineHeight && finalPosition < lineHeight *2){
          // 25 - 50
          print('9 points');
          gamePoints = 9;
          color = Colors.green;
        } else if(finalPosition >= lineHeight* 2 && finalPosition < lineHeight * 3){
          // 50 - 75
          print('8 points');
          gamePoints = 8;
          color = Colors.green;
        } else if(finalPosition >= lineHeight *3 && finalPosition < lineHeight *4){
          // 75 - 100
          print('7 points');
          gamePoints = 7;
          color = Colors.green;
        } else if(finalPosition >= lineHeight *4 && finalPosition < lineHeight *5){
          // 100 - 125
          print('6 points');
          gamePoints = 6;
          color = Colors.green;
        } else if(finalPosition >= lineHeight *5 && finalPosition < lineHeight *6){
          // 125 - 150
          print('5 points');
          gamePoints = 5;
          color = Colors.green;
        } else if(finalPosition >= lineHeight *6 && finalPosition < lineHeight *7){
          // 150 - 175
          print('4 points');
          gamePoints = 4;
          color = Colors.green;
        } else if(finalPosition >= lineHeight *7 && finalPosition < lineHeight *8){
          // 175 - 200
          print('3 points');
          gamePoints = 3;
          color = Colors.green;
        } else if(finalPosition >= lineHeight *8 && finalPosition < lineHeight *9){
          // 200 - 225
          print('2 points');
          gamePoints = 2;
          color = Colors.green;
        } else if(finalPosition >= lineHeight *9 && finalPosition < lineHeight *10){
          // 225 - 250
          print('1 points');
          gamePoints = 1;
          color = Colors.green;
        } else if(finalPosition >= lineHeight *10 && finalPosition < lineHeight *13){
          // 250 - 350
          print('0 points');
          gamePoints = 0;
          color = Colors.blue;
        } else if(finalPosition >= lineHeight *13 && finalPosition < gameRef.canvasSize.y - gameRef.canvasSize.y/3){
          // 250 - 350
          print('-5 points');
          gamePoints = -5;
          color = Colors.red;
        }

    } else if(finalPosition  < 0 ){
        // Curl Center over the Screen
        if( y < 0){
          print('-42 points');
          gamePoints = -42;
          color = Colors.red;
          isSmashed = true;

        } else{

          double startPosition = y + curlSize/2 - ((15/100) * curlSize);

          if(startPosition >= 0 && startPosition < lineHeight){
            // 0 - 25
            print('10 points');
            gamePoints = 10;
            color = Colors.green;
          } else if(startPosition >= lineHeight && startPosition < lineHeight *2){
            // 25 - 50
            print('9 points');
            gamePoints = 9;
            color = Colors.green;
          } else if(startPosition >= lineHeight* 2 && startPosition < lineHeight * 3){
            // 50 - 75
            print('8 points');
            gamePoints = 8;
            color = Colors.green;
          } else if(startPosition >= lineHeight *3 && startPosition < lineHeight *4){
            // 75 - 100
            print('7 points');
            gamePoints = 7;
            color = Colors.green;
          } else if(startPosition >= lineHeight *4 && startPosition < lineHeight *5){
            // 100 - 125
            print('6 points');
            gamePoints = 6;
            color = Colors.green;
          } else if(startPosition >= lineHeight *5 && startPosition < lineHeight *6){
            // 125 - 150
            print('35 points');
            gamePoints = 35;
            color = Colors.green;
          } else if(startPosition >= lineHeight *6 && startPosition < lineHeight *7){
            // 150 - 175
            print('30 points');
            gamePoints = 30;
            color = Colors.green;
          } else if(startPosition >= lineHeight *7 && startPosition < lineHeight *8){
            // 175 - 200
            print('25 points');
            gamePoints = 25;
            color = Colors.green;
          } else if(startPosition >= lineHeight *8 && startPosition < lineHeight *9){
            // 200 - 225
            print('20 points');
            gamePoints = 20;
            color = Colors.green;
          } else if(startPosition >= lineHeight *9 && startPosition < lineHeight *10){
            // 225 - 250
            print('15 points');
            gamePoints = 15;
            color = Colors.green;
          } else if(startPosition >= lineHeight *10 && startPosition < lineHeight *13){
            // 250 - 350
            print('0 points');
            gamePoints = 0;
            color = Colors.blue;
          } else if(startPosition >= lineHeight *13 && startPosition < gameRef.canvasSize.y - gameRef.canvasSize.y/3){
            // 250 - 350
            print('-5 points');
            gamePoints = -5;
            color = Colors.red;
          }

        }
    }

    gameRef.overlays.add(PointOverlay.id);
      totalPoints += gamePoints;
      if(totalPoints < 0){
        totalPoints = 0;
      }
      dataProvider.totalScore = totalPoints;
      if(totalPoints != 0 ){
        dataProvider.avgScore = totalPoints / gameRef.attempt;
      } else{
        dataProvider.avgScore = 0.0;
      }

      Future.delayed(const Duration(seconds: 2),(){
        gameRef.overlays.remove(PointOverlay.id);

        if(gameRef.smashMode){
          if(isSmashed){
            gameRef.overlays.add(GameOver.id);
            } else{
              gameRef.reStartGame();
          }

        }else if(dataProvider.att == gameRef.totalAtt){
          gameRef.overlays.add(GameOver.id);
        }else{
          gameRef.reStartGame();
        }

      });
    
    
  }

  void overLineMode(){
    gamePoints = 0;
    gameRef.overlays.add(PointOverlay.id);

    if(gameRef.smashMode){
      Future.delayed(const Duration(seconds: 2),(){
      gameRef.overlays.remove(PointOverlay.id);
      gameRef.reStartGame();
    });
    } else{
      Future.delayed(const Duration(seconds: 2),(){
      gameRef.overlays.remove(PointOverlay.id);
      if(dataProvider.att == gameRef.totalAtt){
        gameRef.overlays.add(GameOver.id);
      }else{
        gameRef.reStartGame();
      }

    });
    }
    
  }

}