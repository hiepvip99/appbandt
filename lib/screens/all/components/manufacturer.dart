import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/screens/all/components/sort.dart';
import 'package:app_ban_dien_thoai/screens/home/components/menu_and_listcategory_childmenu/menu.dart';
import 'package:app_ban_dien_thoai/settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Manufacturers extends StatefulWidget {
  const Manufacturers({Key? key}) : super(key: key);

  @override
  State<Manufacturers> createState() => _ManufacturersState();
}

class _ManufacturersState extends State<Manufacturers> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: Card(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: manufacturers.length,
            itemBuilder: (context, index) {
              return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: selectedOk == index
                          ? Border.all(
                              color: context.watch<Setting>().isDark
                                  ? buttonDeflaultColor2
                                  : buttonDeflaultColor,
                              width: 2,
                            )
                          : null),
                  child: TextButton(
                      style: TextButton.styleFrom(),
                      onPressed: () {
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
                        });
                      },
                      child: Text(manufacturers[index].toString())));
            },
          ),
        ));
  }
}
