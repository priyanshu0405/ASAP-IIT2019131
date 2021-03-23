import 'dart:convert';

UpdateModel updateModelFromJson(String str) =>
    UpdateModel.fromJson(json.decode(str));

String updateModelToJson(UpdateModel data) => json.encode(data.toJson());

class UpdateModel {
  UpdateModel({
    this.message,
    this.founduser,
  });

  String message;
  Founduser founduser;

  factory UpdateModel.fromJson(Map<String, dynamic> json) => UpdateModel(
        message: json["message"],
        founduser: Founduser.fromJson(json["founduser"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "founduser": founduser.toJson(),
      };
}

class Founduser {
  Founduser({
    this.id,
    this.email,
    this.role,
    this.name,
    this.username,
    this.dob,
    this.address,
    this.phone,
    this.history,
    this.v,
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
  int v;

  factory Founduser.fromJson(Map<String, dynamic> json) => Founduser(
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
        v: json["__v"],
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
        "__v": v,
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
  });

  String timestamp;
  String id;
  String bp;
  int heartrate;
  int fever;
  int sugarlevel;
  int oxylvl;

  factory History.fromJson(Map<String, dynamic> json) => History(
        timestamp: json["timestamp"],
        id: json["_id"],
        bp: json["bp"] == null ? null : json["bp"],
        heartrate: json["heartrate"] == null ? null : json["heartrate"],
        fever: json["fever"] == null ? null : json["fever"],
        sugarlevel: json["sugarlevel"] == null ? null : json["sugarlevel"],
        oxylvl: json["oxylvl"] == null ? null : json["oxylvl"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "_id": id,
        "bp": bp == null ? null : bp,
        "heartrate": heartrate == null ? null : heartrate,
        "fever": fever == null ? null : fever,
        "sugarlevel": sugarlevel == null ? null : sugarlevel,
        "oxylvl": oxylvl == null ? null : oxylvl,
      };
}
