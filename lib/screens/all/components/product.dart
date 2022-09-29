import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/network/network_request.dart';
import 'package:app_ban_dien_thoai/screens/all/all_product_screen.dart';
import 'package:app_ban_dien_thoai/screens/all/components/sort.dart';
import 'package:app_ban_dien_thoai/screens/home/home_screen.dart';
import 'package:app_ban_dien_thoai/screens/info/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text('Số lượng điện thoại'),
        GridView.builder(
          // reverse: ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.6),
          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //     childAspectRatio: 0.75, maxCrossAxisExtent: 400),
          itemCount: context.watch<PhoneS>().list_name.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              shadowColor: Colors.black,
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Image.network(
                            NetworkRequest.urlImage +
                                context
                                    .watch<PhoneS>()
                                    .list_name[index]
                                    .images![0],
                            width: 150,
                            height: 200,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          context.watch<PhoneS>().list_name[index].name!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          format(int.parse(context
                              .watch<PhoneS>()
                              .list_name[index]
                              .price![0])),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InFoScreen(
                                    phoneInFo: context
                                        .watch<PhoneS>()
                                        .list_name[index]),
                              ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
