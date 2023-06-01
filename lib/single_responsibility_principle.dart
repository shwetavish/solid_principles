// SINGLE RESPONSIBILITY PRINCIPLE

/*
As it’s clear from its name single responsible.
A class should only be responsible for one thing that means a class could change for only one reason.
* */

void main() {
  final order = OrderCalculator();
  order.totalAmount = 100;
  order.taxPercentage = 0.1;
  order.tip = 10;
  order.shipping = 5;

  order.calculateOrder();

  print("--------------------After SRP------------------");

  //After apply SRP to send the Email use the 'EmailOrder` class
  //to send the email instead of send it from `OrderCalculator` class
  final srpOrder = SrpOrderCalculator();
  srpOrder.totalAmount = 100;
  srpOrder.taxPercentage = 0.1;
  srpOrder.tip = 10;
  srpOrder.shipping = 5;
  srpOrder.calculateOrder();

  EmailOrder emailOrder = EmailOrder();
  emailOrder.sendEmail();
}

//-------------------------------------BEFORE SRP-------------------------------

class OrderCalculator {
  num? totalAmount;
  num? taxPercentage;
  num? tip;
  num? shipping;

  void calculateOrder(){
    final orderValue = totalAmount! + taxPercentage! + tip! + shipping!;
    print(orderValue);
    sendEmail();
  }

  void sendEmail() {
    const email = "abc@gmail.com";
    print("Sending email to $email with amount");
  }
}

/*
In the above example if we want some change in the "sendEmail()" then we need to modify the class `OrderCalculator`.
So, `OrderCalculator` class should have only calculate the order. It should not have the method of "sendEmail".
* */

//-------------------------------------AFTER SRP-------------------------------

class SrpOrderCalculator {
  num? totalAmount;
  num? taxPercentage;
  num? tip;
  num? shipping;

  void calculateOrder(){
    final orderValue = totalAmount! + taxPercentage! + tip! + shipping!;
    print(orderValue);
  }

}

class EmailOrder{
  var email = "abc@gmail.com";

  void sendEmail() {
    print("Sending email to $email with amount");
  }
}

//**************************************  Another Example  **************************************

//-------------------------------------BEFORE SRP-------------------------------

class User {
  Future<void> authenticate(String email, String password) async {
    // Authentication logic
  }

  Future<void> fetchUserData() async {
    // Fetch user data from server
  }

  Future<void> updateUserPreferences(Map<String, dynamic> preferences) async {
    // Update user preferences
  }
}

//-------------------------------------AFTER SRP-------------------------------
class UserAuthenticator {
  Future<void> authenticate(String email, String password) async {
    // Authentication logic
  }
}

class UserDataFetcher {
  Future<void> fetchUserData() async {
    // Fetch user data from server
  }
}

class UserPreferencesManager {
  Future<void> updateUserPreferences(Map<String, dynamic> preferences) async {
    // Update user preferences
  }
}