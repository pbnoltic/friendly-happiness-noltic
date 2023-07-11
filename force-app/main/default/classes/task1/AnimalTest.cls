@IsTest
private class AnimalTest {
    
    @IsTest
    static void lionTest() {
        Test.startTest();
        IAnimal instance = new Animal.Lion();
        Test.stopTest();
        System.assertEquals('Lion is saying hello!', instance.makeNoise());
        System.assertEquals('Lion is moving!', instance.move());
        System.assertEquals('Lion is swimming!', instance.swim());
    }
    
    @IsTest
    static void alligatorTest() {
        Test.startTest();
        IAnimal instance = new Animal.Alligator();
        Test.stopTest();
        System.assertEquals('Alligator is saying hello!', instance.makeNoise());
        System.assertEquals('Alligator is moving!', instance.move());
        System.assertEquals('Alligator is swimming!', instance.swim());
    }
    
    @IsTest
    static void bearTest() {
        Test.startTest();
        IAnimal instance = new Animal.Bear();
        Test.stopTest();
        System.assertEquals('Bear is saying hello!', instance.makeNoise());
        System.assertEquals('Bear is moving!', instance.move());
        System.assertEquals('Bear is swimming!', instance.swim());
    }
    
    @IsTest
    static void dogTest() {
        Test.startTest();
        IAnimal instance = new Animal.Dog();
        Test.stopTest();
        System.assertEquals('Dog is saying hello!', instance.makeNoise());
        System.assertEquals('Dog is moving!', instance.move());
        System.assertEquals('Dog is swimming!', instance.swim());
    }
    
    @IsTest
    static void cowTest() {
        Test.startTest();
        IAnimal instance = new Animal.Cow();
        Test.stopTest();
        System.assertEquals('Cow is saying hello!', instance.makeNoise());
        System.assertEquals('Cow is moving!', instance.move());
        
        String cantSwimMessage;
        try {
            instance.swim();
        } catch (UnsupportedOperationException ex) {
            cantSwimMessage = ex.getMessage();
        }
        System.assertEquals(Animal.SWIM_PROBLEM_MESSAGE, cantSwimMessage);
    }
    
    @IsTest
    static void catTest() {
        Test.startTest();
        IAnimal instance = new Animal.Cat();
        Test.stopTest();
        System.assertEquals('Cat is saying hello!', instance.makeNoise());
        System.assertEquals('Cat is moving!', instance.move());
        
        String cantSwimMessage;
        try {
            instance.swim();
        } catch (UnsupportedOperationException ex) {
            cantSwimMessage = ex.getMessage();
        }
        System.assertEquals(Animal.SWIM_PROBLEM_MESSAGE, cantSwimMessage);
    }
    
    @IsTest
    static void horseTest() {
        Test.startTest();
        IAnimal instance = new Animal.Horse();
        Test.stopTest();
        System.assertEquals('Horse is saying hello!', instance.makeNoise());
        System.assertEquals('Horse is moving!', instance.move());
        
        String cantSwimMessage;
        try {
            instance.swim();
        } catch (UnsupportedOperationException ex) {
            cantSwimMessage = ex.getMessage();
        }
        System.assertEquals(Animal.SWIM_PROBLEM_MESSAGE, cantSwimMessage);
    }
    
}