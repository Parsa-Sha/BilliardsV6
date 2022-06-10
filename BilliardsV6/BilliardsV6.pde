// BilliardsV4 
// Introduction to Fisica, using basic ball and box collisions

// Next time use mode framework to sort out different variables.

// Next version:
//   Include scratch
//   

// To do:
//   Fix velocity code
//   Add two players & solids/stripes teams
//   Add scratch
//   Edit it so that cue ball does not get deleted, only becomes scratch
//   Add rules:
//     8 ball in pocket is loss, unless all of that team's balls are gone
//     Cueball must collide with ball of own team, or else scratch

// Bug fixes:
//   Fix garbage holes [DONE]
//   Fix newgame to reset ball positions [DONE]
//   Fix phisics (Make balls move properly and not slide)
//   Fix gameover not happening when ball is pocketed
//   Fix firstContact function in FWorldLoopCommands

import fisica.*;

FWorld world;

// Changing ArrayList into Array to keep indexes consistent
Ball[] myBalls;
Ball objectBall = null;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEWON = 3;
final int GAMEOVER = 4;
int mode = INTRO;

final int PLAYERBEGIN = 0;
final int PLAYERPLACE = 1;
final int PLAYERSHOOT = 2;
int gameState = PLAYERSHOOT;

int[] ballArrangement = new int[15];

boolean newGame = true;

PImage table;
PImage stick;
PImage[] ballImages = new PImage[16];

PlayerBall pb = null;

void setup() {
  size(960, 540);
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 0);
  frameRate(30);
  
  table = loadImage("images\\EightBallTable.png");
  stick = loadImage("images\\poolStick.png");
  ballImages[0] = loadImage("balls\\cueball.png");
  ballImages[1] = loadImage("balls\\1ball.png");
  ballImages[2] = loadImage("balls\\2ball.png");
  ballImages[3] = loadImage("balls\\3ball.png");
  ballImages[4] = loadImage("balls\\4ball.png");
  ballImages[5] = loadImage("balls\\5ball.png");
  ballImages[6] = loadImage("balls\\6ball.png");
  ballImages[7] = loadImage("balls\\7ball.png");
  ballImages[8] = loadImage("balls\\8ball.png");
  ballImages[9] = loadImage("balls\\9ball.png");
  ballImages[10] = loadImage("balls\\10ball.png");
  ballImages[11] = loadImage("balls\\11ball.png");
  ballImages[12] = loadImage("balls\\12ball.png");
  ballImages[13] = loadImage("balls\\13ball.png");
  ballImages[14] = loadImage("balls\\14ball.png");
  ballImages[15] = loadImage("balls\\15ball.png");
  
  myBalls = new Ball[16];
}

void draw() {
  switch (mode) {
  case INTRO:
    intro();
    break;
  case GAME:
    game();
    break;
  case PAUSE:
    pause();
    break;
  case GAMEWON:
    gamewon();
    break;
  case GAMEOVER:
    gameover();
    break;
  default:
    println("MODE ERROR. MODE = " + mode);
  }
}
