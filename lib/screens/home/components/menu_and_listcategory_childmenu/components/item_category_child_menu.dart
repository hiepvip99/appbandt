import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/screens/all/all_product_screen.dart';
import 'package:app_ban_dien_thoai/screens/all/components/sort.dart';
import 'package:app_ban_dien_thoai/screens/home/components/menu_and_listcategory_childmenu/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CategoryMenu extends StatefulWidget {
  const CategoryMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryMenu> createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 10,
          child: Column(
            children: [
              Text('Hãng sản xuất'),
              SizedBox(
                height: 5,
              ),
              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: manufacturers.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 2.5, maxCrossAxisExtent: 100),
                itemBuilder: (context, index) {
                  return TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          if (selectedOk == index) {
                            selectedOk = 999;
                            manufacturerValue = '';
                          } else {
                            selectedOk = index;
                            manufacturerValue = manufacturers[index].toString();
                          }
                          context
                              .read<PhoneS>()
                              .SearchManufacturer(manufacturerValue);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllProductScreen(),
                              ));
                        });
                      },
                      child: Text(manufacturers[index]));
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          elevation: 10,
          child: Column(
            children: [
              Text('Mức giá'),
              SizedBox(
                height: 5,
              ),
              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: pricess.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 2.5, maxCrossAxisExtent: 100),
                itemBuilder: (context, index) {
                  return TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(pricess[index]['title']));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
