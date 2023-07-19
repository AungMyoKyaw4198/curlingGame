import 'package:flame/components.dart';

class Line extends SpriteComponent with HasGameRef{
  final String name;
  final double hght;
  Line({required this.name, required this.hght});

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite(name);
    size = Vector2(gameRef.canvasSize.x, hght);
    return super.onLoad();
  }

}