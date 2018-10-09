float T = 100;
int X = 1500, Y = 750; 
color col_red = color(255,0,0);
color col_blue = color(0,0,255);
String temp;

void setup()
{
  size(1500,1000);  
}

void draw()
{
  background(175);
  String[] lines = loadStrings("textme.txt");
  println("there are " + lines.length + " lines");

  for(int i = 0 ; i < lines.length; i++) 
  {
    println(lines[i]);
  }
  
  int b = X/lines.length;
  for(int i=0; i < lines.length; i++)
  {
    float rat = float(lines[i])/T;
    color col = lerpColor(col_blue, col_red, rat);
    int len = int(rat*Y);
    
    noStroke();
    fill(col);
    rect(i*b, Y-len, b, len);
    
    temp = String.format("%.1f", float(lines[i]));
    textSize(30);
    textAlign(CENTER);
    noStroke();
    fill(col);
    text(temp, (i*b)+b/2, (Y-10)-len);
    
    textSize(30);
    textAlign(CENTER);
    noStroke();
    fill(0);
    text(String.format("%d", lines.length - i), (i*b)+b/2, (Y+50));
    
    textSize(30);
    textAlign(CENTER);
    noStroke();
    fill(0);
    text("Time before this instant (minutes)", X/2, Y+100);
    
    textSize(40);
    textAlign(CENTER);
    noStroke();
    fill(0,127,0);
    text("Welcome to PPC's Real-Time Temperature Gallery", X/2, Y+165);
    
    textSize(30);
    textAlign(CENTER);
    noStroke();
    fill(0,100,100);
    text("Temperature in degree Celsius", X/2, Y+225);
  }
}
