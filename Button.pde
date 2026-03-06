// =============================================
// Create new Button objects for any interaction
// you want to add to your pet.
// =============================================

class Button {

  private String label;
  private float x, y, w, h;

  // ---- Colors - feel free to change these! ----
  private color baseColor     = color(18, 260, 320);
  private color hoverColor    = color(200, 180, 240);
  private color textColor     = color(100);

  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x     = x;
    this.y     = y;
    this.w     = w;
    this.h     = h;
  }

  // Draws the button. Call this inside draw().
  public void display() {
    // Highlight on hover
    if (isHovered()) {
      fill(hoverColor);
    } else {
      fill(baseColor);
    }

    stroke(120, 100, 160);
    strokeWeight(2);
    rect(x, y, w, h, 10); // 10 = rounded corners

    // Label
    fill(textColor);
    noStroke();
    textAlign(CENTER, CENTER);
    textSize(16);
    text(label, x + w / 2, y + h / 2);
  }

  // Returns true if (mx, my) is inside the button.
  // Use this inside mousePressed() to detect clicks.
  public boolean isClicked(float mx, float my) {
    return mx >= x && mx <= x + w &&
           my >= y && my <= y + h;
  }

  // ---- Getters ----
  public String getLabel() { return this.label; }
  public float  getX()     { return this.x; }
  public float  getY()     { return this.y; }
  public float  getW()     { return this.w; }
  public float  getH()     { return this.h; }

  // ---- Setters ----
  public void setLabel(String label)     { this.label = label; }
  public void setBaseColor(color c)      { this.baseColor = c; }
  public void setHoverColor(color c)     { this.hoverColor = c; }
  public void setTextColor(color c)      { this.textColor = c; }

  // ---- Private helpers ----
  private boolean isHovered() {
    return mouseX >= x && mouseX <= x + w &&
           mouseY >= y && mouseY <= y + h;
  }
}
