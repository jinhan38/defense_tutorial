import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MapTile extends PositionComponent {
  MapTile({
    required Vector2 position,
    required Vector2 size,
    required this.strokeWidth,
  }) : super(position: position, size: size);
  final double strokeWidth;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(
        size.toRect(),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..color = Colors.green);
  }

}
