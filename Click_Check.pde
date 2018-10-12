class LED
{
  int x, y, r; 
  int red, green, blue;
  char col;
  boolean state;
  
  LED (int x_cor, int y_cor, int radius, char colour_of_led, boolean state_of_led)
  {
    state = state_of_led;
    x = x_cor;
    y = y_cor;
    r = radius;
    col = colour_of_led;
    if (state == false)
    {
      red = 182;
      green = 173;
      blue = 173;
    }
    else
    {
      if (col == 'g')
      {
        red = 0;
        green = 255;
        blue = 0;
      }
      else if (col == 'r')
      {
        red = 255;
        green = 0;
        blue = 0;
      }
      else if (col == 'y')
      {
        red = 255;
        green = 215;
        blue = 0;
      }
    }
  }
  
  void place()
  {
    noStroke();
    updateColor(state);
    fill(red,green,blue);
    ellipse(x,y,r,r);
  }
  
  void updateColor(boolean state_now)
  {
    if (state_now == false)
    {
      red = 182;
      green = 173;
      blue = 173;
    }
    else
    {
      if (col == 'g')
      {
        red = 0;
        green = 255;
        blue = 0;
      }
      else if (col == 'r')
      {
        red = 255;
        green = 0;
        blue = 0;
      }
      else if (col == 'y')
      {
        red = 255;
        green = 215;
        blue = 0;
      }
    }
  }  
  
  boolean presentState()
  {
    return state;
  }
  
  void newState(boolean a)
  {
    state = a;
  }
  
  int x_coordinate()
  {
    return x;
  }
  
  int y_coordinate()
  {
    return y;
  }
  
  void click(int x1, int y1)
  {
    if (dist(float(x1), float(y1), float(x), float(y)) < float(r)/2)
    {
      if (state == true)
      {
        state = false;
        red = 182;
        green = 173;
        blue = 173;
      }
      else if (state == false)
      {
        state = true;
        if (col == 'g')
        {
          red = 0;
          green = 255;
          blue = 0;
        }
        else if (col == 'r')
        {
          red = 255;
          green = 0;
          blue = 0;
        }
        else if (col == 'y')
        {
          red = 255;
          green = 215;
          blue = 0;
        }
      }
    }
  }
}

class Button
{
  int xpos, ypos, wid, hei;
  String label;
  boolean over = false, down = false, clicked = false;
  Button(int tx, int ty, int tw, int th, String tlabel)
  {
    xpos = tx;
    ypos = ty;
    wid = tw;
    hei = th;
    label = tlabel;
  }
  
  void update()
  {
    if(down && over && !mousePressed)
    {
      clicked=true;
    }
    else
    {
      clicked=false;
    }
    
    if(mouseX>xpos&&mouseY>ypos&&mouseX<xpos+wid&&mouseY<ypos+hei)
    {    
      over=true; 
      if(mousePressed)
      {
        down=true;
      }
      else
      {
        down=false;
      }
    }
    else
    { 
      over=false; 
    } 
    
    if(!over)
    {
      fill(255);
    }
    else
    {
      if(!down)
      {
        fill(100);
      }
      else
      {
        fill(0);
      }
    }
    
    stroke(0);
    rect(xpos, ypos, wid, hei, 10);//draws the rectangle, the last param is the round corners
    if(down)
    {
      fill(255);
    }
    else
    {    
      fill(0);
    }
    
    textSize(24); 
    text(label, xpos+wid/2-(textWidth(label)/2), ypos+hei/2+(textAscent()/2)); 
    //all of this just centers the text in the box
  } 
}

ArrayList leds;
//int similar[] = {1,2,3,4,5,8,9,8,9,10,11,12,13,14,17,18,15,16,19,20,21,22,23,26,27,24,25,28,29,30,31,32,35,36,33,34};
boolean port_A[] = {false,false,false,false,false,false,false,false};
boolean port_B[] = {false,false,false,false,false,false,false,false};
boolean port_C[] = {false,false,false,false,false,false,false,false};
Button b;
int A_out, B_out, C_out;
String A_hex, B_hex, C_hex;

