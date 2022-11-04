// To parse this JSON data, do
//
//     final timeAndSubject = timeAndSubjectFromJson(jsonString);

import 'dart:convert';

TimeAndSubject timeAndSubjectFromJson(String str) =>
    TimeAndSubject.fromJson(json.decode(str));

String timeAndSubjectToJson(TimeAndSubject data) => json.encode(data.toJson());

class TimeAndSubject {
  TimeAndSubject({
    this.success,
    this.data,
  });

  bool? success;
  Data? data;

  factory TimeAndSubject.fromJson(Map<String, dynamic> json) => TimeAndSubject(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.monHoc,
    this.caHoc,
    this.thuTrongTuan,
    this.soTienBuoiHoc,
  });

  List<MonHoc>? monHoc;
  List<CaHoc>? caHoc;
  List<ThuTrongTuan>? thuTrongTuan;
  List<SoTienBuoiHoc>? soTienBuoiHoc;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        monHoc:
            List<MonHoc>.from(json["MonHoc"].map((x) => MonHoc.fromJson(x))),
        caHoc: List<CaHoc>.from(json["CaHoc"].map((x) => CaHoc.fromJson(x))),
        thuTrongTuan: List<ThuTrongTuan>.from(
            json["ThuTrongTuan"].map((x) => ThuTrongTuan.fromJson(x))),
        soTienBuoiHoc: List<SoTienBuoiHoc>.from(
            json["SoTienBuoiHoc"].map((x) => SoTienBuoiHoc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "MonHoc": List<dynamic>.from(monHoc!.map((x) => x.toJson())),
        "CaHoc": List<dynamic>.from(caHoc!.map((x) => x.toJson())),
        "ThuTrongTuan":
            List<dynamic>.from(thuTrongTuan!.map((x) => x.toJson())),
        "SoTienBuoiHoc":
            List<dynamic>.from(soTienBuoiHoc!.map((x) => x.toJson())),
      };
}

class CaHoc {
  CaHoc({
    this.maCaHoc,
    this.gioBatDau,
    this.thoiGian,
    this.gioKetThuc,
  });

  int? maCaHoc;
  String? gioBatDau;
  int? thoiGian;
  String? gioKetThuc;

  factory CaHoc.fromJson(Map<String, dynamic> json) => CaHoc(
        maCaHoc: json["MaCaHoc"],
        gioBatDau: json["GioBatDau"],
        thoiGian: json["ThoiGian"],
        gioKetThuc: json["GioKetThuc"],
      );

  Map<String, dynamic> toJson() => {
        "MaCaHoc": maCaHoc,
        "GioBatDau": gioBatDau,
        "ThoiGian": thoiGian,
        "GioKetThuc": gioKetThuc,
      };
}

class MonHoc {
  MonHoc({
    this.maMonHoc,
    this.tenMonHoc,
  });

  int? maMonHoc;
  String? tenMonHoc;

  factory MonHoc.fromJson(Map<String, dynamic> json) => MonHoc(
        maMonHoc: json["MaMonHoc"],
        tenMonHoc: json["TenMonHoc"],
      );

  Map<String, dynamic> toJson() => {
        "MaMonHoc": maMonHoc,
        "TenMonHoc": tenMonHoc,
      };
}

class SoTienBuoiHoc {
  SoTienBuoiHoc({
    this.maSoTien,
    this.soTien,
    this.hienThi,
  });

  int? maSoTien;
  int? soTien;
  int? hienThi;

  factory SoTienBuoiHoc.fromJson(Map<String, dynamic> json) => SoTienBuoiHoc(
        maSoTien: json["MaSoTien"],
        soTien: json["SoTien"],
        hienThi: json["HienThi"],
      );

  Map<String, dynamic> toJson() => {
        "MaSoTien": maSoTien,
        "SoTien": soTien,
        "HienThi": hienThi,
      };
}

class ThuTrongTuan {
  ThuTrongTuan({
    this.maThu,
    this.tenThu,
  });

  int? maThu;
  String? tenThu;

  factory ThuTrongTuan.fromJson(Map<String, dynamic> json) => ThuTrongTuan(
        maThu: json["MaThu"],
        tenThu: json["TenThu"],
      );

  Map<String, dynamic> toJson() => {
        "MaThu": maThu,
        "TenThu": tenThu,
      };
}
