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
      38: (bool ate) { move(0, SQUARE_SIZE, ate); }, 
      40: (bool ate) { move(0, -SQUARE_SIZE, ate); }, 
      37: (bool ate) { move(-SQUARE_SIZE, 0, ate); },
      39: (bool ate) { move(SQUARE_SIZE, 0, ate); }
    };
  }
  
  Function keyPressed(KeyboardEvent e) => nextMove = directions[e.keyCode];
  
  void move(int moreX, int moreY, bool ate) {
    links.insert(0, [addToX(moreX), addToY(moreY)]);
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
      document.body.append(new DivElement()
        ..attributes['left'] = "${link[0]}px"
        ..attributes['bottom'] = "${link[1]}px"
        ..attributes['color'] = "red"
      );
    }
  }
}
