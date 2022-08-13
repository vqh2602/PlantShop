

import 'dart:convert';



class Bill {
  String? _date;
  int? _sale;
  Address? _address;
  int? _maHD;
  double? _money;
  List<dynamic>? _listPlant;
  String? _status;

  Bill(
      {String? date,
        int? sale,
        Address? address,
        int? maHD,
        double? money,
        List<dynamic>? listPlant,
        String? status}) {
    if (date != null) {
      this._date = date;
    }
    if (sale != null) {
      this._sale = sale;
    }
    if (address != null) {
      this._address = address;
    }
    if (maHD != null) {
      this._maHD = maHD;
    }
    if (money != null) {
      this._money = money;
    }
    if (listPlant != null) {
      this._listPlant = listPlant;
    }
    if (status != null) {
      this._status = status;
    }
  }

  String? get date => _date;
  set date(String? date) => _date = date;
  int? get sale => _sale;
  set sale(int? sale) => _sale = sale;
  Address? get address => _address;
  set address(Address? address) => _address = address;
  int? get maHD => _maHD;
  set maHD(int? maHD) => _maHD = maHD;
  double? get money => _money;
  set money(double? money) => _money = money;
  List<dynamic>? get listPlant => _listPlant;
  set listPlant(List<dynamic>? listPlant) => _listPlant = listPlant;
  String? get status => _status;
  set status(String? status) => _status = status;

  Bill.fromJson(Map<dynamic, dynamic> json) {
    _date = json['date'].toString();
    _sale = json['sale'];
    _address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    _maHD = json['maHD'];
    _money = json['money'];
    _listPlant = jsonDecode(json['listPlant']);
        // jsonDecode(json['listPlant']).map((job) => MyCart1.fromJson(job)).toList();
    //MyCart1.fromJson(jsonDecode(json['listPlant'])) as List<MyCart1>?;
    _status = json['status'].toString();
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this._date;
    data['sale'] = this._sale;
    if (this._address != null) {
      data['address'] = this._address!.toJson();
    }
    data['maHD'] = this._maHD;
    data['money'] = this._money;
    data['listPlant'] = this._listPlant;
    data['status'] = this._status;
    return data;
  }
}

class Address {
  String? _address;
  String? _phone;
  String? _name;

  Address({String? address, String? phone, String? name}) {
    if (address != null) {
      this._address = address;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (name != null) {
      this._name = name;
    }
  }

  String? get address => _address;
  set address(String? address) => _address = address;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get name => _name;
  set name(String? name) => _name = name;

  Address.fromJson(Map<dynamic, dynamic> json) {
    _address = json['address'].toString();
    _phone = json['phone'].toString();
    _name = json['name'].toString();
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this._address;
    data['phone'] = this._phone;
    data['name'] = this._name;
    return data;
  }
}

// class ListPlant {
//   Plant? plant;
//
//   ListPlant({this.plant});
//
//   ListPlant.fromJson(Map<String, dynamic> json) {
//     plant = json['plant'] != null ? new Plant.fromJson(json['plant']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.plant != null) {
//       data['plant'] = this.plant!.toJson();
//     }
//     return data;
//   }
// }

class Plant1 {
  int? plantID;
  int? number;

  Plant1({this.plantID, this.number});

  Plant1.fromJson(Map<dynamic, dynamic> json) {
    plantID = json['plantID'];
    number = json['number'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['plantID'] = this.plantID;
    data['number'] = this.number;
    return data;
  }
}