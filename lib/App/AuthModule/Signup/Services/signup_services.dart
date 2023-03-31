

 import 'package:redseaboats/Network/api_services.dart';
import 'package:redseaboats/Network/api_url.dart';

import '../../../../Common/Storage/storage_handler.dart';

Future<bool?> localRegister({
  required String firstName,
  required String latsName,
  required String email,
  required String phoneNumber,
  required String countryCode,
  required String password,
  required String photoUrl
 }) async {
  bool? isSuccess = false;
  try{
    var data = {
      "firstName": firstName,
  "lastName": latsName,
  "email": email,
  "phoneNumber": phoneNumber,
  "countryCode": countryCode,
  "password": password,
  "photoUrl": photoUrl
    };
    var response = await API().postRequest(PostApiUrl.signupUrl, data);
    print(response.data["isSuccess"]);
    if(response == null){
      print('no response');
    }
    else if(response.data["isSuccess"] == true){
      GetStorageHandler getStorageHandler = GetStorageHandler();
        isSuccess = response.data["isSuccess"];
        await getStorageHandler.setToken(response.data['authorisation']['token']);
    }
    
 } catch (e){
  print(e.toString());
 }
 return isSuccess;
 }