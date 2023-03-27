import 'package:get/get.dart';

class FilterViewModel extends GetxController{
  RxInt selectedserviceIndex = (5).obs;
  List servicesList = [
    'All',
    'Dhow Cruise',
    'Jet Ski',
    'Flyboarding',
    'Kite Surfing',
    'Speed Boating',
    'Water Skiing',
    'Wild Wadi',
    'Yacht Tour',
    'Beach Dinner'
  ];
  RxInt selectedLocationIndex = (1).obs;
  List locationList = [
    'Any',
    'AbuDhabi',
    'Fujairah',
    'Sharjah'
  ];

  RxDouble startValue = 0.0.obs;
  RxDouble endValue = 0.0.obs;
}