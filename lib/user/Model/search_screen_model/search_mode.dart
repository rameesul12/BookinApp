// To parse this JSON data, do
//
//     final upcomingMovies = upcomingMoviesFromJson(jsonString);

import 'dart:convert';

SearchData upcomingMoviesFromJson(String str) => SearchData.fromJson(json.decode(str));

String upcomingMoviesToJson(SearchData data) => json.encode(data.toJson());

class SearchData {
    bool success;
    String message;
    List<Details> data;

    SearchData({
        required this.success,
        required this.message,
        required this.data,
    });

    factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
        success: json["success"],
        message: json["message"],
        data: List<Details>.from(json["data"].map((x) => Details.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Details {
    String? id;
    int? movieId;
    String? title;
    String? language;
    DateTime? releaseDate;
    String? image;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? name;
    int? phone;
    String? email;
    String? licence;
    int? adhaar;
    String? location;
    String? password;
    int? wallet;
    String? images;
    String? status;
    bool? block;

    Details({
        required this.id,
        this.movieId,
        this.title,
        this.language,
        this.releaseDate,
        this.image,
        this.createdAt,
        this.updatedAt,
        required this.v,
        this.name,
        this.phone,
        this.email,
        this.licence,
        this.adhaar,
        this.location,
        this.password,
        this.wallet,
        this.images,
        this.status,
        this.block,
    });

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["_id"],
        movieId: json["movieId"],
        title: json["title"],
        language: json["language"],
        releaseDate: json["releaseDate"] == null ? null : DateTime.parse(json["releaseDate"]),
        image: json["image"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        name: json["Name"],
        phone: json["Phone"],
        email: json["Email"],
        licence: json["Licence"],
        adhaar: json["Adhaar"],
        location: json["Location"],
        password: json["Password"],
        wallet: json["wallet"],
        images: json["images"],
        status: json["status"],
        block: json["block"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "movieId": movieId,
        "title": title,
        "language": language,
        "releaseDate": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "image": image,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "Name": name,
        "Phone": phone,
        "Email": email,
        "Licence": licence,
        "Adhaar": adhaar,
        "Location": location,
        "Password": password,
        "wallet": wallet,
        "images": images,
        "status": status,
        "block": block,
    };
}
