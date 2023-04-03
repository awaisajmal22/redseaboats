import 'dart:convert';

InterestModel interestModelFromJson(String str) => InterestModel.fromJson(json.decode(str));

String interestModelToJson(InterestModel data) => json.encode(data.toJson());

class InterestModel {
    InterestModel({
         this.isSuccess,
         this.data,
    });

    bool? isSuccess;
    List<InterestDataModel>? data;

    factory InterestModel.fromJson(Map<String, dynamic> json) => InterestModel(
        isSuccess: json["isSuccess"],
        data: List<InterestDataModel>.from(json["data"].map((x) => InterestDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
     static List<InterestModel> jsonToInterestModel(List<dynamic> emote) =>
      emote.map<InterestModel>((item) => InterestModel.fromJson(item)).toList();
}

class InterestDataModel {
    InterestDataModel({
        this.id,
         this.modifiedOn,
         this.createdOn,
         this.modifiedBy,
         this.createdBy,
         this.name,
         this.photoUrl,
         this.isActive,
    });

    String? id;
    int? modifiedOn;
    int? createdOn;
    String? modifiedBy;
    String? createdBy;
    String? name;
    String? photoUrl;
    bool? isActive;

    factory InterestDataModel.fromJson(Map<String, dynamic> json) => InterestDataModel(
        id: json["_id"],
        modifiedOn: json["modifiedOn"],
        createdOn: json["createdOn"],
        modifiedBy: json["modifiedBy"],
        createdBy: json["createdBy"],
        name: json["name"],
        photoUrl: json["photoUrl"],
        isActive: json["isActive"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "modifiedOn": modifiedOn,
        "createdOn": createdOn,
        "modifiedBy": modifiedBy,
        "createdBy": createdBy,
        "name": name,
        "photoUrl": photoUrl,
        "isActive": isActive,
    };

    
}
