import 'package:get/get.dart';

class BookingDateTimeViewModel extends GetxController{
  RxInt selectedTimeIndex = (-1).obs;
  List timeList = [
    '3:00 PM to 4:00 PM',
    '5:00 PM to 6:00 PM',
    '7:00 PM to 8:00 PM',
    '9:00 PM to 10:00 PM'
  ];
}