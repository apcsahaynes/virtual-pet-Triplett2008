public class Game {
    private String name;
    private int happinessIncr;
    private int weightDecr;
    
  public Game (String name, int happinessIncr, int weightDecr) {
      this.name = name;
      this.happinessIncr = happinessIncr;
      this.weightDecr = weightDecr;
  }
  
  public String getName () {
      return name;
  }
  
  public int getHappinessIncr () {
      return happinessIncr;
  }
  
  public int getWeightDecr () {
      return weightDecr;
  }
  
  public boolean isWinner () {
      if (Math.random()>0.5) {
          return true;
      } else {
          return false;
      }
  }
}
