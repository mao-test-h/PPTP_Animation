// 肌の色
color SkinColor = color(255, 222, 205);

// アウトラインの太さ
int StrokeWeight = 3;

Object[] objects = new Object[64];
Rainbow rainbow;


// ===========================================================
// Functions

void setup()
{
  size(640, 360);
  for(int i = 0; i < objects.length; ++i)
  {
    objects[i] = new Object(new PVector(random(width), random(height)));
  }
  rainbow = new Rainbow();
}

void draw()
{
  rainbow.update();
  background(rainbow.getColor());

  for(int i = 0; i < objects.length; ++i)
  {
    for(int j = 0; j < objects.length; ++j)
    {
      if(i == j) { continue; }
      PVector force = objects[j].attract(objects[i]);
      objects[i].applyForce(force);
    }
    objects[i].update();
    objects[i].display();
  }
}