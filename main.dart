import 'dart:io';
import 'dart:math';
import 'cars.dart';
import 'motorcycle.dart';
import 'truck.dart';

void main () {
  var rainSpeedSlower;
  var brokenTruck;
  cars car1 = cars(80, 'ford', 0);
  cars car2 = cars(90, 'suzuki', 0);
  cars car3 = cars(100, 'honda', 0);
  cars car4 = cars(110, 'hyundai', 0);
  cars car5 = cars(80, 'mitsubishi', 0);
  cars car6 = cars(80, 'chengan', 0);
  cars car7 = cars(90, 'MG', 0);
  cars car8 = cars(110, 'toyota', 0);
  cars car9 = cars(100, 'proton', 0);
  cars car10 = cars(90, 'peuget', 0);

  truck truck1 = truck(00, 0);
  truck truck2 = truck(11, 0);
  truck truck3 = truck(22, 0);
  truck truck4 = truck(33, 0);
  truck truck5 = truck(44, 0);
  truck truck6 = truck(55, 0);
  truck truck7 = truck(66, 0);
  truck truck8 = truck(77, 0);
  truck truck9 = truck(88, 0);
  truck truck10 = truck(99, 0);

  motorcycle mc1 = motorcycle("motorcycle 1", 0);
  motorcycle mc2 = motorcycle("motorcycle 2", 0);
  motorcycle mc3 = motorcycle("motorcycle 3", 0);
  motorcycle mc4 = motorcycle("motorcycle 4", 0);
  motorcycle mc5 = motorcycle("motorcycle 5", 0);
  motorcycle mc6 = motorcycle("motorcycle 6", 0);
  motorcycle mc7 = motorcycle("motorcycle 7", 0);
  motorcycle mc8 = motorcycle("motorcycle 8", 0);
  motorcycle mc9 = motorcycle("motorcycle 9", 0);
  motorcycle mc10 = motorcycle("motorcycle 10", 0);

  List<cars> carsList = [car1, car2, car3, car4, car5, car6, car7, car8, car9, car10];
  List<truck> truckList = [truck1, truck2, truck3, truck4, truck5, truck6, truck7, truck8, truck9, truck10];
  List<motorcycle> mcList = [mc1, mc2, mc3, mc4, mc5, mc6, mc7, mc8, mc9, mc10];
  print('Enter specs of race\nis it raining (y/n)');
  var rain =(stdin.readLineSync()!);
  if (rain == 'y'){
    rainSpeedSlower=2;
  }
  else{
    rainSpeedSlower=1;
   }
  // code for 5% chance of broken down truck, dont know how accurate it is... but its something...*wink wink
  // broken truck percentage is only 5%
  int random = Random().nextInt(100);;
  if (random <= 5){
    print("received broken truck percentage: ${100-random}");
    brokenTruck=2;
  }
  else{
    brokenTruck=0;
  }

  print('Enter number of hours you want to run the race\npress Enter to quit code');
  var quit = null;
  var run = int.tryParse(stdin.readLineSync()!) ?? quit;
  if (run == quit) {
    print('race over boys');
  }
    else{
      for (int i = 0; i < run ; i++) {
         moveForAnHour(carsList, truckList, mcList);
      }
  }
  for (int i =0; i<10;i++) {
    print("distance traveled by ${carsList[i].name} is ${carsList[i].distanceTraveled}");
    var temp1 = truckList[i].speed*brokenTruck;
    var reducedDistanceforTruck = truckList[i].distanceTraveled - temp1;
    print("distance traveled by truck No.${truckList[i].name} is $reducedDistanceforTruck");
    var reducedDistanceforMC = mcList[i].distanceTraveled~/rainSpeedSlower;
    //reducing speed by 50% hence reducing distance covered by 50%
    print("distance traveled by ${mcList[i].name} is $reducedDistanceforMC");
  }
  

}


moveForAnHour(carList, truckList, mcList){

  for (int i = 0; i <= 9  ; i++){
    carList[i].distanceTraveled = carList[i].distanceTraveled+carList[i].speed;
    truckList[i].distanceTraveled = truckList[i].distanceTraveled+truckList[i].speed;
    mcList[i].distanceTraveled = mcList[i].distanceTraveled+mcList[i].speed;
  }

}