library snake;
import 'dart:html';
import 'dart:async';
import 'dart:core';
import 'snake.dart';
import 'eats.dart';


Snake snake;
Eats eats;

void main() {
  eats = new Eats();
  snake = new Snake()
    ..addListeners();
  new Timer.periodic(new Duration(seconds: 1), (Timer timer) {
    
  });
}
