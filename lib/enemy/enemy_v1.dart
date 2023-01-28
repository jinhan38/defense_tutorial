import 'package:defense_tutorial/enemy/enemy_component.dart';
import 'package:defense_tutorial/enemy/enemy_info.dart';
import 'package:defense_tutorial/enemy/enemy_setting.dart';
import 'package:defense_tutorial/util/game_log.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class EnemyV1 extends EnemyComponent {
  late SpriteSheet spriteSheet;
  final EnemyType type;

  SpriteAnimation? animation;

  EnemyV1({
    required super.position,
    required this.type,
    required List<EnemyInfo> infos,
  }) {
    // logging("EnemyV1 setting load : ${info.spriteSheet}");

    EnemyInfo info = infos[type.index];
    logging("EnemyV1 setting load : ${info.spriteSheet}");
    setLife(info.life);
    speed = info.speed;
    size = Vector2(50, 50) * info.scale;
    try {
      spriteSheet = info.spriteSheet;
      logging("spriteSheet ssss $size, spriteSheet $spriteSheet");
    } catch (e) {
      logging("spri error : $e");
    }
  }

  @override
  Future<void>? onLoad() {
    super.onLoad();
    return null;
  }

  @override
  void onKilled() {
    setDeadAnimation();
    super.onKilled();
  }

  void setLiveAnimation() {
    List<Sprite> sprites = [];
    sprites.add(spriteSheet.getSprite(0, 0));
    sprites.add(spriteSheet.getSprite(0, 1));
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.4, loop: true);
  }

  void setDeadAnimation() {
    List<Sprite> sprites = [];
    sprites.add(spriteSheet.getSprite(0, 0));
    sprites.add(spriteSheet.getSprite(1, 0));
    sprites.add(spriteSheet.getSprite(2, 0));
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.1, loop: false);
  }
}
