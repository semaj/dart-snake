library snake;
import 'dart:html';
class Snake {
  int x = 100;
  int y = 100;
  Element snake;
  int length;
  var direction;
  
  Snake() {
    length = 1;
    snake = querySelector('#snake');
  }
  
  void keyPressed(KeyboardEvent e) {
    if (e.keyCode == 38) { // up
      direction = #up;
    } else if (e.keyCode == 40) { // down
      direction = #down;
    } else if (e.keyCode == 37) { // left
      direction = #left;
    } else if (e.keyCode == 39) { // right
      direction = #right;
    }
  }
  
  int addToX(int more) => this.x = (this.x + more) % window.outerWidth;
  
  int addToY(int more) => this.y = (this.y + more) % window.outerHeight;
  
  void addListeners() {
    window.onKeyUp.listen((KeyboardEvent e) {
       keyPressed(e);
    });
  }
}