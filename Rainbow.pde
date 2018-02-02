class Rainbow
{
  // noise関連の設定値
  float noiseIncreaseLow = 0.01;
  float noiseIncreaseHigh = 0.05;
  int initHigh = 10;

  int r, g, b;
  float rNoise, gNoise, bNoise;
  float rNoiseIncrease, gNoiseIncrease, bNoiseIncrease;


  // ===========================================================
  // Functions
  
  Rainbow()
  {
    rNoise = random(0, initHigh);
    gNoise = random(0, initHigh);
    bNoise = random(0, initHigh);
    rNoiseIncrease = random(noiseIncreaseLow, noiseIncreaseHigh);
    gNoiseIncrease = random(noiseIncreaseLow, noiseIncreaseHigh);
    bNoiseIncrease = random(noiseIncreaseLow, noiseIncreaseHigh);
  }
  
  void update()
  {
    rNoise += rNoiseIncrease;
    gNoise += gNoiseIncrease;
    bNoise += bNoiseIncrease;
    r = (int)(noise(rNoise) * 255);
    g = (int)(noise(gNoise) * 255);
    b = (int)(noise(bNoise) * 255);
  }
  
  color getColor()
  {
    return color(r, g, b);
  }
}