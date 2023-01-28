import 'package:flame/extensions.dart';

class GameSetting {
  /// 현재 화면 사이즈
  late Vector2 screenSize;

  /// 타일 사이즈
  double mapTileSize = 0;

  /// 타일의 개수
  final double mapTileCount = 12;

  /// 타일 사이즈 최소값
  final double _minTileSize = 30;

  void init(Vector2 size) {
    setScreenSize(size);
    caleMapTile(size);
  }

  /// 화면 사이즈 세팅
  void setScreenSize(Vector2 size) => screenSize = size;

  /// 타일의 사이즈 계산
  void caleMapTile(Vector2 size) {
    /// x, y 중에 사이즈가 작은 값을 기준으로 계산 한다.
    double value = size.x > size.y ? size.y : size.x;

    /// value 값을 tile 개수로 나눈 후 -10 해준다.
    /// -10을 해주는 이유는 타일 크기를 줄여서, 전체 grid의 사이즈를 줄이기 위해서다
    /// 그래야 가로, 세로 패딩의 효과를 줄 수 있다.
    mapTileSize = (value / mapTileCount) - 10;

    /// 최소값 체크
    if (mapTileSize < _minTileSize) mapTileSize = _minTileSize;
  }

  Vector2 get mapTileSizeVector2 => Vector2(mapTileSize, mapTileSize);

  Vector2 get mapGridVector2 => Vector2(mapTileCount, mapTileCount);

  Vector2 get mapPositionVector2 => Vector2(
        (screenSize.x - mapTileCount * mapTileSize) / 2,
        (screenSize.y - mapTileCount * mapTileSize) / 2,
      );

  Vector2 mapComponentSize() {
    double x = screenSize.x;
    double y = screenSize.y;
    if (x < _minScreenSize || y < _minScreenSize) {
      return Vector2(_minScreenSize, _minScreenSize);
    }
    return screenSize;
  }

  double get _minScreenSize => mapTileCount * _minTileSize;
}
