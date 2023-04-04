import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    HomeModel({
         this.isSuccess,
         this.data,
         this.message,
    });

    bool? isSuccess;
    DataModel? data;
    String? message;

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        isSuccess: json["isSuccess"],
        data: DataModel.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "data": data!.toJson(),
        "message": message,
    };
}

class DataModel {
    DataModel({
         this.banners,
         this.categories,
         this.featuredServices,
         this.basedOnInterestServices,
         this.nearbyServices,
         this.comboPackages,
    });

    List<Banner>? banners;
    List<Banner>? categories;
    List<FeaturedService>? featuredServices;
    List<dynamic>? basedOnInterestServices;
    List<NearbyService>? nearbyServices;
    List<dynamic>? comboPackages;

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        categories: List<Banner>.from(json["categories"].map((x) => Banner.fromJson(x))),
        featuredServices: List<FeaturedService>.from(json["featuredServices"].map((x) => FeaturedService.fromJson(x))),
        basedOnInterestServices: List<dynamic>.from(json["basedOnInterestServices"].map((x) => x)),
        nearbyServices: List<NearbyService>.from(json["nearbyServices"].map((x) => NearbyService.fromJson(x))),
        comboPackages: List<dynamic>.from(json["comboPackages"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners!.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "featuredServices": List<dynamic>.from(featuredServices!.map((x) => x.toJson())),
        "basedOnInterestServices": List<dynamic>.from(basedOnInterestServices!.map((x) => x)),
        "nearbyServices": List<dynamic>.from(nearbyServices!.map((x) => x.toJson())),
        "comboPackages": List<dynamic>.from(comboPackages!.map((x) => x)),
    };
}

class Banner {
    Banner({
        required this.id,
        this.createdOn,
        this.isActive,
        this.modifiedBy,
        this.modifiedOn,
        required this.name,
        required this.photoUrl,
        this.createdBy,
        this.type,
        this.bannerId,
    });

    String id;
    int? createdOn;
    bool? isActive;
    String? modifiedBy;
    int? modifiedOn;
    String name;
    String photoUrl;
    String? createdBy;
    String? type;
    String? bannerId;

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
        bannerId: json["id"],
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
        "id": bannerId,
    };
}


class FeaturedService {
    FeaturedService({
        required this.id,
        required this.adrenaline,
        required this.amenities,
        required this.cancellationPolicy,
        required this.capacityPerDay,
        required this.category,
        required this.createdOn,
        required this.description,
        required this.galleryPhotoUrls,
        required this.interestId,
        required this.isActive,
        required this.isFeatured,
        required this.likes,
        required this.location,
        required this.maximumPersons,
        required this.minimunPersons,
        required this.modifiedBy,
        required this.modifiedOn,
        required this.photoUrl,
        required this.rating,
        required this.ratingCount,
        required this.requiredPersonalInformation,
        required this.reschedulePolicy,
        required this.slots,
        required this.status,
        required this.timings,
        required this.title,
        required this.totalRating,
        required this.vendor,
        required this.whatToExpect,
        required this.decisionList,
        required this.priceInWords,
        required this.isLiked,
        required this.totalReviews,
    });

    String id;
    Adrenaline adrenaline;
    List<Amenity> amenities;
    String cancellationPolicy;
    int capacityPerDay;
    Banner category;
    int createdOn;
    String description;
    List<String> galleryPhotoUrls;
    String interestId;
    bool isActive;
    bool isFeatured;
    List<String> likes;
    FeaturedServiceLocation location;
    int maximumPersons;
    int minimunPersons;
    String modifiedBy;
    int modifiedOn;
    String photoUrl;
    int rating;
    int ratingCount;
    String requiredPersonalInformation;
    String reschedulePolicy;
    List<FeaturedServiceSlot> slots;
    String status;
    List<Timing> timings;
    String title;
    int totalRating;
    Vendor vendor;
    List<WhatToExpect> whatToExpect;
    String decisionList;
    String priceInWords;
    bool isLiked;
    int totalReviews;

