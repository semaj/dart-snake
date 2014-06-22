import 'dart:html';

void main() {
  window.onKeyUp.listen((KeyboardEvent e) {
    print("pressed ${e.keyCode}");
  });
}