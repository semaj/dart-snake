import 'dart:html';
import 'dart:async';
import 'snake.dart';
import 'eats.dart';

final int SQUARE_SIZE = 30;

void main() {
  Eats eats = new Eats();
  Snake snake = new Snake()..addListeners();
  new Timer.periodic(new Duration(milliseconds: 60), (Timer timer) {
    move(eats, snake);
    draw(eats, snake);
    if (snake.isDead()) timer.cancel();
  });
}

void move(Eats eats, Snake snake) {
  if (snake.isOnEats(eats)) {
    eats.randomPosition();
    snake.doNextMove(true);
  } else {
    snake.doNextMove(false);
  }
}

void draw(Eats eats, Snake snake) {
  querySelector('#board').children.clear();
  snake.draw();
  eats.draw();
}

int windowHeight() => (window.innerHeight / SQUARE_SIZE).floor() * SQUARE_SIZE;

int windowWidth() => (window.innerWidth / SQUARE_SIZE).floor() * SQUARE_SIZE;
