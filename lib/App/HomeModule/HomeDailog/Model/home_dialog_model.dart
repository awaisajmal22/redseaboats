import 'package:get/get.dart';

class HomeDialogModel{
  final String title;
  final String discount;
  final String subtitle;
  final String description;
  final String location;
  final String price;
  RxBool favorite;
  HomeDialogModel({
    required this.title,
    required this.discount,
    required this.subtitle,
    required this.description,
    required this.location,
    required this.price, 
    required this.favorite
  });
}