Horizontal_Slider slider;
void setup()
{
  clear();
  background(255);
  size(720, 360);
  slider = new Horizontal_Slider("Slider1:");

}

void draw()
{
  clear();
  background(255);
  slider.update(0, 0, 125, 500);
}
