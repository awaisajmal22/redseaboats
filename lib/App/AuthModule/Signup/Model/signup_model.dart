import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    SignUpModel({
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phoneNumber,
        required this.countryCode,
        required this.password,
        required this.photoUrl,
    });

    String firstName;
    String lastName;
    String email;
    String phoneNumber;
    String countryCode;
    String password;
    String photoUrl;

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        countryCode: json["countryCode"],
        password: json["password"],
        photoUrl: json["photoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "countryCode": countryCode,
        "password": password,
        "photoUrl": photoUrl,
    };
}
