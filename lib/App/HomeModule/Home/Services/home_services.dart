import 'dart:convert';

import 'package:redseaboats/Network/api_url.dart';

import '../../../../Network/api_services.dart';
import '../Model/home_model.dart';

class HomeServices{
  Future<List<Data>> getData() async {
    List<Data> data = [];
    try{
      var response = await API().getRequest(GetApiUrl.home);
      print(response.data);
      if(response.statusCode == 200){
        data = HomeModel.fromJson(response.data).data as List<Data>;
      }
    } catch (e){
      print(e);
    }
    return data;
  }
}