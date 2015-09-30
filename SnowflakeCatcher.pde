Snowflake [] Flake;
void setup()
{
  //your code here
  frameRate(60);
  size(400, 400);
  Flake = new Snowflake[500];
  for(int i =0; i < Flake.length; i++)
    Flake[i] = new Snowflake();
  background(0);
}
void draw()
{
  //your code here
  for(int i = 0; i < Flake.length; i++)
  {
    Flake[i].erase();
    Flake[i].lookDown();
    Flake[i].move();
    Flake[i].wrap();
    Flake[i].show();
  }
  fill(0, 0, 0);
  rect(0, 399, 400, 25);
}
void mouseDragged()
{
  //your code here
  if(mousePressed == true)
  {
    fill(mouseX/(400/255), mouseY/(400/255), 0);
    noStroke();
    ellipse(mouseX, mouseY, 10, 10);
  }
}

class Snowflake
{
  //class member variable declarations
  int myX, myY;
  boolean isMoving;
  Snowflake()
  {
    //class member variable initializations
    myX = (int)(Math.random()*399)+1;
    myY = (int)(Math.random()*399)+1;
    isMoving = true;
  }
  void show()
  {
    //your code here
    fill(255);
    stroke(0);
    ellipse(myX, myY, 5, 5);
  }
  void lookDown()
  {
    //your code here
    if(myY > -10 && myY < 410 && get(myX, myY+5) != color(0, 0, 0))
      isMoving = false;
    else
      isMoving = true;
  }
  void erase()
  {
    //your code here
    fill(0);
    ellipse(myX, myY, 7, 7);
  }
  void move()
  {
    //your code here
    if(isMoving == true)
      myY += 1;
  }
  void wrap()
  {
    //your code here
    if(myY > 390)
    {
      myY = 10;
      myX = (int)(Math.random()*399)+1;
    }
  }
}


