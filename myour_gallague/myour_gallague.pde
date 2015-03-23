final int unitSize = 10;

final int enemyXCount = 10;
final int enemyYCount = 5;

int player_x = 20;

int enemy_x = 1, enemy_y = 1;
int enemyDirection = 1;

boolean[] isEnemyAlive = new boolean[enemyXCount * enemyYCount];
int score = 0;

final int maxBullet = 4;
int[] bullet_x = new int[maxBullet];
int[] bullet_y = new int[maxBullet];

boolean bEnded = false;

void setup()
{
  size(350, 225);
  
  for(int i = 0; i < maxBullet; i++)
  {
    bullet_x[i] = -1;
  }
  
  initEnemy();
  
  rectMode(CORNER);
  ellipseMode(CORNER);
}

float prevBulletMoveTime = 0;
float prevMoveTime = 0;
float prevActionTime = 0;
void draw()
{
  background(255);
  
  fill(0,64,255);
  rect(player_x*unitSize, height-unitSize, unitSize, unitSize);
  
  for(int x = 0; x < enemyXCount; x++)
  {
    for(int y = 0; y < enemyYCount; y++)
    {
      if(isEnemyAlive[enemyXCount * y + x])
      {
        fill(255, 0, 128);
        rect((enemy_x + 2 * x) * unitSize,
        (enemy_y + 2 * y) * unitSize, unitSize, unitSize);
      }
    }
  }
  
  for(int i = 0; i < maxBullet; i++)
  {
    if(bullet_x[i] != -1)
    {
      fill(64, 255, 11);
      ellipse(bullet_x[i] * unitSize, bullet_y[i] * unitSize, unitSize/2, unitSize/2);
    }
  }
  
  if(!bEnded)
  {
    float ms_time =frameCount * 1000/frameRate;
    
    if(ms_time - prevBulletMoveTime >= 125)
    {
      prevBulletMoveTime = ms_time;
      
      for(int i = 0; i < maxBullet; i++)
      {
        if(bullet_x[i] != -1)
        {
          bullet_y[i]--;
          if(bullet_y[i] < 0)
          {
            bullet_x[i] = -1;
          }
          
          int ex = bullet_x[i] - enemy_x;
          int ey = bullet_y[i] - enemy_y;
          
           if (ex >= 0 && ex < enemyXCount * 2 && ex % 2 == 0 && ey >= 0 && ey < enemyYCount * 2 && ey % 2 == 0)
           {
              int tx = ex / 2, ty = ey / 2;
              if (isEnemyAlive[enemyXCount * ty + tx])
              {
                 isEnemyAlive[enemyXCount * ty + tx] = false;
                 bullet_x[i] = -1;
                 score++;
                 println("!! hit !! [score: " + score + "]");
                 
                 if (score == 50)
                 {
                   print(">> you win <<");
                    bEnded = true;
                 }
              }
           }
        }
      }
    }
     if (ms_time - prevMoveTime >= 1000)
     {
       prevMoveTime = ms_time;
     
       enemy_x += enemyDirection;
       if (enemy_x < 0 || (enemy_x + enemyXCount * 2) * unitSize > width)
       {
         enemy_x -= enemyDirection;
         enemy_y += 1;
         enemyDirection *= -1;
       
         if ((enemy_y + enemyYCount * 2) * unitSize > height - unitSize)
         {
            println(">>> you lose <<<");
            bEnded = true;
         }
       }
     }
     if (ms_time - prevActionTime >= 375 && keyPressed)
     {
       if (key == 'a')
       {
         prevActionTime = ms_time;
         if (player_x != 0)
         {
           player_x--;
         }
       }
       else if (key == 'd')
       {
         prevActionTime = ms_time;
         if (player_x != width / unitSize)
         {
           player_x++;
         }
       }
       else if (key == ' ')
       {
         prevActionTime = ms_time;
         
         int i;
         for(i = 0; i < maxBullet; i++)
         {
           if (bullet_x[i] == -1)
           {
             bullet_x[i] = player_x;
             bullet_y[i] = (height / unitSize) - 1;
             break;
           }
         }
         if(i == maxBullet)
         {
           println("bullet loading...");
         }
       }
     }
  }
}

void initEnemy()
{
  for(int i = 0; i < enemyXCount * enemyYCount; i++)
  {
    isEnemyAlive[i] = true;
  }
}
