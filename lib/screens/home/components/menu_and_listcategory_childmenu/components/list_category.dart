import 'package:app_ban_dien_thoai/models/category.dart';
import 'package:app_ban_dien_thoai/screens/home/components/menu_and_listcategory_childmenu/menu.dart';
import 'package:app_ban_dien_thoai/screens/home/components/menu_and_listcategory_childmenu/components/item_category.dart';
import 'package:flutter/material.dart';

class ListCategory extends StatefulWidget {
  ListCategory({Key? key}) : super(key: key);

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Item(
            index: index,
          );
        },
      ),
    );
  }
}
