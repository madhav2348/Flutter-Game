import 'package:flutter/material.dart';

const gameWidth = 820.0;
const gameHeight = 1600.0;
const ballRadius = gameWidth * 0.02;
const batWidth = gameWidth * 0.2;
const batHeight = ballRadius * 2;
const batStep = gameWidth * 0.05;

const brickColors = [
  Color(0xffffffff),
  Color(0xffffffff),
  Color(0xffffffff),
  Color(0xffffffff),
  Color(0xffffffff),
  Color(0xffffffff),
  Color(0xffffffff),
  Color(0xffffffff),
  Color(0xffffffff),
  Color(0xffffffff),
  Color(0xffffffff),
  Color(0xffffffff),
  Color(0xffffffff),
  Color(0xffffffff),
  Color(0xffffffff),
];

const brickGutter = gameWidth * 0.015;
final brickWidth =
    (gameWidth - (brickGutter * (brickColors.length + 1))) / brickColors.length;
const brickHeight = gameHeight * 0.03;
const difficultyModifier = 2.0;
