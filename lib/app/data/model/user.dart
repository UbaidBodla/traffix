import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String uid;
  String email;
  String image;
  String phone;
  String password;
  String gender;
  DateTime date;

  UserModel({this.name, this.uid, this.email, this.image,this.phone,this.password,this.gender,this.date});
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    uid = json['uid'] ?? '';
    email = json['email'] ?? '';
    image = json['image'] ?? '';
    phone = json['Phone'] ?? '';
    password = json['Password'] ?? '';
    gender = json['gender'] ?? '';
    Timestamp time = json['date'] ?? Timestamp.fromDate(DateTime.now());
    print(time);
    date = time.toDate() ;

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['image'] = this.image;
    data['Phone'] = this.phone;
    data['Password'] = this.password;
    data['gender'] = this.gender;
    data['date'] = this.date;

    return data;
  }
}
