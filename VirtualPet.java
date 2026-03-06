public class VirtualPet {
  private String name;
  private int energy;
  private int weight;
  private int happiness;
  private int ageMonths;
  private int ageYears;
 private boolean isDead;
 public int poopX;
 public int poopY;

  public VirtualPet(String name){
    this.name = name;
    this.energy = 5;
    this.weight = 5;
    this.happiness = 5;
    this.ageMonths = 0;
    this.ageYears = 0;
    this.isDead = false;
  }

  public String getName(){
    return name;
  }
  
  public int getEnergyLevel(){
    return energy;
  }

  public int getHappinessLevel(){
    return happiness;
  }

public int getWeight () {
  return weight;
}

public int getAgeYears () {
  return ageYears;
}

public boolean getLife () {
  return (energy==0);
}

  public void feed(Food f){
    if (energy < 10){
      energy+= f.getEnergyIncrease();
    }
     weight+= f.getWeightGain();
     if (happiness < 10) {
       happiness += f.getHappinessIncrease();
     }
  }

  public boolean play(Game g){
   if (weight > 5){
      weight-= g.getWeightDecr();
    } 
    if (g.isWinner()) {
    if (happiness < 10){
      happiness+= g.getHappinessIncr();
    }
    return true;
    } else {
        if (happiness>0) {
            happiness -= g.getHappinessIncr();
        }
        return false;
    }
 
  }
  
  public void poop() {
    weight /= 2;
    energy -= 1;
    poopX = (int) (Math.random()*590)+5;
    poopY = (int) (Math.random()*490);
  }
    
  
  public void updateStatus() {
      if (happiness>0) {
          happiness -=1;
      }
      if (energy>0) {
          energy -=1;
      }
      ageMonths +=1;
      ageConverter();
  }
  
  private void ageConverter() {
      if (ageMonths>=12) {
          ageYears +=1;
          ageMonths = 0;
      }
  }

  public String toString(){
    return name + "'s information: \nEnergy: " + energy 
    + "\nWeight: " + weight + "\nHappiness: " + happiness +
    "\nAge: " + ageYears + " years and " + ageMonths + " months";
  }
}
