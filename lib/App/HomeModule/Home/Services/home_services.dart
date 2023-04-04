import 'dart:convert';

import 'package:redseaboats/Network/api_url.dart';

import '../../../../Network/api_services.dart';
import '../Model/home_model.dart';

class HomeServices{
  Future<DataModel> getDataModel() async {
    DataModel dataModel = DataModel
    ();
    try{
      var response = await API().getRequest(GetApiUrl.home);
      print(response.data['data']);
      if(response.statusCode == 200){
        
      dataModel = DataModel.fromJson(response.data['data']);
      }
    } catch (e){
      print(e);
    }
    return dataModel;
  }
}