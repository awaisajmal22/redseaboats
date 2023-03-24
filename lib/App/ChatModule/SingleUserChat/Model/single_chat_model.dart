import 'package:get/get.dart';

class SingleChatModel{
  final String msg;
  RxBool check;
  final String time;
  SingleChatModel({
    required this.check,
    required this.msg,
    required this.time
  });
}