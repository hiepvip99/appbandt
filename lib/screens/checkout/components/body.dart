import 'dart:convert';

import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/cart.dart';
import 'package:app_ban_dien_thoai/screens/checkout/components/childWidget/order_infomation.dart';
import 'package:app_ban_dien_thoai/screens/home/home_screen.dart';
import 'package:app_ban_dien_thoai/settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OrderInfomation(),
          OrderMoney(),
        ],
      ),
    );
  }
}

class OrderMoney extends StatefulWidget {
  const OrderMoney({Key? key}) : super(key: key);

  @override
  State<OrderMoney> createState() => _OrderMoneyState();
}

class _OrderMoneyState extends State<OrderMoney> {
  Future add(String intoMoney, List<String> productInfo) async {
    final response =
        await http.post(Uri.parse('http://192.168.0.106:8000/order/add'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, dynamic>{
              "name": name.text,
              "phoneNumber": phone.text,
              "address": address.text,
              "note": note.text,
              "intoMoney": intoMoney,
              "productInfo": productInfo,
            }));

    if (response.statusCode == 200) {
      showBottomSheet(
        context: context,
        builder: (context) => Text("Tạo đơn hàng thành công"),
      );
    }
  }
  // Future add() async {
  //   final response = await http.post(
  //       Uri.parse('http://192.168.0.105:81/vip/api/post/add.php'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode(<String, dynamic>{
  //         "name": 'dadsad',
  //         "phonenumber": 'ipippu',
  //         "address": 'eqewr',
  //         "note": 'ljdss',
  //         // "name": name.text,
  //         // "phonenumber": phone.text,
  //         // "address": address.text,
  //         // "note": note.text,
  //         // "intomoney": /*format(context.watch<Cart>().totalCart())*/ '0',
  //         // "productinfo": 'khong co',
  //       }));

  //   if (response.statusCode == 201) {
  //     // If the server did return a 201 CREATED response,
  //     // then parse the JSON.
  //     // return Album.fromJson(jsonDecode(response.body));
  //     print('Thành công');
  //   }
  //   //  else {
  //   //   // If the server did not return a 201 CREATED response,
  //   //   // then throw an exception.
  //   //   throw Exception('Failed to create album.');
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'Tổng thanh toán: ' + format(context.watch<Cart>().totalCart()),
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          // width: 100,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: context.watch<Setting>().isDark
                    ? buttonDeflaultColor2
                    : buttonDeflaultColor),
            child: Text('Xác nhận đặt hàng'),
            onPressed: () {
              // Insert();
              String itmn =
                  format(Provider.of<Cart>(context, listen: false).totalCart());
              List<String> pdif = Provider.of<Cart>(context, listen: false)
                  .phoness
                  .map((e) =>
                      "${e.phoneInFo.name} + ${e.phoneInFo.ramRom![e.index]} x ${e.amount}")
                  .toList();
              // print(Provider.of<Cart>(context, listen: false)
              //     .phoness
              //     .map((e) =>
              //         "${e.phoneInFo.name} + ${e.phoneInFo.ramRom![e.index]} x ${e.amount}")
              //     .toList());
              add(itmn, pdif);
            },
          ),
        )
      ],
    );
  }
}
