
class Horizontal_Slider 
{
  String title = "Title: ";
  boolean visible = false;
  boolean is_title_visible = true;
  boolean is_border_visible = true;
  boolean is_progress_visible = true;
  float from_val = 0.0;
  float to_val = 100.0;
  private float value = 0.5;
  color background_color = color(225, 225, 225);
  color slider_background_color = color(175, 175, 175);
  color slider_color = color(100, 100, 100);
  color text_color =  color(255, 255, 255);
  Horizontal_Slider(String _title)
  {
    title = _title;
    visible = true;
  }
  
  void update(int _pos_bottom, int _pos_left, int _pos_top, int _pos_right) throws IllegalArgumentException
  {
    int block_pos_x = _pos_left;
    int block_pos_y = _pos_bottom;
    int block_size_x = _pos_right - _pos_left;
    int block_size_y = _pos_top - _pos_bottom;
    int slider_pos_x = block_pos_x + int(0.2*block_size_y);
    int slider_pos_y = block_pos_y + int(0.2*block_size_y);
    int slider_size_x = block_size_x - int(0.4*block_size_y);
    int slider_size_y = block_size_y - int(0.4*block_size_y);
    int text_size = int(slider_size_y / 2);
    if (block_size_x <= 0)
      throw new IllegalArgumentException("The width cannot be less than zero");
    if (block_size_y <= 0)
      throw new IllegalArgumentException("The height cannot be less than zero");
    if ( block_size_x / block_size_y < 1.5)
      throw new IllegalArgumentException("The width to height ratio cannot be less than 1.5");      
    fill(background_color);
    rect(block_pos_x, block_pos_y, block_size_x, block_size_y);
    noFill();
    noStroke();
    if (visible)
    {
      if (mousePressed && mouseX >= slider_pos_x && mouseY >= slider_pos_y && mouseX <= slider_pos_x + slider_size_x && mouseY <= slider_pos_y + slider_size_y)
      {
        value = map(mouseX, slider_pos_x, slider_pos_x + slider_size_x, 0.0, 1.0); 
      }
      noStroke(); 
      fill(slider_background_color);
      rect(slider_pos_x, slider_pos_y, slider_size_x, slider_size_y);
      fill(slider_color);
      rect(slider_pos_x, slider_pos_y, value*slider_size_x, slider_size_y);
      if (is_progress_visible)
      {
        textSize(text_size);
        stroke(text_color);
        fill(text_color);
        String view_string = "";
        if (is_title_visible)
          view_string += title + " " + str(int(100 * value)) + " %";
        else
          view_string += str(int(map(value, 0.0, 1.0, from_val, to_val))) + " %";
        text(view_string, slider_pos_x + (slider_size_x - textWidth(view_string)) / 2, slider_pos_y + (13.0/10) *  text_size);
      }
    }
  }
  
  void set_defoult_theme()
  {
    background_color = color(225, 225, 225);
    slider_background_color = color(175, 175, 175);
    slider_color = color(100, 100, 100);
    text_color =  color(255, 255, 255);
  }
  
  void set_theme(color _background_color, color _slider_background_color, color _slider_color,  color _text_color)
  {
    background_color = _background_color;
    slider_background_color = _slider_background_color;
    slider_color = _slider_color;
    text_color = _text_color;
  }
  
  void set_range(float _from_val, float _to_val)
  {
    from_val = _from_val;
    to_val = _to_val;
  }  
}
