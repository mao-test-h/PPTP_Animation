class Object
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  IDisplayable displayObject;


  // ===========================================================
  // Functions
  
  Object(PVector location_)
  {
    location = location_.get();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    // 質量と表示キャラはランダムで決定
    mass = random(0.1, 2);
    PVector scale_ = new PVector(0.1, 0.1);
    displayObject = (random(1) >= 0.5) ? new Popuko(location, scale_) : new Pipimi(location, scale_);
  }

  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display()
  {
    displayObject.display(location);
  } 

  void applyForce(PVector force)
  {
    acceleration.add(PVector.div(force, mass));
  }

  PVector attract(Object other)
  {
    PVector force = PVector.sub(location, other.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 15.0);
    force.normalize();

    float g = 0.8;
    float strength = (g * mass * other.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
}
