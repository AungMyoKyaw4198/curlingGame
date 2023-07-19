import 'package:curling_game/game/curling_game.dart';
import 'package:curling_game/providers/data_provider.dart';
import 'package:curling_game/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Score extends StatelessWidget {
  static const id = 'score';
  final CurlingGame game;

  const Score(this.game, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // IconButton(
          //   icon: const Icon(Icons.refresh),
          //   onPressed: (){
          //     // game.endGame();
          //     game.reStartGame();
          //     // game.overlays.add(ChooseDish.id);
          //   },
          // ),
          // IconButton(
          //   icon: const Icon(Icons.home),
          //   onPressed: (){
          //     game.endGame();
          //     game.overlays.add(ChooseDish.id);
          //   },
          // ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white38,
              border: Border.all(
                color: Colors.black,
                width: 1,
              )
            ),
            child: Column(
              children: [
                 ChangeNotifierProvider.value(
                  value: dataProvider,
                  child: Selector<DataProvider, int>(
                    selector: (_, dataProvider) => dataProvider.att.toInt(),
                    builder: (_, score, __) {
                      int totalAtt = game.totalAtt.toInt();
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                          '$score / ',
                          style: const TextStyle(color: Colors.blue , fontSize: 20 ,),
                          ),
                          Text(
                          '$totalAtt',
                          style: const TextStyle(color: Colors.black , fontSize: 20 ,),
                          ),
                        ],
                      );
                      },
                    ),
                  ),
                  const Text('Attempts', style: TextStyle(color: Colors.black , fontSize: 20 ,),),
              ],
            )
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white38,
              border: Border.all(
                color: Colors.black,
                width: 1,
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ChangeNotifierProvider.value(
                  value: dataProvider,
                  child: Selector<DataProvider, double>(
                    selector: (_, dataProvider) => dataProvider.avgScore,
                    builder: (_, score, __) {
                      String scoreText = score.toStringAsFixed(2);
                      return Text(
                        scoreText,
                        style: const TextStyle(color: Colors.blue , fontSize: 20 ,),
                        );
                      },
                    ),
                  ),
                const Text('Average', style: TextStyle(color: Colors.black , fontSize: 20 ,),),
              ],
            )
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white38,
              border: Border.all(
                color: Colors.black,
                width: 1,
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                ChangeNotifierProvider.value(
                value: dataProvider,
                child: Selector<DataProvider, int>(
                  selector: (_, dataProvider) => dataProvider.totalScore.toInt(),
                  builder: (_, score, __) {
                    return Text(
                      '$score',
                      style: const TextStyle(color: Colors.blue , fontSize: 20 ,),
                      );
                    },
                  ),
                ),
                const Text(' Points ', style: TextStyle(color: Colors.black , fontSize: 20 ,),),
              ],
            )
          ),
        ],
      ) 
      
      
    );
  }
}