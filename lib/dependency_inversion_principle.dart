// DEPENDENCY INVERSION PRINCIPLE

/*
High-level modules should not depend on low-level modules, but they should depend on abstractions.

Additionally, abstractions should not depend on details, they should depend on abstractions.
* */

void main() {
  PaymentService paymentService = PaymentService();
  paymentService.processPayment(50.0);

  //-------------------------------------AFTER DIP-------------------------------
  /*
 We introduce the "PaymentMethod" interface that defines the checkout() method. The "PaymentService" class
 now depends on the abstraction (PaymentMethod) rather than the concrete implementation (PaymentViaUPI).

 We pass an instance of the desired PaymentGateway implementation to the "PaymentService" through constructor injection,
 allowing us to easily switch between different payment gateways.
 * */

  PaymentViaUPIDip paymentViaUPIDip = PaymentViaUPIDip();

  PaymentServiceDip paymentServiceDip = PaymentServiceDip(paymentMethod: paymentViaUPIDip);
  paymentServiceDip.processPayment(60.0);
}

/*
 Let's consider an example where we have a "PaymentService" class that handles payment operations.
 The "PaymentService" depends directly on a specific payment gateway implementation, such as "PaymentViaUPI".
* */

//-------------------------------------BEFORE DIP-------------------------------

class PaymentViaUPI {
  // UPI-specific payment processing logic
  void checkout(double amount) {
    print("Checkout: $amount");
  }
}

class PaymentService {
  void processPayment(double amount) {
    PaymentViaUPI upi = PaymentViaUPI();
    upi.checkout(amount);
  }
}

/*
 To apply the DIP, we should introduce an abstraction or interface that both the high-level & low-level modules
 can depend on.
 In our example, we can create a "PaymentMethod" interface & make both the "PaymentService" and "PaymentViaUPI"
 depend on it.
* */

//-------------------------------------AFTER DIP-------------------------------

abstract class PaymentMethod {
  void checkout(double amount);
}

class PaymentViaUPIDip implements PaymentMethod {
  @override
  void checkout(double amount) {
    print("Checkout: $amount");
  }
}

class PaymentServiceDip {
  PaymentMethod paymentMethod;

  PaymentServiceDip({required this.paymentMethod});

  void processPayment(double amount) {
    // Use the provided payment gateway to process the payment
    paymentMethod.checkout(amount);
  }
}
