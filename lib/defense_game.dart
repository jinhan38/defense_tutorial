import 'dart:async';

import 'package:defense_tutorial/map/map_component.dart';
import 'package:flame/game.dart';

class DefenseGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    var mapComponent = MapComponent(
      tileSize: Vector2(80, 80),
      mapGrid: Vector2(5, 5),
      position: Vector2(0, 0),
      size: Vector2(500, 500),
    );
    add(mapComponent);
    return null;
  }
}
