import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.role,
    this.name,
    this.username,
    this.dob,
    this.address,
    this.phone,
    this.history,
    this.salt,
    this.hash,
    this.v,
    this.prescription,
  });

  String id;
  String email;
  String role;
  String name;
  String username;
  String dob;
  String address;
  String phone;
  List<History> history;
  String salt;
  String hash;
  int v;
  String prescription;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        email: json["email"],
        role: json["role"],
        name: json["name"],
        username: json["username"],
        dob: json["dob"],
        address: json["address"],
        phone: json["phone"],
        history:
            List<History>.from(json["history"].map((x) => History.fromJson(x))),
        salt: json["salt"],
        hash: json["hash"],
        v: json["__v"],
        prescription: json["prescription"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "role": role,
        "name": name,
        "username": username,
        "dob": dob,
        "address": address,
        "phone": phone,
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
        "salt": salt,
        "hash": hash,
        "__v": v,
        "prescription": prescription,
      };
}

class History {
  History({
    this.timestamp,
    this.id,
    this.bp,
    this.heartrate,
    this.fever,
    this.sugarlevel,
    this.oxylvl,
    this.message,
  });

  String timestamp;
  String id;
  String bp;
  int heartrate;
  int fever;
  int sugarlevel;
  int oxylvl;
  String message;

  factory History.fromJson(Map<String, dynamic> json) => History(
        timestamp: json["timestamp"],
        id: json["_id"],
        bp: json["bp"],
        heartrate: json["heartrate"],
        fever: json["fever"],
        sugarlevel: json["sugarlevel"],
        oxylvl: json["oxylvl"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "_id": id,
        "bp": bp,
        "heartrate": heartrate,
        "fever": fever,
        "sugarlevel": sugarlevel,
        "oxylvl": oxylvl,
        "message": message,
      };
}
