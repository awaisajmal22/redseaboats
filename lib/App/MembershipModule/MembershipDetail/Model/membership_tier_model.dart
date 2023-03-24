import 'package:get/get.dart';

class MembershipTierModel{
  final String title;
  final String subtitile;
  final String discount;
  final String imageUrl;
  final String description;
  RxBool check;
  MembershipTierModel({
    required this.title,
    required this.subtitile,
    required this.imageUrl,
    required this.description,
    required this.discount,
    required this.check
  });
}