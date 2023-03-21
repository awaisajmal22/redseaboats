import 'package:get/get.dart';
import 'package:redseaboats/App/ProfileModule/MyWallet/Model/credit_card_model.dart';

class MyWalletViewModel extends GetxController{
  RxInt selectedCardIndex = 0.obs;
  List<CardModel> cardList = <CardModel>[
    CardModel(title: 'Credit Card', cardNumber: '9875 ***** **** 6758', imageUrl: 'assets/profile/icons/card.png'),
    CardModel(title: 'Debit Card', cardNumber: '9854 ***** **** 1127', imageUrl: 'assets/profile/icons/visa.png'),
  ];
}