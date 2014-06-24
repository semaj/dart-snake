library eats;
import 'dart:html';
import 'dart:math';
import 'dart_snake.dart';
class Eats {
  int x;
  int y;
  
  Eats([int x = 200, int y = 200]);
  
  void randomPosition() {
    Random r = new Random();
    x = r.nextInt(windowWidth());
    y = r.nextInt(windowHeight());
  }
  
  void draw() {
    print('blah etas');
    document.body.text = 'SUP';
    document.body.children.add(new DivElement()
      ..className = 'eats'
      ..style.left = "1000px"
      ..style.bottom = "${y}px"
    );
    
  }
}