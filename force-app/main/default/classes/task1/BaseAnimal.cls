public abstract class BaseAnimal implements IAnimal {
  
  private final String instanceName;
  
  public BaseAnimal() {
    this.instanceName = this.getInstanceClassName();
  }
  
  public virtual String makeNoise() {
    return this.instanceName + ' is saying hello!';
  }
  
  public virtual String move() {
    return this.instanceName + ' is moving!';
  }
  
  public virtual String swim() {
    return this.instanceName + ' is swimming!';
  }
  
  private String getInstanceClassName () {
    return String.valueOf(this).substring(0,String.valueOf(this).indexOf(':'));
  }
}