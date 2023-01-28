import 'package:defense_tutorial/defense_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setOrientation(DeviceOrientation.portraitUp);
  runApp(GameWidget<DefenseGame>(
    game: DefenseGame(),
    overlayBuilderMap: {
      'start' : (context,game){
        return _pauseMenuBuilder(context, game);
      }
    },
    initialActiveOverlays: const ['start'],
  ));
}
Widget _pauseMenuBuilder(BuildContext buildContext, DefenseGame game) {
  return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.orange,
        child: Center(
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                game.start();
                game.overlays.remove('start');
              },
              child: const Text('Start'),
            )),
      ));
}

