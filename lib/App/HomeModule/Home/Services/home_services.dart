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
      print(response.data['data']['featuredServices']);
      if(response.statusCode == 200){
        
      dataModel = DataModel.fromJson(response.data['data']);
      }
    } catch (e){
      print(e);
    }
    return dataModel;
  }


  void putLike({
    required String id,
    required bool like
  }) async {
    try{
      var data = {
        "message": like.toString()
      };
      if(like == false){
      var response = await API().putRequestHeader("${PutApiUrl.unlikeUrl}$id", data);
      }
      else if(like == true){
        var response = await API().putRequestHeader("${PutApiUrl.likeUrl}$id", data);
      }
      print(data);
    }catch (e){}
  }
}