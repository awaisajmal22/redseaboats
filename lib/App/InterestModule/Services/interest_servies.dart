import '../../../Network/api_services.dart';
import '../../../Network/api_url.dart';
import '../Model/interest_model.dart';

class InterestServices{
Future<List<InterestDataModel>> getInterest() async {
  List<InterestDataModel> data = [];
  try{
    var response = await API().getRequest(GetApiUrl.interest);
  
    if(response.statusCode == 200){
    data = InterestModel.fromJson(response.data).data as List<InterestDataModel>;
    }
    else if(response.statusCode == 402){
      print('Expiry');
    }
  } catch (e){
print(e);
  }
    return data;

}
}