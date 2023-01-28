import 'package:flame/sprite.dart';

class EnemyInfo {
  late final double life;
  late final double speed;
  late final double scale;
  late final SpriteSheet spriteSheet;

  EnemyInfo({
    required this.life,
    required this.speed,
    required this.scale,
    required this.spriteSheet,
  });

  @override
  String toString() {
    return 'EnemyInfo{life: $life, speed: $speed, scale: $scale, spriteSheet: $spriteSheet}';
  }
}
