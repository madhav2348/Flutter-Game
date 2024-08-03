import 'dart:async';
import 'dart:math' as math;

import 'package:brick_breaker/src/config.dart';
import 'package:brick_breaker/src/component/component.dart';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrickBreaker extends FlameGame
    with HasCollisionDetection, KeyboardHandler {
  BrickBreaker()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  final rand = math.Random();

  double get width => size.x;
  double get height => size.y;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    camera.viewfinder.anchor = Anchor.topLeft;
    world.add(PlayArea());
    world.add(
      Ball(
        position: size / 2,
        radius: ballRadius,
        velocity: Vector2((rand.nextDouble() - 0.5) * width, height * 0.2)
            .normalized()
          ..scale(height / 4),
      ),
    );
    world.add(
      Bat(
        cornerRadius: const Radius.circular(ballRadius / 2),
        position: Vector2(width / 2, height * 0.95),
        size: Vector2(batWidth, batHeight),
      ),
    );
    debugMode = true;

    @override
    KeyEventResult onKeyEvent(
        KeyEvent event, Set<LogicalKeyboardKey> keyPressed) {
      super.onKeyEvent(event, keyPressed);
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowLeft:
          world.children.query<Bat>().first.moveBY(-batStep);
        case LogicalKeyboardKey.arrowRight:
          world.children.query<Bat>().first.moveBY(batStep);
      }
      return KeyEventResult.handled;
    }
  }
}
