import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/screens/all/all_product_screen.dart';
import 'package:app_ban_dien_thoai/screens/all/components/custom_button.dart';
import 'package:app_ban_dien_thoai/screens/all/components/manufacturer.dart';
import 'package:app_ban_dien_thoai/screens/all/components/product.dart';
import 'package:app_ban_dien_thoai/screens/home/components/menu_and_listcategory_childmenu/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sort extends StatefulWidget {
  Sort({Key? key}) : super(key: key);

  @override
  State<Sort> createState() => _SortState();
}

String? selected2 = titleSort[0];
String? selected;
int from = 0;
int to = 0;
String manufacturerValue = '';
int selectedOk = 999;

class _SortState extends State<Sort> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          CustomDropdownButton2(
            dropdownItems: pricess.map((e) => e['title']).toList().cast(),
            hint: 'Mức giá',
            onChanged: (value) {
              setState(() {
                selected = value;
                for (int i = 0; i < pricess.length; i++) {
                  if (pricess[i]['title'] == value) {
                    to = int.parse(pricess[i]['price'].toString());
                    if (i - 1 > 0) {
                      from = int.parse(pricess[i - 1]['price'].toString());
                    } else {
                      from = 0;
                    }
                  }
                }
              });

              context.read<PhoneS>().SortPhoneByPrice(from, to);
            },
            value: selected,
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              border: Border.all(color: buttonDeflaultColor, width: 1),
            ),
            dropdownDecoration: BoxDecoration(
              border: Border.all(color: buttonDeflaultColor, width: 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          CustomDropdownButton2(
            dropdownItems: titleSort,
            hint: 'Sắp xếp theo',
            onChanged: (value) {
              setState(() {
                selected2 = value;
                context.read<PhoneS>().sort();
                context.read<PhoneS>().SortPhoneByPrice(from, to);
              });
            },
            value: selected2,
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              border: Border.all(color: buttonDeflaultColor, width: 1),
            ),
            dropdownDecoration: BoxDecoration(
              border: Border.all(color: buttonDeflaultColor, width: 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
