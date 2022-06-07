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
  int contactIndex = 16;
  fBodyList = world.getBodies();
  for (int i = 0; i < fBodyList.size(); i++) {
    FBody fb = fBodyList.get(i);
    if (fb.getClass().equals(Ball) && !fb.getClass().equals(pb.getClass())) { // Checking to make sure we only deal with all balls except pb
      if (pb.isTouchingBody(fb));
      return 16;
    }
  }
  return contactIndex;
}
