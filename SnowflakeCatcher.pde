Snowflake snow[] = new Snowflake[100];
Bubble b[] = new Bubble[50];
int bubbleColor = color(0, 197, 255, 100);
boolean run = false;
void setup()
{
  //your code here
  size(500, 500);
  background(0);
}

void keyPressed()
{
  run = true;
  background(0);
  if (key == ' ')
  {  
    for (int i = 0; i < snow.length; i++)
    {
      snow[i] = new Snowflake();
    }
   for (int i = 0; i < b.length; i++)
    {
      b[i] = new Bubble();
    }
  }
}

void draw()
{
  //your code here
  if (run)
  {
  for (int i = 0; i < snow.length; i++)
  {
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();   
  }
  for (int i = 0; i < b.length; i++)
  {
    b[i].erase();
    b[i].stuck();
    b[i].move();
    b[i].wrap();
    b[i].show();
  }
}
}
void mouseDragged()
{
  //your code here
  strokeWeight(10);
  stroke(0, 0, 200);
  line(mouseX, mouseY, pmouseX, pmouseY);
  noStroke();
}

class Snowflake
{
  //class member variable declarations
  int myX, myY;
  boolean isMoving;
  Snowflake()
  {
    //class member variable initializations
    myX = (int)(Math.random()*501);
    myY = (int)(Math.random()*501);
    isMoving = true;
  }
  void show()
  {
    //your code here
    noStroke();
    fill(255);
    ellipse(myX, myY, 15, 15);
  }
  void lookDown()
  {
    //your code here
    int pixelBelow = get(myX, myY + 8);
    if (pixelBelow != color(0) && pixelBelow != color(255))
    {
      isMoving = false;
    }  
    else 
    {
      isMoving = true;
    }
  }
  void erase()
  {
    //your code here

    fill(0);
    ellipse(myX, myY, 17, 17);
  }
  void move()
  {
    //your code here
    if (isMoving)
      myY++;
  }
  void wrap()
  {
    //your code here
    if (myY == 492)
    {
      myY = 0;
      myX = (int)(Math.random()*501);
    }
  }
}

class Bubble
{
  int x, y;
  boolean isFloating;
  Bubble()
  {
    x = (int)(Math.random()*501);
    y = (int)(Math.random()*501);
    isFloating = true;    
  }
  void show()
  {
    noStroke();
    fill(bubbleColor);
    ellipse(x, y, 15, 15);
  }
  void move()
  {
    if (isFloating)
    {
      y--;
    }
  }
  void stuck()
  {
    int pixelAbove = get(x, y - 9);
    if (pixelAbove != bubbleColor && pixelAbove != color(0) && pixelAbove != color(255))
    {
      isFloating = false;
    }
    else 
    {
      isFloating = true;
    }
  }
  void wrap()
  {
    // reset function
    if (y == 9)
    {
      y = 500;
      x = (int)(Math.random()*501);
    }
  }
  void erase()
  {
    fill(0);
    ellipse(x, y, 17, 17);
  }
}

