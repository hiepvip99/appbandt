import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Phone> _phoness = [];

  List<Phone> get phoness => _phoness;

  int _select = 0;

  int get select => _select;

  void setSelect(int value) {
    _select = value;
    notifyListeners();
  }

  void addToCartVip(Phone value) {
    int count = 0;
    int position = 500;

    for (int i = 0; i < _phoness.length; i++) {
      if (_phoness[i].phoneInFo.name == value.phoneInFo.name) {
        if (_phoness[i].index == value.index) {
          count++;
          position = i;
        }
      }
    }

    if (count > 0) {
      _phoness[position].amount += 1;
    } else {
      _phoness.add(value);
    }

    notifyListeners();
  }

  void reduceProductInCart(int index) {
    if (_phoness[index].amount < 2) {
      _phoness.removeAt(index);
    } else {
      _phoness[index].amount--;
    }
    notifyListeners();
  }

  void augmentProductInCart(int index) {
    _phoness[index].amount++;
    notifyListeners();
  }

  void removeProductInCart(int index) {
    _phoness.removeAt(index);
    notifyListeners();
  }

  int totalCart() {
    int total = 0;
    for (int i = 0; i < _phoness.length; i++) {
      total +=
          int.parse(phoness[i].phoneInFo.price![phoness[i].index].toString()) *
              phoness[i].amount;
    }
    return total;
  }
}

class Phone {
  final PhoneInFo phoneInFo;
  final int index;
  int amount;

  Phone(this.phoneInFo, this.index, this.amount);
}
