import 'dart:html';
import 'dart:async';
import 'snake.dart';
import 'eats.dart';

final int SQUARE_SIZE = 10;

void main() {
  Eats eats = new Eats();
  Snake snake = new Snake()
    ..addListeners();
  new Timer.periodic(new Duration(seconds: 1), (Timer timer) {
    print('hi');
    move(eats, snake);
    draw(eats, snake);
  });
}

void move(Eats eats, Snake snake) {
  if (snake.isOnEats(eats)) {
    eats.randomPosition();
    snake.nextMove(true);
  } else {
    snake.nextMove(false);
  }
}

void draw(Eats eats, Snake snake) {
  snake.draw();
  eats.draw();
}

int windowHeight() => (window.outerHeight / SQUARE_SIZE).floor() * SQUARE_SIZE;

int windowWidth() => (window.outerWidth / SQUARE_SIZE).floor() * SQUARE_SIZE;
