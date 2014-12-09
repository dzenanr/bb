import 'dart:html';

import 'package:bb/balls.dart';

main() {
  CanvasElement canvas = document.querySelector('#canvas');
  CanvasRenderingContext2D context = canvas.getContext('2d');
  var width = canvas.width;
  var height = canvas.height;
  var balls = new List(Circle.BALL_COUNT);
  for (var i = 0; i < Circle.BALL_COUNT; i++) {
    var ball = new Circle(width/2, height/2,
        randomDouble((Circle.BALL_COUNT * 2).toDouble()));
    balls[i] = ball;
    document.onKeyDown.listen(ball.onKeyDown);
  }

  gameLoop(num delta) {
    draw(context, balls);
    window.animationFrame.then(gameLoop);
  }

  // redraw
  window.animationFrame.then(gameLoop);
}


