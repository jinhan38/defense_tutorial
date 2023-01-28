import 'package:defense_tutorial/util/game_log.dart';
import 'package:flame/extensions.dart';

class GameSetting {
  late Vector2 screenSize;
  double mapTileSize = 0;
  double mapTileWidthCount = 0;
  double mapTileHeightCount = 0;

  void init(Vector2 size) {
    logging("GameSetting init : $size");
    setScreenSize(size);
    caleMapTile(size);
    caleMapTileCount(size);
  }

  /// 화면 사이즈 세팅
  void setScreenSize(Vector2 size) {
    screenSize = size;
    logging("GameSetting setScreenSize screenSize : $screenSize");
  }

  /// 타일의 사이즈 계산
  void caleMapTile(Vector2 size) {
    double value = size.x > size.y ? size.x : size.y;
    value = value / 20;
    mapTileSize = value;
    if (mapTileSize < 60) mapTileSize = 60;
    logging("GameSetting caleMapTile mapTileSize : $mapTileSize");
  }

  /// 타일의 개수 계산
  void caleMapTileCount(Vector2 size) {
    double widthCount = size.x / mapTileSize;
    double heightCount = size.y / mapTileSize;
    mapTileWidthCount = widthCount.toInt() - 2;
    mapTileHeightCount = heightCount.toInt() - 2;
    logging(
        "GameSetting caleMapTileCount mapTileWidthCount : $mapTileWidthCount");
    logging(
        "GameSetting caleMapTileCount mapTileHeightCount : $mapTileHeightCount");
  }
}
