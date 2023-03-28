import 'package:get/get.dart';

import '../Model/payment_method_model.dart';

class PaymentMethodViewModel extends GetxController{
  List<PaymentMethodModel> paymentMethodList = <PaymentMethodModel>[
    PaymentMethodModel(iconUrl: 'assets/payment/card.png', subtitle: 'Pay with MasterCard, Visa or Visa Electron.', title: 'Credit Card'),
    PaymentMethodModel(iconUrl: 'assets/payment/wallet.png', subtitle: 'Pay with your wallet amount', title: 'Wallet'),
    PaymentMethodModel(iconUrl: 'assets/payment/paypal.png', subtitle: 'Faster & safer way to send money.', title: 'PayPal'),
    PaymentMethodModel(iconUrl: 'assets/payment/apple.png', subtitle: 'Pay with apple pay account', title: 'Apple Pay'),
  ];
}