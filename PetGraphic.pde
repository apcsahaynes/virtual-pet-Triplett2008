// =============================================
//
// OPTION A: Use Processing graphics
//   - Write your drawing code inside drawPetGraphic()
//   - You can make multiple versions (happy, sad, etc.)
//     and call the right one based on pet state
//
// OPTION B: Use images (PImage)
//   - Add image files to your sketch's /data folder
//   - Load them in loadPetImages() below
//   - Add them to the petImages ArrayList
//   - Display the right one in drawPetGraphic()
// =============================================


// =============================================
// OPTION B SETUP  (comment out if using Option A)
// =============================================

ArrayList<PImage> petImages;   // one image per mood/state

void loadPetImages() {
   petImages = new ArrayList<PImage>();
  petImages.add(loadImage("Neutral.jpg"));  // index 0 - neutral
   petImages.add(loadImage("Happy.jpg"));    // index 1 - happy
  petImages.add(loadImage("Sad.jpg"));      // index 2 - sad
  // add more as needed!
 }
//
// Call loadPetImages() at the end of setup() in VirtualPet.pde


// =============================================
// Pet area background + border
// (shared by both options - leave this)
// =============================================

void drawPetArea() {
  // Background for the pet zone
  fill(220, 210, 245);
  stroke(180, 160, 220);
  strokeWeight(2);
  rect(20, 20, 380, 390, 16);

  // Draw whichever graphic option you're using
  drawPetGraphic();
}


// =============================================
// OPTION A: Drawing with Processing shapes
// Replace or add to the placeholder below!
// =============================================

void drawPetGraphic() {

  // ---- Placeholder shape ----
  // Replace this with your own drawing,
  // or swap it for an image (see Option B below).

  // Body
 
  // ---- END placeholder ----


  // =============================================
  // OPTION B: Display a PImage instead
  // Uncomment and adjust once images are loaded.
  // =============================================

  // Choose which image based on pet state:
  int index = 0; // neutral default
  if (myPet.getEnergyLevel() >= 8 && myPet.getHappinessLevel() >= 8) {
    index = 1; // happy
   } else if (myPet.getHappinessLevel() <=3) {
     index = 2; // sad
   }
   image(petImages.get(index), 60, 60, 300, 300);
}