void setup()
{
  size(1500,1000);
  background(0);
  
  //Side Panel
  noStroke();
  fill(100,100,100);
  rect(1000,0,500,1000);
  
  //Roads
  noStroke();
  fill(255,255,255);
  rect(0,400,1000,200);
  rect(400,0,200,1000);
  
  leds = new ArrayList();
  
  leds.add(new LED(315,630,50,'r',false));  //L1
  leds.add(new LED(315,685,50,'y',false));  //L2
  leds.add(new LED(260,740,50,'g',true));   //L3
  leds.add(new LED(315,740,50,'g',true));   //L4
  leds.add(new LED(370,740,50,'g',false));  //L5
  
  leds.add(new LED(370,875,50,'r',false));  //L6
  leds.add(new LED(370,930,50,'g',true));   //L7
  leds.add(new LED(630,875,50,'r',false));  //L8
  leds.add(new LED(630,930,50,'g',true));   //L9
  
  
  leds.add(new LED(630,685,50,'r',false));  //L10
  leds.add(new LED(685,685,50,'y',true));   //L11
  leds.add(new LED(740,740,50,'g',true));   //L12
  leds.add(new LED(740,685,50,'g',false));  //L13
  leds.add(new LED(740,630,50,'g',true));   //L14
  
  leds.add(new LED(875,630,50,'r',false));  //L15
  leds.add(new LED(930,630,50,'g',true));   //L16
  leds.add(new LED(875,370,50,'r',false));  //L17
  leds.add(new LED(930,370,50,'g',true));   //L18
  
  
  leds.add(new LED(685,370,50,'r',true));   //L19
  leds.add(new LED(685,315,50,'y',true));   //L20
  leds.add(new LED(630,260,50,'g',false));  //L21
  leds.add(new LED(685,260,50,'g',true));   //L22
  leds.add(new LED(740,260,50,'g',false));  //L23
  
  leds.add(new LED(630,125,50,'r',false));  //L24
  leds.add(new LED(630,70,50,'g',true));    //L25
  leds.add(new LED(370,125,50,'r',false));  //L26
  leds.add(new LED(370,70,50,'g',true));    //L27

  
  leds.add(new LED(370,315,50,'r',false));  //L28
  leds.add(new LED(315,315,50,'y',true));   //L29
  leds.add(new LED(260,370,50,'g',true));   //L30
  leds.add(new LED(260,315,50,'g',false));  //L31
  leds.add(new LED(260,260,50,'g',true));   //L32
  
  leds.add(new LED(125,370,50,'r',false));  //L33
  leds.add(new LED(70,370,50,'g',true));    //L34
  leds.add(new LED(125,630,50,'r',false));  //L35
  leds.add(new LED(70,630,50,'g',true));    //L36 
  
  println(leds.size());
  b = new Button(1185,800,125,100,"Generate");
}

void draw()
{
  for (int i = leds.size()-1; i >= 0; i--)
  {
    LED an_led = (LED) leds.get(i);
    an_led.place();
  }
  b.update();
  if (b.clicked)
  {
    noStroke();
    fill(100,100,100);
    rect(1000,0,500,1000);
    get_hex();
  }
  
  //change();
}

void mouseReleased()
{
  for (int i = leds.size()-1; i >= 0; i--)
  {
    LED an_led = (LED) leds.get(i);
    an_led.click(mouseX, mouseY);
    //println(an_led.x_coordinate(), an_led.y_coordinate());
  }
}

