public inherited sharing class Animal {
    
    public static String SWIM_PROBLEM_MESSAGE = 'Can\'t swim! Need a boat!';
    
    public class Lion extends BaseAnimal {}
    
    public class Alligator extends BaseAnimal {}
    
    public class Bear extends BaseAnimal {}
    
    public class Dog extends BaseAnimal {}
    
    public class Cow extends BaseAnimal {
        
        public override String swim() {
            throw new UnsupportedOperationException(Animal.SWIM_PROBLEM_MESSAGE);
        }
        
    }
    
    public class Cat extends BaseAnimal {
        
        public override String swim() {
            throw new UnsupportedOperationException(Animal.SWIM_PROBLEM_MESSAGE);
        }
    
    }
    
    public class Horse extends BaseAnimal {
        
        public override String swim() {
            throw new UnsupportedOperationException(Animal.SWIM_PROBLEM_MESSAGE);
        }
    
    }

}