// To parse this JSON data, do
//
//     final seatsModelClass = seatsModelClassFromJson(jsonString);

import 'dart:convert';

SeatsModelClass seatsModelClassFromJson(String str) => SeatsModelClass.fromJson(json.decode(str));

String seatsModelClassToJson(SeatsModelClass data) => json.encode(data.toJson());

class SeatsModelClass {
    bool success;
    String message;
    Data data;

    SeatsModelClass({
        required this.success,
        required this.message,
        required this.data,
    });

    factory SeatsModelClass.fromJson(Map<String, dynamic> json) => SeatsModelClass(
        success: json["success"]??false,
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
    Seats seats;
    Screen screen;
    ShowData showData;

    Data({
        required this.seats,
        required this.screen,
        required this.showData,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        seats: Seats.fromJson(json["seats"]),
        screen: Screen.fromJson(json["screen"]),
        showData: ShowData.fromJson(json["showData"]),
    );

    Map<String, dynamic> toJson() => {
        "seats": seats.toJson(),
        "screen": screen.toJson(),
        "showData": showData.toJson(),
    };
}


class Screen {
    String id;
    String ownerId;
    int screen;
    int rows;
    int columns;
    int totalSeats;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Screen({
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

    factory Screen.fromJson(Map<String, dynamic> json) => Screen(
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

class Seats{
    String id;
    List<Date> dates;

    Seats({
        required this.id,
        required this.dates,
    });

    factory Seats.fromJson(Map<String, dynamic> json) => Seats(
        id: json["_id"],
        dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
    };
}

class Date {
    DateTime date;
    List<Seat> seats;

    Date({
        required this.date,
        required this.seats,
    });

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        date: DateTime.parse(json["date"]),
        seats: List<Seat>.from(json["seats"].map((x) => Seat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "seats": List<dynamic>.from(seats.map((x) => x.toJson())),
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
    // ignore: constant_identifier_names
    AVAILABLE
}

final seatStatusValues = EnumValues({
    "available": SeatStatus.AVAILABLE
});

class ShowData {
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

    ShowData({
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

    factory ShowData.fromJson(Map<String, dynamic> json) => ShowData(
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
