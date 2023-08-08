// To parse this JSON data, do
//
//     final getMovies = getMoviesFromJson(jsonString);

import 'dart:convert';

GetMovies getMoviesFromJson(String str) => GetMovies.fromJson(json.decode(str));

String getMoviesToJson(GetMovies data) => json.encode(data.toJson());

class GetMovies {
    bool success;
    String message;
    List<MoviesData> data;

    GetMovies({
        required this.success,
        required this.message,
        required this.data,
    });

    factory GetMovies.fromJson(Map<String, dynamic> json) => GetMovies(
        success: json["success"],
        message: json["message"],
        data: List<MoviesData>.from(json["data"].map((x) => MoviesData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class MoviesData{
    String id;
    int movieId;
    String title;
    String language;
    DateTime releaseDate;
    String image;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    MoviesData({
        required this.id,
        required this.movieId,
        required this.title,
        required this.language,
        required this.releaseDate,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory MoviesData.fromJson(Map<String, dynamic> json) => MoviesData(
        id: json["_id"],
        movieId: json["movieId"],
        title: json["title"],
        language: json["language"],
        releaseDate: DateTime.parse(json["releaseDate"]),
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "movieId": movieId,
        "title": title,
        "language": language,
        "releaseDate": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
