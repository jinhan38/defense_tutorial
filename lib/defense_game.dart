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
import 'enemy/enemy_factory.dart';
import 'enemy/enemy_info.dart';
import 'enemy/enemy_setting.dart';
import 'enemy/s_component.dart';

class DefenseGame extends FlameGame {
  final GameSetting _setting = GameSetting();
  bool _assetLoad = false;
  MapComponent? _mapComponent;
  BaseComponent? _startComponent;
  BaseComponent? _endComponent;
  EnemyFactory? _enemyFactory;
  late Image blackHole;
  late Image whiteHole;
  List<EnemyInfo> enemy = [];

  late final EnemySetting setting = EnemySetting();

  @override
  void onGameResize(Vector2 canvasSize) async {
    super.onGameResize(canvasSize);
    if (!_assetLoad) {
      _assetLoad = true;
      await _imageLoad();
    }
    _setting.init(canvasSize);
    _setMapComponent();
    _setStartComponent();
    _setEndComponent();
    // _setEnemyComponent();
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
    enemy.addAll(await setting.load());
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

  void _setEnemyComponent() {
    _checkRemove(_enemyFactory);
    _enemyFactory = EnemyFactory(_setting.startPositionVector2, enemy);
    add(_enemyFactory!);
  }

  void start() {
    add(SComponent());
      // List<Sprite> sprites = [];
      // sprites.add(enemy[0].spriteSheet.getSprite(0, 0));
      // sprites.add(enemy[0].spriteSheet.getSprite(0, 1));
      // SpriteAnimation animation = SpriteAnimation.spriteList(sprites, stepTime: 0.4, loop: true);
    // _enemyFactory?.start();
      // animation.onStart?.call();


  }
}
