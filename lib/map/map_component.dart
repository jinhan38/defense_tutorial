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

  final double _strokeWidth = 5;

  @override
  void onMount() {
    super.onMount();
    for (var w = 0; w < mapGrid.x; w++) {
      for (var h = 0; h < mapGrid.y; h++) {
        var mapTile = MapTile(
            position: _calcPosition(w, h, tileSize.x, tileSize.y, _strokeWidth),
            size: tileSize,
            strokeWidth: _strokeWidth);
        add(mapTile);
      }
    }
  }

  /// MapTile이 그려질 때 paintstroke 값이 4라면 가장 왼쪽과 가장 오른쪽이 2씩 짤린다.
  /// 때문에 strokeWidth의 절반 값 만큼 더해줘야 한다.
  Vector2 _calcPosition(int w, int h, double x, double y, double strokeWidth) {
    return Vector2(
      (w * tileSize.x) + (strokeWidth / 2),
      (h * tileSize.y) + (strokeWidth / 2),
    );
  }
}
