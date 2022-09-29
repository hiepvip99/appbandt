import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/screens/home/components/appbar.dart';
import 'package:app_ban_dien_thoai/screens/home/components/apple_product.dart';
import 'package:app_ban_dien_thoai/screens/home/components/category.dart';
import 'package:app_ban_dien_thoai/screens/home/components/list_search.dart';
import 'package:app_ban_dien_thoai/screens/home/components/menu_and_listcategory_childmenu/menu.dart';
import 'package:app_ban_dien_thoai/screens/home/components/products.dart';
import 'package:app_ban_dien_thoai/screens/home/components/promotion.dart';
import 'package:app_ban_dien_thoai/screens/home/components/slider.dart';
import 'package:app_ban_dien_thoai/screens/home/components/tab_category.dart';
import 'package:app_ban_dien_thoai/screens/info/info_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        drawer: Menu(),
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Search_List(),
              Categories(),
              SliderS(),
              Promotion(),
              TabCategory(),
              AppleProduct(),
              Products(),
            ],
          ),
        ),
      ),
    );
  }
}

String format(int value) {
  String a = '';
  var fm = NumberFormat("###,###,###,###", 'en-Us');
  a = fm.format(value) + ' đ';
  return a;
}

List listTest = [1, 2, 3, 4, 5];
