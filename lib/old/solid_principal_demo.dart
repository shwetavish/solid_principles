/*
*                                       *SOLID Principal*
* The main points for SOLID principal are listed below.
* 1.Single Responsible Principal
* 2.Open Closed Principal
* 3.Liskov Substitution Principal
* 4.Interface segregation principal
* 5.Dependency Inversion principal
*/

void main() {
  final dip = Dip();
  dip.performMainTask1();
  dip.performMainTask2();
}

// Single Responsible Principal
// It stats that Application classes,modules & methods should have only one job to do.In other terms
//class should be responsible for only one job and have only one reason to change.

class Srp{
  void run(){
    print("John is running.");
  }
}

class Srp1{
  void sleep(){
    print("John is sleeping");
  }
}

        //  ----------------------------- -----------------------------

//Open close principal

//It stats that software entities should be open for extensions but closed for modification.

//In below Ocp class if we want to add new activity name "Playing",we have to modify Ocp class and
//that modification will violate the Open close principal.As per the Open close principal we should
//use Ocp1 class.

class Ocp{
  void performTasks(OcpEnums ocpEnums) {
    switch (ocpEnums) {
      case OcpEnums.run:
      print("John is running");
        break;
      case OcpEnums.walk:
        print("John is walking");
        break;
      case OcpEnums.sleep:
        print("John is sleeping");
        break;
      default:
        print("Error Occurred!!");
    }
  }
}
enum OcpEnums{run,walk,sleep}

abstract class Ocp1{
  void printTasks();
}

class Run extends Ocp1{
  @override
  void printTasks() {
    print("John is running");
  }
}
class Walk extends Ocp1{
  @override
  void printTasks() {
    print("John is walking");
  }
}
class Sleep extends Ocp1{
  @override
  void printTasks() {
    print("John is sleeping");
  }
}
class Play extends Ocp1{
  @override
  void printTasks() {
    print("John is playing");
  }
}

             //  ----------------------------- -----------------------------

//Liskov substitution principal

//It stats that object of superclass should be replaceable with object of it's subclass without
//breaking the app.Subclass should fully utilize it's superclass properties.

//Below class audio & video inherits the properties of media class.But that both class don't utilize
//whole properties of media class.That violates 3rd rule of SOLID Principal.To avoid this we
//should use the lsp class listed below.
abstract class Media{
  void audio(){
  }
  void video(){
  }
}

class Audio extends Media{
  @override
  void audio() {
    print("Audio is Running");
  }

}
class Video extends Media{

  @override
  void video() {
    print("video is running");
  }

}

abstract class LspAudio{
  void audio(){}
}
abstract class LspVideo{
  void video(){}
}

class Mp3 extends LspAudio{
  @override
  void audio() {

  }
}
class Mp4 extends LspVideo{
  @override
  void video() {

  }
}


            //  ----------------------------- -----------------------------
//Interface segregation principal
//It is nearly identical to the 3rd principal.
//It stats that entities should never depend on anything more than it's calling.
//Below VegRestaurant class inherits the properties of EatMethods.But VegRestaurant class
//has to overright the class eatNonVeg even though class don't need.It violates the 4th rule.
//So to overcome this we should use the Isp class listed below.

abstract class EatMethods{
  void drinkMilk();
  void eatVeg();
  void eatNonVeg();
}

class VegRestaurant extends EatMethods{
  @override
  void drinkMilk() {
   print("John is drinking milk");
  }

  @override
  void eatNonVeg() {

  }

  @override
  void eatVeg() {
    print("John is eating veggies");
  }
}

abstract class EatVegMethods{
  void drink();
  void eatVeg();
}
abstract class EatNonVegMethods{
  void drink();
  void eatNonVeg();
}

class IspVegRestaurant extends EatVegMethods{
  @override
  void drink() {
    print("John is drinking");
  }

  @override
  void eatVeg() {
    print("John is eating veggies");
  }
}

           // ------------------------------ ----------------------------

//Dependency inversion principal
//It is nearly identical to the 2nd principal.
//It stats that high level module should not depend on low level module.
//Below HighLevel module is depends on lowLevel module.If some changes occurred in high level module
//lot's of modification will require.Hence it breaks the 5th principal.To avoid this we should use Dip class.

class HighLevelModule {
  final LowLevelModule lowLevelModule;
  HighLevelModule(this.lowLevelModule);
  void performHighLevelTask(){
    lowLevelModule.performLowLevelTask();
  }
  
}
class LowLevelModule {
  void performLowLevelTask(){
    print("Performing Low Level task");
  }
}
class MainModule {
  LowLevelModule lowLevelModule = LowLevelModule();
  late HighLevelModule highLevelModule;

  void performMainTask(){
    highLevelModule = HighLevelModule(lowLevelModule);
    highLevelModule.performHighLevelTask();
  }
}
    // --- below example follows the 5th principal.
abstract class Task{
  void performAbstractionLevelTask();
}

class LowLevel extends Task{

  @override
  void performAbstractionLevelTask() {
    print("Performing Low Level Task1");
  }
}

class LowLevel2 extends Task{
  @override
  void performAbstractionLevelTask() {
    print("Performing Low Level Task2");
  }

}

class HighLevel{
  final Task task;
  HighLevel(this.task);

  void performHighLevelTask(){
    task.performAbstractionLevelTask();
  }
}

class Dip{
  final low1 = LowLevel();
  final low2 = LowLevel2();
  void performMainTask1(){
    final highLevel = HighLevel(low1);
    highLevel.performHighLevelTask();
  }
  void performMainTask2(){
    final highLevel = HighLevel(low2);
    highLevel.performHighLevelTask();
  }

}