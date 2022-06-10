int hover = 1;

void intro() {
  background(255);
  hover = 1;
  
  if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height/2 + 100 && mouseY < height/2 + 200) {
    if (mousePressed) mode = GAME;
    hover = 5;
  }
  
  if (newGame) newGame();
  
  fill(0);
  stroke(0);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("BILLIARDS V1", width/2, 200);
  textSize(10);
  text("We didn't have the funding for a front-end programmer", width/2, 300);
  strokeWeight(hover);
  fill(255);
  rect(width/2-100, height/2 + 100, 200, 100);
}
