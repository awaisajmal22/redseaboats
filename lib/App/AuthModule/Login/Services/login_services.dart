import 'package:redseaboats/Network/api_services.dart';
import 'package:redseaboats/Network/api_url.dart';

import '../../../../Common/Storage/storage_handler.dart';
import '../../../../Common/toast.dart';

Future<bool?> onlogin({
  required String email,
  required String password,
  }
) async {
  bool? isSuccess = false;
  try{
    var data = {
      "email": email,
  "password": password,
    };
    
    var response = await API().postRequest(PostApiUrl.loginUrl, data);
     print(response.data["isSuccess"]);
    if(response == null){
      print('Error');
    }else if(response.data["isSuccess"] == true){
      GetStorageHandler handler = GetStorageHandler();
      isSuccess = response.data["isSuccess"];
      await handler.setToken(response.data["token"]);
      ShowMessage().showMessage(response.data["message"].toString());
    }
    else{
      ShowMessage().showErrorMessage(response.data["message"].toString());
    }
  } catch (e){
    print(e.toString());
  }
  return isSuccess;
}

Future<bool?> onforgetPasswordServices({required String email}) async {
  bool? isSuccess = false;

  try{
  var data = {
    "email": email
  };

  var response = await API().postRequest(PostApiUrl.forgetPasswordUrl, data);
  print(response.data);
  if(response == null){
    print('Error');

  }else if(response.data['isSuccess'] == true){
    isSuccess = response.data['isSuccess'];
    ShowMessage().showMessage(response.data['message'].toString());
  }else {
    ShowMessage().showErrorMessage(response.data['message'].toString());
  }
  } catch (e){
    print(e.toString());
  }
  return isSuccess;
}