private double fractionLength = .8;
private int smallestBranch = 12;
private double branchAngle = 0.6;
public void setup()
{
  frameRate(60);
  size(640, 480);
  background(176, 224, 230);
  //  noLoop();
}
public void draw()
{
  strokeWeight(24);
  stroke(160, 82, 45);
  line(320, 480, 320, 380);
  drawBranches(320, 380, 100, 3*Math.PI/2);
  strokeWeight(1);
  fill(0);
  button1();
  rect(60, 20, 30, 20);
  fill(0);
  button2();
  rect(100, 20, 30, 20);
  fill(255, 255, 255);
  textSize(25);
  text("+", 70, 38);
  text("—", 103, 37);
  strokeWeight(24);
}

void button1() {
  if (mouseX>60 && mouseY>20 && mouseX<90 && mouseY<40 && mousePressed==true) {
    fill(255, 0, 0);
    rect(60, 20, 30, 20);
        branchAngle+=0.1;
    background(176, 224, 230);
  }
}

void button2() {
  if (mouseX>100 && mouseY>20 && mouseX<130 && mouseY<40 && mousePressed==true) {
    fill(0, 255, 0);
    rect(100, 20, 30, 20);
        branchAngle-=0.1;
    background(176, 224, 230);
  }
}
public void drawBranches(int x, int y, double branchLength, double angle)
{
  strokeWeight((float)branchLength/5);
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);

  if (branchLength >= smallestBranch) {
    stroke(76, 175, 80);
    stroke(160, 82, 45);
    strokeWeight(1);
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
  if (branchLength >= smallestBranch) {
    stroke(0);
    strokeWeight((float)branchLength/5);
    drawBranches(endX1, endY1, branchLength/3, angle1);
    drawBranches(endX2, endY2, branchLength/3, angle2);
  }
  if (branchLength >= smallestBranch) {
    stroke(160, 82, 45);
    strokeWeight((float)branchLength/5);
    drawBranches(endX1, endY1, branchLength/2, angle1);
    drawBranches(endX2, endY2, branchLength/2, angle2);
  }
  if (branchLength <= 40) {
    stroke(76, 175, 80);
    fill(51, 105, 30);
    rect(endX1, endY1, (float)branchLength/3, (float)branchLength/4);
    rect(endX2, endY2, (float)branchLength/4, (float)branchLength/3);
    stroke(160, 82, 45);
    strokeWeight((float)branchLength/5);
  }
  if (branchLength <= 20) {
    stroke(76, 175, 80);
    fill(51, 105, 30);
    rect(endX1, endY1, (float)branchLength/3, (float)branchLength/4);
    rect(endX2, endY2, (float)branchLength/4, (float)branchLength/3);
    stroke(160, 82, 45);
    strokeWeight((float)branchLength/5);
  }
  if (branchLength <= 10) {
    stroke(153, 51, 255);
    strokeWeight((float)branchLength/5);
    ellipse(endX1, endY1, 2, 2);
    ellipse(endX2, endY2, 2, 2);
  }
  if (branchLength <= 10) {
    stroke(255, 102, 178);
    strokeWeight((float)branchLength/5);
    ellipse(endX1, endY1, 1, 1);
    ellipse(endX2, endY2, 1, 1);
  }
}
