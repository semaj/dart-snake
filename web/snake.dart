library snake;
import 'dart:html';
import 'dart_snake.dart';
import 'eats.dart';

class Snake {
  Map<int, Function> directions;
  Function nextMove;
  List<List<int>> links = [[330, 330]];

  Snake() {
    directions = {
      38: () {
        move(0, SQUARE_SIZE);
      },
      40: () {
        move(0, -SQUARE_SIZE);
      },
      37: () {
        move(-SQUARE_SIZE, 0);
      },
      39: () {
        move(SQUARE_SIZE, 0);
      }
    };
    nextMove = directions[40];
  }

  void move(int moreX, int moreY) => links.insert(0, [addToX(moreX), addToY(moreY)]);

  int headX() => links.first[0];
  int headY() => links.first[1];

  bool isOnEats(Eats eats) => headX() == eats.x && headY() == eats.y;
  bool isDead() => links.skip(1).any((e) => (e[0] == headX() && e[1] == headY()));

  int addToX(int more) => (headX() + more) % windowWidth();
  int addToY(int more) => (headY() + more) % windowHeight();

  void keyPressed(KeyboardEvent e) {
    if (directions.keys.contains(e.keyCode)) {
      nextMove = directions[e.keyCode];
    }
  }

  void doNextMove(bool ate) {
    nextMove();
    if (!ate) links.removeLast();
  }

  void addListeners() {
    window.onKeyUp.listen((KeyboardEvent e) {
      keyPressed(e);
    });
  }

  void draw() {
    for (List<int> link in links) {
      querySelector('#board').children.add(new DivElement()
          ..className = 'snake'
          ..style.left = "${link[0]}px"
          ..style.bottom = "${link[1]}px");
    }
  }
}
