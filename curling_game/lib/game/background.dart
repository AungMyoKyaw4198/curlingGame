import 'package:flame/components.dart';

class Background extends SpriteComponent with HasGameRef {
  final String name;
  Background({required this.name});

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite(name);
    size = gameRef.canvasSize;
    return super.onLoad();
  }
}