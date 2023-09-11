// To parse this JSON data, do
//
//     final currentUserModal = currentUserModalFromJson(jsonString);

import 'dart:convert';

CurrentUserModal currentUserModalFromJson(String str) => CurrentUserModal.fromJson(json.decode(str));

String currentUserModalToJson(CurrentUserModal data) => json.encode(data.toJson());

class CurrentUserModal {
    bool success;
    String message;
    Data data;

    CurrentUserModal({
        required this.success,
        required this.message,
        required this.data,
    });

    factory CurrentUserModal.fromJson(Map<String, dynamic> json) => CurrentUserModal(
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
    String id;
    String signName;
    int signPhone;
    String signEmail;
    bool block;
    int wallet;
    List<Transaction> transaction;
    int v;

    Data({
        required this.id,
        required this.signName,
        required this.signPhone,
        required this.signEmail,
        required this.block,
        required this.wallet,
        required this.transaction,
        required this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        signName: json["signName"],
        signPhone: json["signPhone"],
        signEmail: json["signEmail"],
        block: json["block"],
        wallet: json["wallet"],
        transaction: List<Transaction>.from(json["transaction"].map((x) => Transaction.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "signName": signName,
        "signPhone": signPhone,
        "signEmail": signEmail,
        "block": block,
        "wallet": wallet,
        "transaction": List<dynamic>.from(transaction.map((x) => x.toJson())),
        "__v": v,
    };
}

class Transaction {
    int amount;
    DateTime date;

    Transaction({
        required this.amount,
        required this.date,
    });

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "date": date.toIso8601String(),
    };
}
