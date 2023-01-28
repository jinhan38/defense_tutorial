import 'dart:async';
import 'dart:ui';

import 'package:defense_tutorial/enemy/enemy_component.dart';
import 'package:defense_tutorial/map/map_component.dart';
import 'package:defense_tutorial/util/game_log.dart';
import 'package:defense_tutorial/util/game_setting.dart';
import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'base/base_component.dart';

class DefenseGame extends FlameGame {
  final GameSetting _setting = GameSetting();
  bool _assetLoad = false;
  MapComponent? _mapComponent;
  BaseComponent? _startComponent;
  BaseComponent? _endComponent;
  EnemyComponent? _enemyComponent;
  late Image blackHole;
  late Image whiteHole;

  @override
  void onGameResize(Vector2 canvasSize) async{
    super.onGameResize(canvasSize);
    if(!_assetLoad){
      _assetLoad = true;
      await _imageLoad();
    }
    _setting.init(canvasSize);
    _setMapComponent();
    _setStartComponent();
    _setEndComponent();
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    logging("DefenseGame.onLoad");
    return null;
  }

  void _checkRemove(Component? component) {
    if (component != null) remove(component);
  }

  void _setMapComponent() {
    _checkRemove(_mapComponent);
    _mapComponent = MapComponent(
      tileSize: _setting.mapTileSizeVector2,
      mapGrid: _setting.mapGridVector2,
      position: _setting.mapPositionVector2,
      size: _setting.mapComponentSize(),
    );
    add(_mapComponent!);
  }



  Future<void> _imageLoad() async {
    blackHole = await Images().load('blackhole.png');
    whiteHole = await Images().load('whitehole.png');
  }

  void _setStartComponent() async {
    _checkRemove(_startComponent);
    _startComponent = BaseComponent(
        sprite: Sprite(blackHole),
        position: _setting.startPositionVector2,
        size: _setting.mapTileSizeVector2);
    add(_startComponent!);
  }
  void _setEndComponent() async {
    _checkRemove(_endComponent);
    _endComponent = BaseComponent(
        sprite: Sprite(whiteHole),
        position: _setting.endPositionVector2(),
        size: _setting.mapTileSizeVector2);
    add(_endComponent!);
  }

  void _setEnemyComponent(){

  }
}
