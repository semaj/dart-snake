library eats;
import 'dart:html';
import 'dart:math';
import 'dart_snake.dart';
class Eats {
  int x = 300;
  int y = 300;

  void randomPosition() {
    Random r = new Random();
    x = (r.nextInt(windowWidth()) / SQUARE_SIZE).floor() * SQUARE_SIZE;
    y = (r.nextInt(windowHeight()) / SQUARE_SIZE).floor() * SQUARE_SIZE;
  }

  void draw() {
    querySelector('#board').children.add(new DivElement()
        ..className = 'eats'
        ..style.left = "${x}px"
        ..style.bottom = "${y}px");
  }
}
