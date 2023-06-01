// OPEN-CLOSED PRINCIPLE

/*
An entity should be open for extensions but closed for modification
* */

//Let's say if I want to add feature of "show balance" in previous example

void main() {
  final srpOrder = SrpOrderCalculator();
  srpOrder.totalAmount = 100;
  srpOrder.taxPercentage = 0.1;
  srpOrder.tip = 10;
  srpOrder.shipping = 5;
  srpOrder.calculateOrder();

  num balance = srpOrder.balance!;
  print('balance: $balance');

  print("--------------------After OCP------------------");

  //Use `OcpCustomerInfo` class with all the feature of `OcpOrderCalculator` class

  final customerInfo = OcpCustomerInfo();
  customerInfo.totalAmount = 100;
  customerInfo.taxPercentage = 0.1;
  customerInfo.tip = 10;
  customerInfo.shipping = 5;
  customerInfo.calculateOrder();

  num ocp_balance = customerInfo.balance!;
  print('balance: $ocp_balance');
}

//-------------------------------------BEFORE OCP-------------------------------

class SrpOrderCalculator {
  num? totalAmount;
  num? taxPercentage;
  num? tip;
  num? shipping;
  num? balance = 50;

  void calculateOrder() {
    final orderValue = totalAmount! + taxPercentage! + tip! + shipping!;
    print(orderValue);
  }
}

/*
If I want to add feature of "show balance" in previous example thn, I need to modify the SRPOrderCalculator class.
So, we are breaking the OCP. So, as per OCP we should extend the SRPOrderCalculator class instead of modify it.
* */

//-------------------------------------AFTER OCP-------------------------------

class OcpOrderCalculator {
  num? totalAmount;
  num? taxPercentage;
  num? tip;
  num? shipping;

  void calculateOrder() {
    final orderValue = totalAmount! + taxPercentage! + tip! + shipping!;
    print(orderValue);
  }
}

class OcpCustomerInfo extends OcpOrderCalculator {
  num? balance = 50;
}

//**************************************  Another Example  **************************************

/*
let's say you have `Shape` class to calculateArea. Now, a new requirement comes in to calculate the perimeter
of the shapes. Without applying the OCP, we might be modify the existing classes by adding a calculatePerimeter method:
* */

//-------------------------------------BEFORE OCP-------------------------------

abstract class Shape {
  double calculateArea();
  double calculatePerimeter(); // New method
}

class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }

  @override
  double calculatePerimeter() {
    // TODO: implement calculatePerimeter
    throw UnimplementedError();
  }
}

class Rectangle implements Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double calculateArea() {
    return width * height;
  }

  @override
  double calculatePerimeter() {
    // TODO: implement calculatePerimeter
    throw UnimplementedError();
  }
}

/*
By modifying the existing classes, we violate the OCP. If more behaviors are added in the future,
we would need to keep modifying the existing classes, which leading the chances to get bugs.
After applying OCP in Flutter code:
* */

//-------------------------------------AFTER OCP-------------------------------

abstract class OcpShape {
  double calculateArea();
}

abstract class ShapeWithPerimeter extends OcpShape {
  double calculatePerimeter();
}

class OcpCircle implements ShapeWithPerimeter {
  double radius;

  OcpCircle(this.radius);

  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }

  @override
  double calculatePerimeter() {
    return 2 * 3.14 * radius;
  }
}


