import 'package:flutter/material.dart';

class Category {
  final String name;
  final Icon icon;

  Category({required this.name, required this.icon});
}

List<Category> categories = [
  Category(name: 'Điện thoại', icon: Icon(Icons.phone_iphone)),
  Category(name: 'Đồng hồ', icon: Icon(Icons.watch)),
  Category(name: 'Laptop', icon: Icon(Icons.laptop)),
  Category(name: 'Màn hình', icon: Icon(Icons.monitor)),
  Category(name: 'Smart TV', icon: Icon(Icons.tv)),
  Category(name: 'Tablet', icon: Icon(Icons.tablet_android)),
  Category(name: 'Âm thanh', icon: Icon(Icons.headphones)),
  Category(name: 'Smart home', icon: Icon(Icons.home_outlined)),
  Category(name: 'Phụ kiện', icon: Icon(Icons.headset_mic_outlined)),
  Category(
      name: 'Đồ chơi công nghệ', icon: Icon(Icons.sports_esports_outlined)),
  Category(name: 'Máy trôi', icon: Icon(Icons.device_unknown)),
  Category(name: 'Sửa chữa', icon: Icon(Icons.handyman_outlined)),
  Category(name: 'Sim thẻ', icon: Icon(Icons.sim_card_outlined)),
  Category(name: 'Tin tức', icon: Icon(Icons.newspaper)),
  Category(name: 'Ưu đãi', icon: Icon(Icons.flash_on)),
];
