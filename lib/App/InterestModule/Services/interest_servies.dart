// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:redseaboats/Network/api_services.dart';
// import 'package:redseaboats/Network/api_url.dart';

// import '../Model/interest_model.dart';

// Future<void> getInterest() async {
//   final storage = GetStorage();
//   var interestData;
// try{
//   var response = await API().getRequest(GetApiUrl.interest);
//   print(response);
//   if(response.statusCode == 200){
//     final List<dynamic>  data = response.data;
//     interestData = data.map((e) => InterestModel.fromJson(e)).toList();
//     storage.write('interest', data);
//   }else if(response.statusCode == 401){
    
//     print('Expire');
//   }else {
//     throw Exception('Failed to load users');
//   }
// } catch (e){}
// return interestData;
// }