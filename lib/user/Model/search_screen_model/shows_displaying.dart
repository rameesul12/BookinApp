// To parse this JSON data, do
//
//     final searchShowDisplaying = searchShowDisplayingFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

SearchShowDisplaying searchShowDisplayingFromJson(String str) => SearchShowDisplaying.fromJson(json.decode(str));

String searchShowDisplayingToJson(SearchShowDisplaying data) => json.encode(data.toJson());

class SearchShowDisplaying {
    bool success;
    String message;
    Data data;

    SearchShowDisplaying({
        required this.success,
        required this.message,
        required this.data,
    });

    factory SearchShowDisplaying.fromJson(Map<String, dynamic> json) => SearchShowDisplaying(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Owner? owner;
    List<Show> shows;

    Data({
        required this.owner,
        required this.shows,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        owner: Owner.fromJson(json["owner"]),
        shows: List<Show>.from(json["shows"].map((x) => Show.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "owner": owner?.toJson(),
        "shows": List<dynamic>.from(shows.map((x) => x.toJson())),
    };
}

class Owner {
    String? id;
    String? name;
    int? phone;
    String? email;
    String? licence;
    int? adhaar;
    String? location;
    int? wallet;
    String? images;
    String? status;
    bool? block;
    int? v;

    Owner({
        required this.id,
        required this.name,
        required this.phone,
        required this.email,
        required this.licence,
        required this.adhaar,
        required this.location,
        required this.wallet,
        required this.images,
        required this.status,
        required this.block,
        required this.v,
    });

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["_id"],
        name: json["Name"],
        phone: json["Phone"],
        email: json["Email"],
        licence: json["Licence"],
        adhaar: json["Adhaar"],
        location: json["Location"],
        wallet: json["wallet"],
        images: json["images"],
        status: json["status"],
        block: json["block"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Name": name,
        "Phone": phone,
        "Email": email,
        "Licence": licence,
        "Adhaar": adhaar,
        "Location": location,
        "wallet": wallet,
        "images": images,
        "status": status,
        "block": block,
        "__v": v,
    };
}

class Show {
    String id;
    String screenId;
    String ownerId;
    String ownerName;
    String location;
    String movieName;
    String showTime;
    DateTime startDate;
    DateTime endDate;
    int price;
    int screen;
    List<Date> dates;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Show({
        required this.id,
        required this.screenId,
        required this.ownerId,
        required this.ownerName,
        required this.location,
        required this.movieName,
        required this.showTime,
        required this.startDate,
        required this.endDate,
        required this.price,
        required this.screen,
        required this.dates,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Show.fromJson(Map<String, dynamic> json) => Show(
        id: json["_id"],
        screenId: json["screenId"],
        ownerId: json["ownerId"],
        ownerName: json["ownerName"],
        location: json["location"],
        movieName: json["movieName"],
        showTime: json["showTime"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        price: json["price"],
        screen: json["screen"],
        dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "screenId": screenId,
        "ownerId": ownerId,
        "ownerName": ownerName,
        "location": location,
        "movieName": movieName,
        "showTime": showTime,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "price": price,
        "screen": screen,
        "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Date {
    DateTime date;
    List<Seat>? seats;

    Date({
        required this.date,
        this.seats,
    });

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        date: DateTime.parse(json["date"]),
        seats: json["seats"] == null ? [] : List<Seat>.from(json["seats"]!.map((x) => Seat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "seats": seats == null ? [] : List<dynamic>.from(seats!.map((x) => x.toJson())),
    };
}

class Seat {
    String id;
    SeatStatus seatStatus;

    Seat({
        required this.id,
        required this.seatStatus,
    });

    factory Seat.fromJson(Map<String, dynamic> json) => Seat(
        id: json["id"],
        seatStatus: seatStatusValues.map[json["seatStatus"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "seatStatus": seatStatusValues.reverse[seatStatus],
    };
}

enum SeatStatus {
    AVAILABLE
}

final seatStatusValues = EnumValues({
    "available": SeatStatus.AVAILABLE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
