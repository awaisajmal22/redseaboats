import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PaymentDetailViewModel extends GetxController{
  final cardNameController = TextEditingController();
  final cardExpiryController = TextEditingController();
  final cardNumberController = TextEditingController();
  final cardCVVController = TextEditingController();
}