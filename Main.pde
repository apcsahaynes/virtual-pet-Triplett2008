VirtualPet myPet;

Button feedButton;
Button playButton;
Button poopButton;
boolean pooping;

// How many milliseconds between each status update
// (increase to slow down, decrease to speed up)
final int UPDATE_INTERVAL = 10000;
int lastUpdateTime = 0;

// ---- Action message ----
String actionMessage = "";
int messageTime = 0;
final int MESSAGE_DURATION = 2000; // milliseconds to show the message

void setup() {
  size(600, 500);
  background(245, 240, 255);
  textFont(createFont("Arial", 16, true));
  pooping = false;

  myPet = new VirtualPet("Coco");

  // Buttons sit along the bottom of the screen
  // Button(label, x, y, width, height)
  feedButton = new Button("Feed", 80, 430, 120, 45);
  playButton = new Button("Play", 240, 430, 120, 45);
  poopButton = new Button("Poop", 400, 430, 120, 45);
  loadPetImages ();
}

void draw() {
 if (myPet.getLife ()) {
   background (255,0,0);
  textSize (100);
   text ("YOU DIED", 300, 250); 
   noLoop();
 } else {
  //background(245, 240, 255);

  // ---- Timed status update ----
  if (millis() - lastUpdateTime >= UPDATE_INTERVAL) {
    myPet.updateStatus();
    lastUpdateTime = millis();
  }

  // ---- Draw sections ----
  drawPetArea();
  drawStats(myPet);
  if (pooping) {
      fill (#362A0A);
    triangle (myPet.poopX,myPet.poopY,myPet.poopX-5,myPet.poopY+10,myPet.poopX+5,myPet.poopY+10);
  }
  feedButton.display();
  playButton.display();
  poopButton.display();
  drawMessage();
 }
}

void mousePressed() {
  if (feedButton.isClicked(mouseX, mouseY)) {
    Food f = new Food("Watermelon", 1, 1, 1);
    myPet.feed(f);
    showMessage(f.getName() + " eaten!");
  }

  if (playButton.isClicked(mouseX, mouseY)) {
    Game g = new Game("Coin Toss", 1, 1);
    myPet.play(g);
    showMessage(g.getName() + " played!");
  }
  
  if (poopButton.isClicked(mouseX, mouseY)) {
    myPet.poop();
  pooping = true;
  }
}

// Call this to set a new message
void showMessage(String msg) {
  actionMessage = msg;
  messageTime = millis();
}
