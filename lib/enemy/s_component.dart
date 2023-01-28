import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/sprite.dart';

class SComponent extends SpriteAnimationComponent with HasGameRef {
  SComponent() : super(size: Vector2(40.0, 40.0), position: Vector2(200, 200));

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await _loadAnimations();
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('enemy/enemyA.png'),
      srcSize: Vector2(40.0, 40.0),
    );
    List<Sprite> sprites = [];
    sprites.add(spriteSheet.getSprite(0, 0));
    sprites.add(spriteSheet.getSprite(0, 1));
    animation = SpriteAnimation.spriteList(sprites, stepTime: 1, loop: true);
  }
}
