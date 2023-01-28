import 'dart:math';

import 'package:defense_tutorial/enemy/enemy_component.dart';
import 'package:defense_tutorial/enemy/enemy_v1.dart';
import 'package:defense_tutorial/util/game_log.dart';
import 'package:flame/components.dart';

import 'enemy_info.dart';

class EnemyFactory extends PositionComponent {
  int currentWave = 0;
  int _spwanCount = 0;
  double _interval = 1;

  final Vector2 startPosition;
  final List<EnemyInfo> enemyInfos;

  EnemyFactory(this.startPosition, this.enemyInfos);

  EnemyComponent setSpawnEnemy(Vector2 anchor, EnemyType type) {
    return EnemyV1(position: anchor, type: type, infos: enemyInfos);
  }

  EnemyComponent spawnOneEnemy(EnemyType type) {
    EnemyComponent enemy = setSpawnEnemy(startPosition, type);
    add(enemy);
    enpowerEnemy(enemy);
    print('EnemyFactory.spawnOneEnemy');
    // enemy.moveSmart(gameRef.gameController.gateEnd.position);
    return enemy;
  }

  void enpowerEnemy(EnemyComponent enemy) {
    num exp = (currentWave - 1);
    enemy.maxLife *= pow(1.1, exp);
  }

  EnemyComponent spawnEnemyA() => spawnOneEnemy(EnemyType.a);

  EnemyComponent spawnEnemyB() => spawnOneEnemy(EnemyType.b);

  EnemyComponent spawnEnemyC() => spawnOneEnemy(EnemyType.c);

  EnemyComponent spawnEnemyD() => spawnOneEnemy(EnemyType.d);

  void start() => nextWave();

  void spawnEnemy(int number, double interval, EnemyComponent Function() spawnF) {
    _spwanCount = number;
    _interval = interval;
    spawnEnemyLoop(spawnF);
  }

  void spawnEnemyLoop(Function spawnF) {
    if (_spwanCount <= 0) {
      add(TimerComponent(
          period: _interval,
          repeat: false,
          removeOnFinish: true,
          onTick: () => nextWave()));
    } else {
      var result = spawnF();
      print('EnemyFactory.spawnEnemyLoop result : $result');
      add(TimerComponent(
          period: _interval,
          repeat: false,
          removeOnFinish: true,
          onTick: () => spawnEnemyLoop(spawnF)));
      _spwanCount--;
    }
  }

  void nextWave() {
    currentWave++;
    logging("nextWave currentWave : $currentWave");
    switch (currentWave) {
      case 1:
        spawnEnemy(20, 1.2, spawnEnemyA);
        break;
      case 2:
        spawnEnemy(30, 0.8, spawnEnemyB);
        break;
      case 3:
        spawnEnemy(15, 2, spawnEnemyC);
        break;
      case 4:
        spawnEnemy(10, 1.5, spawnEnemyD);
        break;
      default:
        // spawnEnemy(10, 2, spawnEnemyMix);
        break;
    }
  }

  void spawnEnemyMix() {
    Random rnd = Random();
    int r = rnd.nextInt(4);
    spawnOneEnemy(EnemyType.values[r]);
  }
}
