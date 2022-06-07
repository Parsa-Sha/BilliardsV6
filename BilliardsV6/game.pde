// Collision
// Ball enters holes
// Scratch
// All rules

boolean velcel = true; // Forgot what this does, update this if you remember.
int firstContact = 16; // Checks which ball is currently 
boolean turn; // False is first player, true is second player.
boolean solidStripe; // True is first player solid, second player stripe. False is reverse.
boolean[] allBallsBut8 = new boolean[2]; // True checks if player has all balls in except 8, index 0 = player 1
boolean anotherTurn; // Check if any of the player's balls have been pocketed.

void game() {
  background(200);
  image(table, width/2-table.width/2, height-240-table.height/2);

  world.step();
  world.draw();
  calmVel();
  
  
  //println(firstContact());
  
  /*
  rect(85, 95, 370, 10); // Testing locations of all walls and holes
  rect(505, 95, 370, 10);
  rect(85, 495, 370, 10);
  rect(505, 495, 370, 10);
  rect(40, 135, 10, 325);
  rect(910, 135, 10, 325);
  ellipse(60, 115, 26, 26);

  noStroke();
  circle(45, 97, 28*2);
  circle(45, 503, 28*2);
  circle(915, 97, 28*2);
  circle(915, 503, 28*2);
  circle(480, 78, 28*2);
  circle(480, 521, 28*2);
  */

  for (int i = 1; i < myBalls.length; i++) {
    if (myBalls[i] != null){
    // Need to somehow set FWorld balls to ArrayList balls
    FBody b1 = world.getBody(myBalls[i].pos.x, myBalls[i].pos.y);
    if (pb.isTouchingBody(b1)) {
      firstContact = i;
      break;
    }
  }
  }

  int gameWon = 0;
  for (int i = 0; i < myBalls.length; i++) {
    Ball b = myBalls[i];
    if ( b != null && 
      (dist(b.getX(), b.getY(), 45, 97) < 28 ||
      dist(b.getX(), b.getY(), 45, 503) < 28 ||
      dist(b.getX(), b.getY(), 915, 97) < 28 ||
      dist(b.getX(), b.getY(), 915, 503) < 28 ||
      dist(b.getX(), b.getY(), 480, 78) < 28 ||
      dist(b.getX(), b.getY(), 480, 521) < 28) 
      ) {
      if (checkVelRest() < 1 && (i == 0 || i == 8)) mode = GAMEOVER;
      world.remove(b);
      myBalls[i] = null;
    }
    gameWon += i;
  }

  if (gameWon == 0 || keyPressed && key=='5') mode = GAMEWON;

  switch(gameState) { // Potential for V4 with proper game rules, two player, and proper velocity input
  case PLAYERBEGIN:
    playerBegin();
    break;
  case PLAYERPLACE:
    playerPlace();
    break;
  case PLAYERSHOOT:
    playerShoot();
    break;
  default:
    println("GAMESTATE ERROR. ERROR = " + gameState);
  }
}
