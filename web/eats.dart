library eats;
import 'dart:html';
import 'dart:math';
class Eats {
  int x;
  int y;
  
  Eats([int x = 100, int y = 100]);
  
  void randomPosition() {
    Random r = new Random();
    x = r.nextInt(window.outerWidth);
    y = r.nextInt(window.outerHeight);
  }
}