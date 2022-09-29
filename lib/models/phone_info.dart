import 'package:app_ban_dien_thoai/network/network_request.dart';
import 'package:app_ban_dien_thoai/screens/all/all_product_screen.dart';
import 'package:app_ban_dien_thoai/screens/all/components/sort.dart';
import 'package:flutter/cupertino.dart';

class PhoneInFo {
  String? sId;
  String? manufacturer;
  List<String>? colors;
  String? name;
  List<String>? images;
  String? cpu;
  String? gpu;
  String? screen;
  String? camera;
  String? battery;
  String? numOfSim;
  String? os;
  String? origin;
  String? releaseTime;
  List<String>? ramRom;
  List<String>? price;

  PhoneInFo(
      {this.sId,
      this.manufacturer,
      this.colors,
      this.name,
      this.images,
      this.cpu,
      this.gpu,
      this.screen,
      this.camera,
      this.battery,
      this.numOfSim,
      this.os,
      this.origin,
      this.releaseTime,
      this.ramRom,
      this.price});

  PhoneInFo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    manufacturer = json['manufacturer'];
    colors = json['colors'].cast<String>();
    name = json['name'];
    images = json['images'].cast<String>();
    cpu = json['cpu'];
    gpu = json['gpu'];
    screen = json['screen'];
    camera = json['camera'];
    battery = json['battery'];
    numOfSim = json['numOfSim'];
    os = json['os'];
    origin = json['origin'];
    releaseTime = json['releaseTime'];
    ramRom = json['ramRom'].cast<String>();
    price = json['price'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['manufacturer'] = this.manufacturer;
    data['colors'] = this.colors;
    data['name'] = this.name;
    data['images'] = this.images;
    data['cpu'] = this.cpu;
    data['gpu'] = this.gpu;
    data['screen'] = this.screen;
    data['camera'] = this.camera;
    data['battery'] = this.battery;
    data['numOfSim'] = this.numOfSim;
    data['os'] = this.os;
    data['origin'] = this.origin;
    data['releaseTime'] = this.releaseTime;
    data['ramRom'] = this.ramRom;
    data['price'] = this.price;
    return data;
  }
}

class PhoneS extends ChangeNotifier {
  List<PhoneInFo> phones = [];
  List<PhoneInFo> apple = [];
  void importData(List<PhoneInFo> value) {
    phones = value;
    for (int i = 0; i < phones.length; i++) {
      if (phones[i].manufacturer!.toString() == "Apple") {
        apple.add(phones[i]);
      }
    }
    notifyListeners();
  }

  List<PhoneInFo> get listphone => sortList;
  List<PhoneInFo> sortList = [];
  void sort() {
    sortList = phones.toList();
    PhoneInFo tg;
    if (selected2 == titleSort[0]) {
      for (int i = 0; i < sortList.length - 1; i++) {
        for (int j = i + 1; j < sortList.length; j++) {
          if (int.parse(sortList[i].price![0].toString()) >
              int.parse(sortList[j].price![0].toString())) {
            tg = sortList[i];
            sortList[i] = sortList[j];
            sortList[j] = tg;
          }
        }
      }
    } else {
      for (int i = 0; i < sortList.length - 1; i++) {
        for (int j = i + 1; j < sortList.length; j++) {
          if (int.parse(sortList[i].price![0].toString()) <
              int.parse(sortList[j].price![0].toString())) {
            tg = sortList[i];
            sortList[i] = sortList[j];
            sortList[j] = tg;
          }
        }
      }
    }

    notifyListeners();
  }

  List<PhoneInFo> _list_search = [];

  List<PhoneInFo> get list_search => _list_search;

  List<PhoneInFo> search(String value) {
    _list_search.removeRange(0, _list_search.length);
    if (value.length > 0) {
      for (int i = 0; i < phones.length; i++) {
        if (phones[i].name!.toLowerCase().contains(value.toLowerCase())) {
          _list_search.add(phones[i]);
          print(phones[i]);
        }
      }
    }

    notifyListeners();
    return _list_search;
  }

  List<PhoneInFo> _list_name = [];

  List<PhoneInFo> get list_name => _list_name;

  List<PhoneInFo> SearchManufacturer(String value) {
    _list_name.removeRange(0, _list_name.length);
    for (int i = 0; i < _listPhonebyPrice.length; i++) {
      if (_listPhonebyPrice[i]
          .manufacturer!
          .toLowerCase()
          .contains(value.toLowerCase())) {
        _list_name.add(_listPhonebyPrice[i]);
      }
    }

    notifyListeners();
    return _list_name;
  }

  String _selectValue = '';

  String get selectValue => _selectValue;

  void setStringValue(String value) {
    _selectValue = value;
    notifyListeners();
  }

  List<PhoneInFo> _listPhonebyPrice = [];

  List<PhoneInFo> get listPhonebyPrice => _listPhonebyPrice;

  void SortPhoneByPrice(int from, int to) {
    _listPhonebyPrice.removeRange(0, _listPhonebyPrice.length);
    for (int i = 0; i < sortList.length; i++) {
      if (int.parse(sortList[i].price![0]) < to &&
          int.parse(sortList[i].price![0]) >= from) {
        _listPhonebyPrice.add(sortList[i]);
      }
    }
    if (from == to) {
      for (int i = 0; i < sortList.length; i++) {
        _listPhonebyPrice.add(sortList[i]);
      }
    }
    SearchManufacturer(manufacturerValue);
    notifyListeners();
  }
}
