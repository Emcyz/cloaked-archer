dut mydut1;
dut mydut2;

void setup()
{
  size(700,700);
  mydut1 = new dut(250,250,200,400,true);
  mydut2 = new dut(250,0,200,400,false);
}

int a = 0;

void draw()
{
  background(200);
  mydut1.display();
  mydut2.display();
  a++;
  
  if(a>10)
  {
    mydut1.time_expired();
    mydut2.time_expired();
    a=0;
  }
}

class dut
{
  boolean enabled;

  int xpos;
  int ypos;
  int wd;
  int hd;
  
  dut(int x,int y,int w,int h,boolean e)
  {
    enabled = e;
    xpos = x;
    ypos = y;
    wd = w;
    hd = h;
  }
  
  void display()
  {
    if(enabled)
    {
      fill(0);
      rect(xpos,ypos,wd,hd);
      rect(xpos-200, ypos+200, 3*wd,hd/2);
    }
  }
  
  void time_expired()
  {
    enabled = !enabled;
  }
}
