import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    HomeModel({
        required this.isSuccess,
        required this.data,
    });

    bool isSuccess;
    Data data;

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        isSuccess: json["isSuccess"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.banners,
        required this.categories,
    });

    List<Banner> banners;
    List<Banner> categories;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        categories: List<Banner>.from(json["categories"].map((x) => Banner.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Banner {
    Banner({
        required this.id,
        required this.createdOn,
        required this.isActive,
        required this.modifiedBy,
        required this.modifiedOn,
        required this.name,
        required this.photoUrl,
        this.createdBy,
        this.type,
    });

    String id;
    int createdOn;
    bool isActive;
    String modifiedBy;
    int modifiedOn;
    String name;
    String photoUrl;
    String? createdBy;
    String? type;

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["_id"],
        createdOn: json["createdOn"],
        isActive: json["isActive"],
        modifiedBy: json["modifiedBy"],
        modifiedOn: json["modifiedOn"],
        name: json["name"],
        photoUrl: json["photoUrl"],
        createdBy: json["createdBy"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "createdOn": createdOn,
        "isActive": isActive,
        "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn,
        "name": name,
        "photoUrl": photoUrl,
        "createdBy": createdBy,
        "type": type,
    };
}