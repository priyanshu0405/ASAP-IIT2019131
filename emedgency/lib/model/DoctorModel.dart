import 'dart:convert';

List<DoctorModel> doctorModelFromJson(String str) => List<DoctorModel>.from(
    json.decode(str).map((x) => DoctorModel.fromJson(x)));

String doctorModelToJson(List<DoctorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorModel {
  DoctorModel({
    this.id,
    this.patients,
    this.email,
    this.username,
    this.v,
  });

  String id;
  Patients patients;
  String email;
  String username;
  int v;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json["_id"],
        patients: Patients.fromJson(json["patients"]),
        email: json["email"],
        username: json["username"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "patients": patients.toJson(),
        "email": email,
        "username": username,
        "__v": v,
      };
}

class Patients {
  Patients({
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

  factory Patients.fromJson(Map<String, dynamic> json) => Patients(
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
