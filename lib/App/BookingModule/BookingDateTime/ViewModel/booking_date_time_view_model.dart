import 'package:get/get.dart';

class BookingDateTimeViewModel extends GetxController {
  RxInt selectedTimeIndex = (-1).obs;
  List timeList = [
    '3:00 PM to 4:00 PM',
    '5:00 PM to 6:00 PM',
    '7:00 PM to 8:00 PM',
    '9:00 PM to 10:00 PM'
  ];
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
       nextMonth.value = (value - 1) % 11;
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
