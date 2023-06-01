// INTERFACE SEGREGATION PRINCIPLE

/*
A client should never be forced to implement an interface that it doesn't use OR

clients should not be forced to depend on methods they do not use.
* */

void main() {}

//-------------------------------------BEFORE ISP-------------------------------

abstract class Animal {
  void eat();
  void sleep();
  void makeSound();
  void fly();
}

class Dog implements Animal {
  @override
  void eat() {
    // Dog-specific eat logic
  }

  @override
  void sleep() {
    // Dog-specific sleep logic
  }

  @override
  void makeSound() {
    // Dog-specific sound logic
  }

  @override
  void fly() {
    // Incorrect implementation for dogs
    throw Exception('Dogs cannot fly');
  }
}

/*
In this case, the "Dog" class is forced to implement the "fly()" method even though it's not relevant to dogs.
This violates the ISP because clients (in this case, Dog class which implementing Animal) are forced to depend
on an interface method they don't need.
* */

//-------------------------------------AFTER ISP-------------------------------

abstract class Eatable {
  void eat();
}

abstract class Sleepable {
  void sleep();
}

abstract class Soundable {
  void makeSound();
}

abstract class Flyable {
  void fly();
}

/*
Now, classes can implement the specific interfaces that apply to them.
For example, the "Dog" class only needs to implement the Eatable, Sleepable, and Soundable interfaces,
while the "Bird" class can implement the Eatable, Sleepable, Soundable, and Flyable interfaces.
* */

class IspDog implements Eatable, Sleepable, Soundable {
  @override
  void eat() {
    // Dog-specific eat logic
  }

  @override
  void sleep() {
    // Dog-specific sleep logic
  }

  @override
  void makeSound() {
    // Dog-specific sound logic
  }
}

class Bird implements Eatable, Sleepable, Soundable, Flyable {
  @override
  void eat() {
    // Bird-specific eat logic
  }

  @override
  void sleep() {
    // Bird-specific sleep logic
  }

  @override
  void makeSound() {
    // Bird-specific sound logic
  }

  @override
  void fly() {
    // Bird-specific fly logic
  }
}



