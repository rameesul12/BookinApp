// To parse this JSON data, do
//
//     final addingScreen = addingScreenFromJson(jsonString);

import 'dart:convert';

AddingScreen addingScreenFromJson(String str) => AddingScreen.fromJson(json.decode(str));

String addingScreenToJson(AddingScreen data) => json.encode(data.toJson());

class AddingScreen {
    bool success;
    String message;
    List<ScreenDeatails> data;

    AddingScreen({
        required this.success,
        required this.message,
        required this.data,
    });

    factory AddingScreen.fromJson(Map<String, dynamic> json) => AddingScreen(
        success: json["success"],
        message: json["message"],
        data: List<ScreenDeatails>.from(json["data"].map((x) => ScreenDeatails.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ScreenDeatails {
    String id;
    String ownerId;
    int screen;
    int rows;
    int columns;
    int totalSeats;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    ScreenDeatails({
        required this.id,
        required this.ownerId,
        required this.screen,
        required this.rows,
        required this.columns,
        required this.totalSeats,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory ScreenDeatails.fromJson(Map<String, dynamic> json) => ScreenDeatails(
        id: json["_id"],
        ownerId: json["ownerId"],
        screen: json["screen"],
        rows: json["rows"],
        columns: json["columns"],
        totalSeats: json["totalSeats"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "ownerId": ownerId,
        "screen": screen,
        "rows": rows,
        "columns": columns,
        "totalSeats": totalSeats,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
