import 'package:get/get.dart';


import 'dart:convert';

List<InterestModel> interestModelFromJson(String str) =>
    List<InterestModel>.from(
        json.decode(str).map((x) => InterestModel.fromJson(x)));

String interestModelToJson(List<InterestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InterestModel {
  InterestModel({
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

  factory InterestModel.fromJson(Map<String, dynamic> json) => InterestModel(
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
        "_id": id ?? '',
        "modifiedOn": modifiedOn ?? 0,
        "createdOn": createdOn ?? "",
        "modifiedBy": modifiedBy ?? "",
        "createdBy": createdBy ?? "",
        "name": name ?? "",
        "photoUrl": photoUrl ?? "",
        "isActive": isActive ?? false,
      };
}
