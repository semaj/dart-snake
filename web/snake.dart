library snake;
import 'dart:html';
import 'dart_snake.dart';
import 'eats.dart';

class Snake {
  Map<int, Function> directions;
  Function nextMove;
  List<List<int>> links = [[100, 100]];
  
  Snake() {
    directions = {
      38: () { move(0, SQUARE_SIZE); }, 
      40: () { move(0, -SQUARE_SIZE); }, 
      37: () { move(-SQUARE_SIZE, 0); },
      39: () { move(SQUARE_SIZE, 0); }
    };
    nextMove = directions[40];
  }
  
  Function keyPressed(KeyboardEvent e) {
    if (directions.keys.contains(e.keyCode)) {
      nextMove = directions[e.keyCode];
    }
  }
  
  void move(int moreX, int moreY) => links.insert(0, [addToX(moreX), addToY(moreY)]);
  
  void doNextMove(bool ate) {
    nextMove();
    if (!ate) links.removeLast();
  }
  
  int headX() => links.first[0];
  int headY() => links.first[1];
  
  bool isOnEats(Eats eats) => headX() == eats.x && headY() == eats.y;
  
  int addToX(int more) => (headX() + more) % windowWidth();
  int addToY(int more) => (headY() + more) % windowHeight();
  
  void addListeners() {
    window.onKeyUp.listen((KeyboardEvent e) {
       keyPressed(e);
    });
  }
  
  void draw() {
    for (List<int> link in links) {
      document.body.children.add(new DivElement()
        ..className = 'snake'
        ..style.left = "${link[0]}px"
        ..style.bottom = "${link[1]}px"
      );
    }
  }
}
