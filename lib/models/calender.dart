// To parse this JSON data, do
//
//     final calender = calenderFromJson(jsonString);

import 'dart:convert';

Calender calenderFromJson(String str) => Calender.fromJson(json.decode(str));

String calenderToJson(Calender data) => json.encode(data.toJson());

class Calender {
  Calender({
    this.success,
    this.data,
  });

  bool? success;
  List<CalenderData>? data;

  factory Calender.fromJson(Map<String, dynamic> json) => Calender(
        success: json["success"],
        data: List<CalenderData>.from(
            json["data"].map((x) => CalenderData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CalenderData {
  CalenderData({
    this.maKhoaHoc,
    this.hoTen,
    this.diaChi,
    this.sdt,
    this.ngayBatDau,
    this.soTuan,
    this.ngayKetThuc,
    this.tenMonHoc,
    this.maCaHoc,
    this.gioBatDau,
    this.thoiGian,
    this.gioKetThuc,
    this.maThu,
    this.tenThu,
  });

  int? maKhoaHoc;
  String? hoTen;
  String? diaChi;
  String? sdt;
  dynamic ngayBatDau;
  int? soTuan;
  dynamic? ngayKetThuc;
  String? tenMonHoc;
  int? maCaHoc;
  String? gioBatDau;
  int? thoiGian;
  String? gioKetThuc;
  int? maThu;
  String? tenThu;

  factory CalenderData.fromJson(Map<String, dynamic> json) => CalenderData(
        maKhoaHoc: json["MaKhoaHoc"],
        hoTen: json["HoTen"],
        diaChi: json["DiaChi"],
        sdt: json["SDT"],
        ngayBatDau: json["NgayBatDau"],
        soTuan: json["SoTuan"],
        ngayKetThuc: json["NgayKetThuc"],
        tenMonHoc: json["TenMonHoc"],
        maCaHoc: json["MaCaHoc"],
        gioBatDau: json["GioBatDau"],
        thoiGian: json["ThoiGian"],
        gioKetThuc: json["GioKetThuc"],
        maThu: json["MaThu"],
        tenThu: json["TenThu"],
      );

  Map<String, dynamic> toJson() => {
        "MaKhoaHoc": maKhoaHoc,
        "HoTen": hoTen,
        "DiaChi": diaChi,
        "SDT": sdt,
        "NgayBatDau": ngayBatDau,
        "SoTuan": soTuan,
        "NgayKetThuc": ngayKetThuc,
        "TenMonHoc": tenMonHoc,
        "MaCaHoc": maCaHoc,
        "GioBatDau": gioBatDau,
        "ThoiGian": thoiGian,
        "GioKetThuc": gioKetThuc,
        "MaThu": maThu,
        "TenThu": tenThu,
      };
}
