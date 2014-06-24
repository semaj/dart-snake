import 'dart:html';
import 'dart:async';
import 'snake.dart';
import 'eats.dart';


Snake snake;
Eats eats;
final int SQUARE_SIZE = 10;

void main() {
  eats = new Eats();
  snake = new Snake()
    ..addListeners();
  new Timer.periodic(new Duration(seconds: 1), (Timer timer) {
    move(eats, snake);
    draw(eats, snake);
  });
}

void move(Eats eats, Snake snake) {
  if (snake.isOn)
}

void draw(Eats eats, Snake snake) {
  
}

int windowHeight() => (window.outerHeight / SQUARE_SIZE).floor() * SQUARE_SIZE;

int windowWidth() => (window.outerWidth / SQUARE_SIZE).floor() * SQUARE_SIZE;
