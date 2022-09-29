import 'package:animate_do/animate_do.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:app_ban_dien_thoai/models/category.dart';
import 'package:app_ban_dien_thoai/screens/home/components/menu_and_listcategory_childmenu/components/list_category.dart';
import 'package:app_ban_dien_thoai/settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          child: Text(
                            'SignIn',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {},
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'SignIn to buy products',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SwitchListTile(
              title: Text('Chế độ tối'),
              value: context.watch<Setting>().isDark,
              onChanged: (value) {
                context.read<Setting>().change(value);
              },
            ),
            ListCategory(),
          ],
        ),
      ),
    );
  }
}

List<String> manufacturers = [
  'Apple',
  'XiaoMi',
  'SamSung',
  'Oppo',
  'Nokia',
  'Realme',
  'Vivo',
  'Techno',
  'Nubia',
];

// List<Prices> prices = [
//   Prices(title: 'Dưới 1 triệu', price: 1000000),
//   Prices(title: 'Từ 1 - 3 triệu', price: 1000000),
//   Prices(title: 'Từ 3 - 6 triệu', price: 1000000),
//   Prices(title: 'Từ 6 - 9 triệu', price: 1000000),
//   Prices(title: 'Từ 9 - 12 triệu', price: 1000000),
//   Prices(title: 'Từ 12 - 15 triệu', price: 1000000),
//   Prices(title: 'Trên 15 triệu', price: 1000000),
// ];

List<Map<String, dynamic>> pricess = [
  {
    'title': 'Tất cả',
    'price': 0,
  },
  {
    'title': 'Dưới 1 triệu',
    'price': 1000000,
  },
  {
    'title': 'Từ 1 - 3 triệu',
    'price': 3000000,
  },
  {
    'title': 'Từ 3 - 6 triệu',
    'price': 6000000,
  },
  {
    'title': 'Từ 6 - 9 triệu',
    'price': 9000000,
  },
  {
    'title': 'Từ 9 - 12 triệu',
    'price': 12000000,
  },
  {
    'title': 'Từ 12 - 15 triệu',
    'price': 15000000,
  },
  {
    'title': 'Trên 15 triệu',
    'price': 100000000,
  },
];

// class Prices {
//   String title;
//   int price;
//   Prices({required this.title, required this.price});
// }
