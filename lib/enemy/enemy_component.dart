import 'package:flame/components.dart';

import '../base/moving.dart';

enum EnemyType { a, b, c, d }

class EnemyComponent extends PositionComponent with Moving{
  double maxLife = 0;
  double life = 0;
  int mineValue = 5;
  bool dead = false;
  bool active = false;
  late EnemyType enemyType;
  int money = 10;

  EnemyComponent({super.position, super.size});

  void setLife(double l) {
    maxLife = l;
    life = l;
  }


  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);


  }

  @override
  void update(double dt) {
    super.update(dt);
    if(life <= 0){
      if(!dead) onKilled();
      dead = true;
      return;
    }
    if(active){
      updateMovable(dt);
    }
  }

  void onKilled(){
    active = false;
    removeFromParent();

  }
}
