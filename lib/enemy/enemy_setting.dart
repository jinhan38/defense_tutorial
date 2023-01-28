import 'dart:convert';

import 'package:defense_tutorial/util/game_log.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/services.dart';
import 'package:flame/cache.dart';

import 'enemy_info.dart';

class EnemySetting {

  Future<List<EnemyInfo>> load() async {
    List<EnemyInfo> enemy = [];
    String enemyParamsString =
        await rootBundle.loadString('assets/enemyParams.json');
    final enemyParams = json.decode(enemyParamsString);
    for (var param in enemyParams) {
     var spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: await Images().load(param['image']),
        columns: param['columns'],
        rows: param['rows'],
      );
      enemy.add(
        EnemyInfo(
          life: param['life'].toDouble(),
          speed: param['speed'].toDouble(),
          scale: param['scale'].toDouble(),
          spriteSheet: spriteSheet,
        ),
      );
    }
    logging("enemy ll : ${enemy.length}");
    return enemy;
  }
}
