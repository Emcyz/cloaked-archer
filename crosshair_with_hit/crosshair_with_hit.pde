final float fireError = 10;

Crosshair cross = new Crosshair(0, 12, 1, 0);
Ball track = null;

void setup()
{
  size(600, 400);
}

final int AfterImageDelFreq = 20;
int TimeOutForDelAfterImage = -1;

void draw()
{
  background(180);

  if (mousePressed)
  {
    if (cross.fire())
    {
      float firedX = mouseX + random(-fireError, fireError);
      float firedY = mouseY + random(-fireError, fireError);
  
      if (track == null)
      {
        track = new Ball(firedX, firedY, 5, 25,
          0xffff0000, 0.75, 1);
      }
      else
      {
        if (!track.createAfterImage(firedX, firedY))
        {
          track.deleteAfterImage();
          track.createAfterImage(firedX, firedY);
        }
      }
      
      TimeOutForDelAfterImage = AfterImageDelFreq;
    }
  }
  else
  {
    cross.release();
  }
  
  if (TimeOutForDelAfterImage != -1)
  {
    TimeOutForDelAfterImage--;
    if (TimeOutForDelAfterImage == 0)
    {
      if (!track.deleteAfterImage())
      {
        track = null;
        TimeOutForDelAfterImage = -1;
      }
      else
      {
        TimeOutForDelAfterImage = AfterImageDelFreq;
      }
    }
  }

  stroke(0);
  cross.display();

  if (track != null)
  {
    noStroke();
    track.display();
  }
}

