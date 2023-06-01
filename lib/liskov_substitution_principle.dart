// LISKOV SUBSTITUTION PRINCIPLE

/*
Objects of a superclass should be replaceable with objects of its subclasses
without affecting the correctness of the program.

In other words, subclasses should be able to be used interchangeably with their superclass without causing any issues.
* */

class Vehicle {
  void startEngine() {
    print('Starting engine...');
  }
}

class Car extends Vehicle {
  @override
  void startEngine() {
    super.startEngine();
    print('Car engine started.');
  }
}

class Motorcycle extends Vehicle {
  @override
  void startEngine() {
    super.startEngine();
    print('Motorcycle engine started.');
  }
}

/*
In this example, the "Car" and "Motorcycle" classes inherit from the "Vehicle" class and override
the "startEngine" method to add their specific behavior.

This follow the LSP because we can replace instances of the "Vehicle" class with
instances of its subclasses ("Car" and "Motorcycle") without affecting the correctness of the program.
* */

void main() {

  //-------------------------------------BEFORE LSP-------------------------------

  Car car = Car();
  car.startEngine();

  Motorcycle motorcycle = Motorcycle();
  motorcycle.startEngine();

  print("-------------------------------------AFTER LSP-------------------------------");

  Vehicle lspCar = Car();
  Vehicle lapMotorcycle = Motorcycle();

  testVehicle(lspCar);         // Output: Starting engine... Car engine started.
  testVehicle(lapMotorcycle);  // Output: Starting engine... Motorcycle engine started.
}

void testVehicle(Vehicle vehicle) {
  vehicle.startEngine();
}


