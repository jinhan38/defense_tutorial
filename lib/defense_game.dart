import 'dart:async';

import 'package:defense_tutorial/map/map_component.dart';
import 'package:defense_tutorial/util/game_log.dart';
import 'package:defense_tutorial/util/game_setting.dart';
import 'package:flame/game.dart';

class DefenseGame extends FlameGame {
  final GameSetting _setting = GameSetting();

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);
    logging("onGameResize canvasSize : $canvasSize");
    _setting.init(canvasSize);
  }

  @override
  FutureOr<void> onLoad() async {
    logging("DefenseGame.onLoad");

    var mapComponent = MapComponent(
      tileSize: Vector2(_setting.mapTileSize, _setting.mapTileSize),
      mapGrid: Vector2(_setting.mapTileWidthCount, _setting.mapTileHeightCount),
      position: Vector2(0, 0),
      size: Vector2(_setting.screenSize.x, _setting.screenSize.y),
    );
    add(mapComponent);
    return null;
  }

  @override
  void onMount() {
    super.onMount();
    logging("DefenseGame.onMount");
  }
}
