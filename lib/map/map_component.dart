import 'dart:async';

import 'package:defense_tutorial/map/map_tile.dart';
import 'package:flame/components.dart';

class MapComponent extends PositionComponent {
  late Vector2 tileSize;
  late Vector2 mapGrid;

  MapComponent({
    required this.tileSize,
    required this.mapGrid,
    position,
    size,
  }) : super(position: position, size: size);

  final double _strokeWidth = 1;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    for (var w = 0; w < mapGrid.x; w++) {
      for (var h = 0; h < mapGrid.y; h++) {
        var mapTile = MapTile(
            position: _calcPosition(w, h, tileSize.x, tileSize.y, _strokeWidth),
            size: tileSize,
            strokeWidth: _strokeWidth);
        add(mapTile);
      }
    }
    return null;
  }

  Vector2 _calcPosition(int w, int h, double x, double y, double strokeWidth) {
    return Vector2(w * tileSize.x, h * tileSize.y);
  }
}
