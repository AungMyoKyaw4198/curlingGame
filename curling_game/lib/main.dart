import 'package:curling_game/game/curling_game.dart';
import 'package:curling_game/widgets/choosedish.dart';
import 'package:curling_game/widgets/game_mode.dart';
import 'package:curling_game/widgets/gameover.dart';
import 'package:curling_game/widgets/play.dart';
import 'package:curling_game/widgets/point_overly.dart';
import 'package:curling_game/widgets/score.dart';
import 'package:curling_game/widgets/text_overlay.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curling Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainGamePage(),
    );
  }
}


class MainGamePage extends StatefulWidget {
  const MainGamePage({Key? key}) : super(key: key);

  @override
  _MainGamePageState createState() => _MainGamePageState();
}

class _MainGamePageState extends State<MainGamePage> with WidgetsBindingObserver{
  late AppLifecycleState _notification; 
  final CurlingGame _game = CurlingGame();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _notification = state;
    });
    switch(_notification){
     case AppLifecycleState.resumed:
       _game.pauseEngine();
       break;
     case AppLifecycleState.inactive:
       _game.pauseEngine();
       break;
     case AppLifecycleState.paused:
       break;
     case AppLifecycleState.detached:
       break;
   }
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   setState(() {
  //     _notification = state;
  //   });
  //   switch(_notification){
  //    case AppLifecycleState.resumed:
  //      _game.overlays.add(PauseMenu.id);
  //      _game.pauseEngine();
  //      _audioplayer.play();
  //      break;
  //    case AppLifecycleState.inactive:
  //      _game.overlays.add(PauseMenu.id);
  //      _game.pauseEngine();
  //      _audioplayer.pause();
  //      break;
  //    case AppLifecycleState.paused:
  //      _audioplayer.pause();
  //      break;
  //    case AppLifecycleState.detached:
  //      _audioplayer.pause();
  //      break;
  //  }
  // }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: GameWidget(

        loadingBuilder: (conetxt) => Container(
          color: Colors.white,
          child: const Center(
              child: SizedBox(
                width: 200,
                child: LinearProgressIndicator(),
              ),
            ),
        ),
        
        overlayBuilderMap: {
            Score.id: (_, CurlingGame gameRef) => Score(gameRef),
            PointOverlay.id: (_, CurlingGame gameRef) => PointOverlay(gameRef),
            GameOver.id: (_, CurlingGame gameRef) => GameOver(gameRef),
            GameMode.id: (_, CurlingGame gameRef) => GameMode(gameRef),
            Play.id: (_, CurlingGame gameRef) => Play(gameRef),
            ChooseDish.id: (_, CurlingGame gameRef) => ChooseDish(gameRef),
            TextOverlay.id: (_, CurlingGame gameRef) => TextOverlay(gameRef),
          },

        game: _game,
      ),
    );
  }
}