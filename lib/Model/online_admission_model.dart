// To parse this JSON data, do
//
//     final admission = admissionFromJson(jsonString);

import 'dart:convert';

Admission admissionFromJson(String str) => Admission.fromJson(json.decode(str));

String admissionToJson(Admission data) => json.encode(data.toJson());

class Admission {
  Admission({
    required this.name,
    required this.email,
    required this.guardian,
    required this.mobile,
    required this.address,
    required this.date,
  });

  final String name;
  final String email;
  final String guardian;
  final String mobile;
  final String address;
  final DateTime date;

  factory Admission.fromJson(Map<String, dynamic> json) => Admission(
        name: json["Name"],
        email: json["Email"],
        guardian: json["Guardian"],
        mobile: json["Mobile"],
        address: json["Address"],
        date: DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Email": email,
        "Guardian": guardian,
        "Mobile": mobile,
        "Address": address,
        "Date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