void get_hex()
{
   update_port();
   
   A_out = bool_to_hex(port_A);
   B_out = bool_to_hex(port_B);
   C_out = bool_to_hex(port_C);
   
   A_hex = String.format("%02X", A_out);
   B_hex = String.format("%02X", B_out);
   C_hex = String.format("%02X", C_out);
   println(A_hex, B_hex, C_hex);
   
   fill(255);
   text("Port A : "+A_hex+"h", 1175, 200);
   text("Port B : "+B_hex+"h", 1175, 400);
   text("Port C : "+C_hex+"h", 1175, 600);
   //printArray(port_A);
   //printArray(port_B);
   //printArray(port_C);
}

void update_port()
{
  LED led01 = (LED) leds.get(0);
  LED led02 = (LED) leds.get(1);
  LED led03 = (LED) leds.get(2);
  LED led04 = (LED) leds.get(3);
  LED led05 = (LED) leds.get(4);
  LED led06 = (LED) leds.get(5);
  LED led07 = (LED) leds.get(6);
  LED led08 = (LED) leds.get(7);
  LED led09 = (LED) leds.get(8);
  LED led10 = (LED) leds.get(9);
  LED led11 = (LED) leds.get(10);
  LED led12 = (LED) leds.get(11);
  LED led13 = (LED) leds.get(12);
  LED led14 = (LED) leds.get(13);
  LED led15 = (LED) leds.get(14);
  LED led16 = (LED) leds.get(15);
  LED led17 = (LED) leds.get(16);
  LED led18 = (LED) leds.get(17);
  LED led19 = (LED) leds.get(18);
  LED led20 = (LED) leds.get(19);
  LED led21 = (LED) leds.get(20);
  LED led22 = (LED) leds.get(21);
  LED led23 = (LED) leds.get(22);
  LED led24 = (LED) leds.get(23);
  LED led25 = (LED) leds.get(24);
  LED led26 = (LED) leds.get(25);
  LED led27 = (LED) leds.get(26);
  LED led28 = (LED) leds.get(27);
  LED led29 = (LED) leds.get(28);
  LED led30 = (LED) leds.get(29);
  LED led31 = (LED) leds.get(30);
  LED led32 = (LED) leds.get(31);
  LED led33 = (LED) leds.get(32);
  LED led34 = (LED) leds.get(33);
  LED led35 = (LED) leds.get(34);
  LED led36 = (LED) leds.get(35);
  
  port_A[0] = led02.presentState();
  port_A[1] = led03.presentState();
  port_A[2] = led04.presentState();
  port_A[3] = led05.presentState();
  port_A[4] = led11.presentState();
  port_A[5] = led12.presentState();
  port_A[6] = led13.presentState();
  port_A[7] = led14.presentState();
  
  port_B[0] = led20.presentState();
  port_B[1] = led21.presentState();
  port_B[2] = led22.presentState();
  port_B[3] = led23.presentState();
  port_B[4] = led29.presentState();
  port_B[5] = led30.presentState();
  port_B[6] = led31.presentState();
  port_B[7] = led32.presentState();
  
  port_C[0] = !led01.presentState();
  port_C[1] = !led19.presentState();
  port_C[2] = led10.presentState();
  port_C[3] = led28.presentState();
  port_C[4] = !led06.presentState();
  port_C[5] = !led15.presentState();
  port_C[6] = !led24.presentState();
  port_C[7] = !led33.presentState();
}

int bool_to_hex(boolean a[])
{
  int n = 0, l = a.length;
  for (int i = l-1; i >= 0; i--) 
  {
    n = (n << 1) + int(a[i] ? true : false);
  }
  return n;
}
/*
void change()
{
  LED led33 = (LED) leds.get(32);
  LED led34 = (LED) leds.get(33);
  LED led35 = (LED) leds.get(34);
  LED led36 = (LED) leds.get(35);
  
  //println(led33.presentState(), led34.presentState());
  //led34.newState(led36.presentState());
  //led36.newState(led34.presentState());
  //led35.newState(led33.presentState());
  //led35.newState(led33.presentState());
  
  //led34.newState(!led33.presentState());
  //led33.newState(!led34.presentState());
  //led35.newState(!led36.presentState());
  //led36.newState(!led35.presentState());
}  
*/
