ArrayList<FBody> fBodyList;
float totalVelocity = 0;

float checkVelRest() {
  totalVelocity = 0;
  fBodyList = world.getBodies();
  for (int i = 0; i < fBodyList.size(); i++) {
    FBody fb = fBodyList.get(i);
    totalVelocity += abs(fb.getVelocityX()) + abs(fb.getVelocityY());
  }
  return totalVelocity;
}


void calmVel() {
  fBodyList = world.getBodies();
  for (int i = 0; i < fBodyList.size(); i++) {
    FBody fb = fBodyList.get(i);
    fb.setVelocity(fb.getVelocityX() * 0.98, fb.getVelocityY() * 0.98);
  }
}

int firstContact() {
  fBodyList = world.getBodies();
  contactMade = false;
  int returning = 0;
  for (int i = 0; i < fBodyList.size(); i++) {
    FBody fb = fBodyList.get(i);
    if (fb instanceof Ball && !(fb instanceof PlayerBall)) { // Checking to make sure we only deal with all balls except pb
      if (pb.isTouchingBody(fb)){
        for (int j = 1; j < myBalls.length; j++) { // Compare all balls with the one touching playerball
          if (fb.equals(myBalls[j])) {
            returning = myBalls[j].id; // Return id of ball that was hit
            contactMade = true;
          }
        }
      }
    }
  }
  // ^^^ This code is before turn is over, pb is still in motion
  
  
  // This code if after turn is over, checkVelRest() < 1
  /*
  if (checkVelRest() < 1) { 
    if (contactMade) { // First check if playerball hit any ball, if so return as normal
      println(returning);
      contactMade = false;
      returning = 16;
      return returning;
    } else { // Help me here please
      returning = 16;
      return returning;
    }
  }
  */
  
  
  
  println(contactMade);
  return 0;
}
