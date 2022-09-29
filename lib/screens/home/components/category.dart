import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/category.dart';
import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/screens/all/all_product_screen.dart';
import 'package:app_ban_dien_thoai/screens/all/components/sort.dart';
import 'package:app_ban_dien_thoai/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: buttonDeflaultColor,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                    ),
                    onPressed: () {
                      if (index == 0) {
                        setState(() {
                          context.read<PhoneS>().sort();
                          context.read<PhoneS>().SortPhoneByPrice(from, to);
                          context
                              .read<PhoneS>()
                              .SearchManufacturer(manufacturerValue);
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllProductScreen(),
                            ));
                      }
                    },
                    child: categories[index].icon,
                  ),
                  Text('${categories[index].name}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
