import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/screens/home/home_screen.dart';
import 'package:app_ban_dien_thoai/screens/info/components/addtocart_buy.dart';
import 'package:app_ban_dien_thoai/screens/info/components/choose_item.dart';
import 'package:app_ban_dien_thoai/screens/info/components/infomation.dart';
import 'package:app_ban_dien_thoai/screens/info/components/slider.dart';
import 'package:flutter/material.dart';

class InFoScreen extends StatefulWidget {
  InFoScreen({Key? key, required this.phoneInFo}) : super(key: key);
  final PhoneInFo phoneInFo;

  @override
  State<InFoScreen> createState() => _InFoScreenState();
}

class _InFoScreenState extends State<InFoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AddToCardAndBuy(
        phoneInFo: widget.phoneInFo,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SliderI(phoneInFo: widget.phoneInFo),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.phoneInFo.name!,
                            style: Theme.of(context).textTheme.headline5),
                        SizedBox(
                          height: 10,
                        ),
                        ChooseItem(
                          widget: widget,
                        ),
                      ],
                    ),
                  ),
                ),
                InFomation(
                  widget: widget,
                )
              ],
            ),
          ),
          SafeArea(child: BackButton()),
        ],
      ),
    );
  }
}
