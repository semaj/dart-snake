library snake;
import 'dart:html';
import 'dart_snake.dart';
class Snake {
  int x = 100;
  int y = 100;
  Element snake;
  List links = [];
  int length;
  var direction;
  
  Snake() {
    length = 1;
    snake = querySelector('#snake');
  }
  
  void keyPressed(KeyboardEvent e) {
    switch (e.keyCode) {
      case 38: direction = #up;
      break;
      case 40: direction = #down;
      break;
      case 37: direction = #left;
      break;
      case 39: direction = #right;
      break;
    }
  }
  
  int isOnEats(Eats eats) => this.x == eats.x && this.y == eats.y;
  
  int addToX(int more) => (this.x + more) % windowWidth();
  
  int addToY(int more) => (this.y + more) % windowHeight();
  
  void addListeners() {
    window.onKeyUp.listen((KeyboardEvent e) {
       keyPressed(e);
    });
  }
}
