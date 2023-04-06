import 'package:get/get.dart';

class BookingDateTimeViewModel extends GetxController {
  RxInt selectedTimeIndex = (-1).obs;
  RxString selectedTime = ''.obs;

  RxInt selectedMonth = DateTime.now().month.obs;
  RxInt nextMonth = DateTime.now().month.obs;

  getselectedMonth(int value){
    selectedMonth.value = (value) % 11;
   
  }

  String getCurrentMonth() {
    return monthList[selectedMonth.value - 1];
  }
  getCurrentToNextMonth(int value){
    if(selectedMonth.value == 12){
       nextMonth.value = (selectedMonth.value - 1) % 11;
    }
    else {
       nextMonth.value = (value) % 11;
    }
   
  }
  String getNextMonth() {
    return monthList[nextMonth.value];
  }
  List monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  
 @override
  void onInit() {
   
    // TODO: implement onInit
    super.onInit();
     getselectedMonth;
     getCurrentToNextMonth;
  }
}
