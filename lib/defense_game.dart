import 'dart:async';

import 'package:defense_tutorial/map/map_component.dart';
import 'package:defense_tutorial/util/game_log.dart';
import 'package:defense_tutorial/util/game_setting.dart';
import 'package:flame/game.dart';

class DefenseGame extends FlameGame {
  final GameSetting _setting = GameSetting();
  MapComponent? _mapComponent;

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);
    _setting.init(canvasSize);
    _setMapComponent();
  }

  @override
  FutureOr<void> onLoad() async {
    logging("DefenseGame.onLoad");
    return null;
  }

  void _setMapComponent() {
    if (_mapComponent != null) remove(_mapComponent!);
    _mapComponent = MapComponent(
      tileSize: _setting.mapTileSizeVector2,
      mapGrid: _setting.mapGridVector2,
      position: _setting.mapPositionVector2,
      size: _setting.mapComponentSize(),
    );
    add(_mapComponent!);
  }
}
