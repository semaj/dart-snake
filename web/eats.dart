library snake;
import 'dart:html';
import 'dart:math';
class Eats {
  int x;
  int y;
  
  Eats(int x, int y);
  
  void randomPosition() {
    Random r = new Random();
    x = r.nextInt(window.outerWidth);
    y = r.nextInt(window.outerHeight);
  }
}