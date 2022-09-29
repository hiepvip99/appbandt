import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/screens/all/components/custom_button.dart';
import 'package:app_ban_dien_thoai/screens/all/components/manufacturer.dart';
import 'package:app_ban_dien_thoai/screens/all/components/product.dart';
import 'package:app_ban_dien_thoai/screens/all/components/sort.dart';
import 'package:app_ban_dien_thoai/screens/home/components/menu_and_listcategory_childmenu/menu.dart';
import 'package:app_ban_dien_thoai/screens/home/home_screen.dart';
import 'package:app_ban_dien_thoai/screens/info/info_screen.dart';
import 'package:app_ban_dien_thoai/settings/setting.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          foregroundColor:
              context.watch<Setting>().isDark ? Colors.white : Colors.black),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text('data')
            Manufacturers(),
            FilterList(),
          ],
        ),
      ),
    );
  }
}

class FilterList extends StatefulWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Sort(), Products()],
      ),
    );
  }
}

List<String> titleSort = [
  'Giá Thấp Đến Cao',
  'Giá Cao Đến Thấp',
  'Nổi bật',
  '% Giảm',
];
