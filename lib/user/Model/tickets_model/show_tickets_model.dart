// To parse this JSON data, do
//
//     final showTicketModal = showTicketModalFromJson(jsonString);

import 'dart:convert';

ShowTicketModel showTicketModalFromJson(String str) => ShowTicketModel.fromJson(json.decode(str));

String showTicketModalToJson(ShowTicketModel data) => json.encode(data.toJson());

class ShowTicketModel {
    bool success;
    Data data;

    ShowTicketModel({
        required this.success,
        required this.data,
    });

    factory ShowTicketModel.fromJson(Map<String, dynamic> json) => ShowTicketModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
    };
}

class Data {
    dynamic order;
    Bookings bookings;

    Data({
        required this.order,
        required this.bookings,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        order: json["order"],
        bookings: Bookings.fromJson(json["bookings"]),
    );

    Map<String, dynamic> toJson() => {
        "order": order,
        "bookings": bookings.toJson(),
    };
}

class Bookings {
    String id;
    String userId;
    String ownerId;
    String userName;
    String movieName;
    String ownerName;
    String location;
    String showTime;
    DateTime date;
    List<SelectedSeat> selectedSeats;
    String bookingId;
    int subtotal;
    double fee;
    double total;
    int screen;
    String status;
    String language;
    String image;
    String paymentstatus;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Bookings({
        required this.id,
        required this.userId,
        required this.ownerId,
        required this.userName,
        required this.movieName,
        required this.ownerName,
        required this.location,
        required this.showTime,
        required this.date,
        required this.selectedSeats,
        required this.bookingId,
        required this.subtotal,
        required this.fee,
        required this.total,
        required this.screen,
        required this.status,
        required this.language,
        required this.image,
        required this.paymentstatus,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Bookings.fromJson(Map<String, dynamic> json) => Bookings(
        id: json["_id"],
        userId: json["userId"],
        ownerId: json["ownerId"],
        userName: json["userName"],
        movieName: json["movieName"],
        ownerName: json["ownerName"],
        location: json["location"],
        showTime: json["showTime"],
        date: DateTime.parse(json["date"]),
        selectedSeats: List<SelectedSeat>.from(json["selectedSeats"].map((x) => SelectedSeat.fromJson(x))),
        bookingId: json["bookingId"],
        subtotal: json["subtotal"],
        fee: json["fee"]?.toDouble(),
        total: json["total"]?.toDouble(),
        screen: json["screen"],
        status: json["status"],
        language: json["language"],
        image: json["image"],
        paymentstatus: json["paymentstatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "ownerId": ownerId,
        "userName": userName,
        "movieName": movieName,
        "ownerName": ownerName,
        "location": location,
        "showTime": showTime,
        "date": date.toIso8601String(),
        "selectedSeats": List<dynamic>.from(selectedSeats.map((x) => x.toJson())),
        "bookingId": bookingId,
        "subtotal": subtotal,
        "fee": fee,
        "total": total,
        "screen": screen,
        "status": status,
        "language": language,
        "image": image,
        "paymentstatus": paymentstatus,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class SelectedSeat {
    String id;

    SelectedSeat({
        required this.id,
    });

    factory SelectedSeat.fromJson(Map<String, dynamic> json) => SelectedSeat(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}