    factory FeaturedService.fromJson(Map<String, dynamic> json) => FeaturedService(
        id: json["_id"],
        adrenaline: Adrenaline.fromJson(json["adrenaline"]),
        amenities: List<Amenity>.from(json["amenities"].map((x) => Amenity.fromJson(x))),
        cancellationPolicy: json["cancellationPolicy"],
        capacityPerDay: json["capacityPerDay"],
        category: Banner.fromJson(json["category"]),
        createdOn: json["createdOn"],
        description: json["description"],
        galleryPhotoUrls: List<String>.from(json["galleryPhotoUrls"].map((x) => x)),
        interestId: json["interestId"],
        isActive: json["isActive"],
        isFeatured: json["isFeatured"],
        likes: List<String>.from(json["likes"].map((x) => x)),
        location: FeaturedServiceLocation.fromJson(json["location"]),
        maximumPersons: json["maximumPersons"],
        minimunPersons: json["minimunPersons"],
        modifiedBy: json["modifiedBy"],
        modifiedOn: json["modifiedOn"],
        photoUrl: json["photoURL"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        requiredPersonalInformation: json["requiredPersonalInformation"],
        reschedulePolicy: json["reschedulePolicy"],
        slots: List<FeaturedServiceSlot>.from(json["slots"].map((x) => FeaturedServiceSlot.fromJson(x))),
        status: json["status"],
        timings: List<Timing>.from(json["timings"].map((x) => Timing.fromJson(x))),
        title: json["title"],
        totalRating: json["totalRating"],
        vendor: Vendor.fromJson(json["vendor"]),
        whatToExpect: List<WhatToExpect>.from(json["whatToExpect"].map((x) => WhatToExpect.fromJson(x))),
        decisionList: json["decisionList"],
        priceInWords: json["priceInWords"],
        isLiked: json["isLiked"],
        totalReviews: json["totalReviews"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "adrenaline": adrenaline.toJson(),
        "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
        "cancellationPolicy": cancellationPolicy,
        "capacityPerDay": capacityPerDay,
        "category": category.toJson(),
        "createdOn": createdOn,
        "description": description,
        "galleryPhotoUrls": List<dynamic>.from(galleryPhotoUrls.map((x) => x)),
        "interestId": interestId,
        "isActive": isActive,
        "isFeatured": isFeatured,
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "location": location.toJson(),
        "maximumPersons": maximumPersons,
        "minimunPersons": minimunPersons,
        "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn,
        "photoURL": photoUrl,
        "rating": rating,
        "ratingCount": ratingCount,
        "requiredPersonalInformation": requiredPersonalInformation,
        "reschedulePolicy": reschedulePolicy,
        "slots": List<dynamic>.from(slots.map((x) => x.toJson())),
        "status": status,
        "timings": List<dynamic>.from(timings.map((x) => x.toJson())),
        "title": title,
        "totalRating": totalRating,
        "vendor": vendor.toJson(),
        "whatToExpect": List<dynamic>.from(whatToExpect.map((x) => x.toJson())),
        "decisionList": decisionList,
        "priceInWords": priceInWords,
        "isLiked": isLiked,
        "totalReviews": totalReviews,
    };
}

class Adrenaline {
    Adrenaline({
        required this.adrenalineMeter,
        required this.adrenalineMeterScale,
    });

    String? adrenalineMeter;
    String? adrenalineMeterScale;

    factory Adrenaline.fromJson(Map<String, dynamic> json) => Adrenaline(
        adrenalineMeter: json["adrenalineMeter"],
        adrenalineMeterScale: json["adrenalineMeterScale"],
    );

    Map<String, dynamic> toJson() => {
        "adrenalineMeter": adrenalineMeter,
        "adrenalineMeterScale": adrenalineMeterScale,
    };
}





class Amenity {
    Amenity({
        required this.name,
        required this.photoUrl,
    });

    String name;
    String photoUrl;

    factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        name: json["name"],
        photoUrl: json["photoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "photoUrl": photoUrl,
    };
}

class FeaturedServiceLocation {
    FeaturedServiceLocation({
        required this.id,
        required this.about,
        required this.createdOn,
        required this.email,
        required this.location,
        required this.phone,
        required this.photoUrl,
        required this.rating,
        required this.ratingCount,
        required this.streetAddress,
        required this.title,
        required this.totalRating,
        required this.locationId,
    });

    String id;
    String about;
    int createdOn;
    String email;
    LocationLocation location;
    String phone;
    String photoUrl;
    int rating;
    int ratingCount;
    String streetAddress;
    String title;
    int totalRating;
    String locationId;

    factory FeaturedServiceLocation.fromJson(Map<String, dynamic> json) => FeaturedServiceLocation(
        id: json["_id"],
        about: json["about"],
        createdOn: json["createdOn"],
        email: json["email"],
        location: LocationLocation.fromJson(json["location"]),
        phone: json["phone"],
        photoUrl: json["photoURL"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        streetAddress: json["streetAddress"],
        title: json["title"],
        totalRating: json["totalRating"],
        locationId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "about": about,
        "createdOn": createdOn,
        "email": email,
        "location": location.toJson(),
        "phone": phone,
        "photoURL": photoUrl,
        "rating": rating,
        "ratingCount": ratingCount,
        "streetAddress": streetAddress,
        "title": title,
        "totalRating": totalRating,
        "id": locationId,
    };
}

class LocationLocation {
    LocationLocation({
        required this.type,
        required this.coordinates,
    });

    String? type;
    List<double>? coordinates;

    factory LocationLocation.fromJson(Map<String, dynamic> json) => LocationLocation(
        type: json["type"],
        coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
    };
}



class FeaturedServiceSlot {
    FeaturedServiceSlot({
        required this.duration,
        required this.price,
        required this.isActive,
        required this.isAgeWisePricingActive,
        required this.discount,
        this.ageWisePricing,
    });

    int duration;
    int price;
    bool isActive;
    bool isAgeWisePricingActive;
    PurpleDiscount discount;
    List<AgeWisePricing>? ageWisePricing;

    factory FeaturedServiceSlot.fromJson(Map<String, dynamic> json) => FeaturedServiceSlot(
        duration: json["duration"],
        price: json["price"],
        isActive: json["isActive"],
        isAgeWisePricingActive: json["isAgeWisePricingActive"],
        discount: PurpleDiscount.fromJson(json["discount"]),
        ageWisePricing: json["ageWisePricing"] == null ? [] : List<AgeWisePricing>.from(json["ageWisePricing"]!.map((x) => AgeWisePricing.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "duration": duration,
        "price": price,
        "isActive": isActive,
        "isAgeWisePricingActive": isAgeWisePricingActive,
        "discount": discount.toJson(),
        "ageWisePricing": ageWisePricing == null ? [] : List<dynamic>.from(ageWisePricing!.map((x) => x.toJson())),
    };
}

class AgeWisePricing {
    AgeWisePricing({
        required this.title,
        required this.price,
        required this.ageLimit,
        required this.isActive,
    });

    String title;
    int price;
    String ageLimit;
    bool isActive;

    factory AgeWisePricing.fromJson(Map<String, dynamic> json) => AgeWisePricing(
        title: json["title"],
        price: json["price"],
        ageLimit: json["ageLimit"],
        isActive: json["isActive"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "ageLimit": ageLimit,
        "isActive": isActive,
    };
}

class PurpleDiscount {
    PurpleDiscount({
        required this.isActive,
        this.discountPercentage,
        this.validFrom,
        this.validTill,
    });

    bool isActive;
    int? discountPercentage;
    int? validFrom;
    int? validTill;

    factory PurpleDiscount.fromJson(Map<String, dynamic> json) => PurpleDiscount(
        isActive: json["isActive"],
        discountPercentage: json["discountPercentage"],
        validFrom: json["validFrom"],
        validTill: json["validTill"],
    );

    Map<String, dynamic> toJson() => {
        "isActive": isActive,
        "discountPercentage": discountPercentage,
        "validFrom": validFrom,
        "validTill": validTill,
    };
}

class Timing {
    Timing({
        required this.isActive,
        required this.startTime,
        required this.endTime,
        required this.day,
        required this.isOpen,
        required this.min,
        required this.max,
    });

    bool? isActive;
    String? startTime;
    String? endTime;
    String? day;
    bool? isOpen;
    String? min;
    String? max;

    factory Timing.fromJson(Map<String, dynamic> json) => Timing(
        isActive: json["isActive"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        day: json["day"],
        isOpen: json["isOpen"],
        min: json["min"],
        max: json["max"],
    );

    Map<String, dynamic> toJson() => {
        "isActive": isActive,
        "startTime": startTime,
        "endTime": endTime,
        "day": day,
        "isOpen": isOpen,
        "min": min,
        "max": max,
    };
}







class Vendor {
    Vendor({
        required this.firstName,
        required this.lastName,
        required this.photoUrl,
        required this.phoneNumber,
        required this.email,
        required this.rating,
        required this.id,
    });

    String? firstName;
    String? lastName;
    String? photoUrl;
    String? phoneNumber;
    String? email;
    int? rating;
    String? id;

    factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        firstName: json["firstName"],
        lastName: json["lastName"],
        photoUrl: json["photoUrl"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        rating: json["rating"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "photoUrl": photoUrl,
        "phoneNumber": phoneNumber,
        "email": email,
        "rating": rating,
        "id": id,
    };
}



class WhatToExpect {
    WhatToExpect({
        required this.feature,
        required this.available,
    });

    String? feature;
    bool? available;

    factory WhatToExpect.fromJson(Map<String, dynamic> json) => WhatToExpect(
        feature: json["feature"],
        available: json["available"],
    );

    Map<String, dynamic> toJson() => {
        "feature": feature,
        "available": available,
    };
}

class NearbyService {
    NearbyService({
        required this.id,
        required this.adrenaline,
        required this.amenities,
        required this.cancellationPolicy,
        required this.capacityPerDay,
        required this.category,
        required this.createdOn,
        required this.description,
        required this.galleryPhotoUrls,
        required this.interestId,
        required this.isActive,
        required this.isFeatured,
        required this.likes,
        required this.location,
        required this.maximumPersons,
        required this.minimunPersons,
        required this.modifiedBy,
        required this.modifiedOn,
        required this.photoUrl,
        required this.rating,
        required this.ratingCount,
        required this.requiredPersonalInformation,
        required this.reschedulePolicy,
        required this.slots,
        required this.status,
        required this.timings,
        required this.title,
        required this.totalRating,
        required this.vendor,
        required this.whatToExpect,
        required this.decisionList,
        required this.priceInWords,
        required this.isLiked,
        required this.totalReviews,
    });

    String? id;
    Adrenaline? adrenaline;
    List<dynamic>? amenities;
    String? cancellationPolicy;
    int? capacityPerDay;
    Banner category;
    int createdOn;
    String description;
    List<String> galleryPhotoUrls;
    String interestId;
    bool isActive;
    bool isFeatured;
    List<dynamic> likes;
    FeaturedServiceLocation location;
    int maximumPersons;
    int minimunPersons;
    String modifiedBy;
    int modifiedOn;
    String photoUrl;
    int rating;
    int ratingCount;
    String requiredPersonalInformation;
    String reschedulePolicy;
    List<NearbyServiceSlot> slots;
    String status;
    List<Timing> timings;
    String title;
    int totalRating;
    Vendor vendor;
    List<WhatToExpect> whatToExpect;
    String decisionList;
    String priceInWords;
    bool isLiked;
    int totalReviews;

    factory NearbyService.fromJson(Map<String, dynamic> json) => NearbyService(
        id: json["_id"],
        adrenaline: Adrenaline.fromJson(json["adrenaline"]),
        amenities: List<dynamic>.from(json["amenities"].map((x) => x)),
        cancellationPolicy: json["cancellationPolicy"],
        capacityPerDay: json["capacityPerDay"],
        category: Banner.fromJson(json["category"]),
        createdOn: json["createdOn"],
        description: json["description"],
        galleryPhotoUrls: List<String>.from(json["galleryPhotoUrls"].map((x) => x)),
        interestId: json["interestId"],
        isActive: json["isActive"],
        isFeatured: json["isFeatured"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        location: FeaturedServiceLocation.fromJson(json["location"]),
        maximumPersons: json["maximumPersons"],
        minimunPersons: json["minimunPersons"],
        modifiedBy: json["modifiedBy"],
        modifiedOn: json["modifiedOn"],
        photoUrl: json["photoURL"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        requiredPersonalInformation: json["requiredPersonalInformation"],
        reschedulePolicy: json["reschedulePolicy"],
        slots: List<NearbyServiceSlot>.from(json["slots"].map((x) => NearbyServiceSlot.fromJson(x))),
        status: json["status"],
        timings: List<Timing>.from(json["timings"].map((x) => Timing.fromJson(x))),
        title: json["title"],
        totalRating: json["totalRating"],
        vendor: Vendor.fromJson(json["vendor"]),
        whatToExpect: List<WhatToExpect>.from(json["whatToExpect"].map((x) => WhatToExpect.fromJson(x))),
        decisionList: json["decisionList"],
        priceInWords: json["priceInWords"],
        isLiked: json["isLiked"],
        totalReviews: json["totalReviews"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "adrenaline": adrenaline!.toJson(),
        "amenities": List<dynamic>.from(amenities!.map((x) => x)),
        "cancellationPolicy": cancellationPolicy,
        "capacityPerDay": capacityPerDay,
        "category": category.toJson(),
        "createdOn": createdOn,
        "description": description,
        "galleryPhotoUrls": List<dynamic>.from(galleryPhotoUrls.map((x) => x)),
        "interestId": interestId,
        "isActive": isActive,
        "isFeatured": isFeatured,
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "location": location.toJson(),
        "maximumPersons": maximumPersons,
        "minimunPersons": minimunPersons,
        "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn,
        "photoURL": photoUrl,
        "rating": rating,
        "ratingCount": ratingCount,
        "requiredPersonalInformation": requiredPersonalInformation,
        "reschedulePolicy": reschedulePolicy,
        "slots": List<dynamic>.from(slots.map((x) => x.toJson())),
        "status": status,
        "timings": List<dynamic>.from(timings.map((x) => x.toJson())),
        "title": title,
        "totalRating": totalRating,
        "vendor": vendor.toJson(),
        "whatToExpect": List<dynamic>.from(whatToExpect.map((x) => x.toJson())),
        "decisionList": decisionList,
        "priceInWords": priceInWords,
        "isLiked": isLiked,
        "totalReviews": totalReviews,
    };
}

class NearbyServiceSlot {
    NearbyServiceSlot({
        required this.duration,
        required this.price,
        required this.isActive,
        required this.isAgeWisePricingActive,
        required this.discount,
    });

    int duration;
    int price;
    bool isActive;
    bool isAgeWisePricingActive;
    FluffyDiscount discount;

    factory NearbyServiceSlot.fromJson(Map<String, dynamic> json) => NearbyServiceSlot(
        duration: json["duration"],
        price: json["price"],
        isActive: json["isActive"],
        isAgeWisePricingActive: json["isAgeWisePricingActive"],
        discount: FluffyDiscount.fromJson(json["discount"]),
    );

    Map<String, dynamic> toJson() => {
        "duration": duration,
        "price": price,
        "isActive": isActive,
        "isAgeWisePricingActive": isAgeWisePricingActive,
        "discount": discount.toJson(),
    };
}

class FluffyDiscount {
    FluffyDiscount({
        required this.isActive,
    });

    bool isActive;

    factory FluffyDiscount.fromJson(Map<String, dynamic> json) => FluffyDiscount(
        isActive: json["isActive"],
    );

    Map<String, dynamic> toJson() => {
        "isActive": isActive,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
