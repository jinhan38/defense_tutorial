import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class BaseComponent extends PositionComponent with HasPaint{
  BaseComponent({
    required this.sprite,
    super.position,
    super.size,
  });

  Sprite sprite;

  @override
  void render(Canvas canvas) {
    sprite.render(canvas,size: size,overridePaint: paint);
    super.render(canvas);
  }
}
