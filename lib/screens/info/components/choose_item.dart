import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/cart.dart';
import 'package:app_ban_dien_thoai/screens/home/home_screen.dart';
import 'package:app_ban_dien_thoai/screens/info/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseItem extends StatefulWidget {
  ChooseItem({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final InFoScreen widget;

  @override
  State<ChooseItem> createState() => _ChooseItemState();
}

class _ChooseItemState extends State<ChooseItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.widget.phoneInFo.ramRom!.length,
      // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //     childAspectRatio: 4,
      //     maxCrossAxisExtent: 300,
      //     crossAxisSpacing: 5,
      //     mainAxisSpacing: 5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: size.width < 450 ? 8 : 4,
          crossAxisCount: size.width < 450 ? 1 : 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemBuilder: (context, index) {
        return ChoiceChip(
          selectedColor: buttonDeflaultColor,
          backgroundColor: Colors.grey,
          label: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                context.watch<Cart>().select == index
                    ? Icon(Icons.check_rounded)
                    : Container(),
                SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.widget.phoneInFo.name! +
                        ' ' +
                        widget.widget.phoneInFo.ramRom![index]),
                    Text(
                      format(int.parse(widget.widget.phoneInFo.price![index])),
                    ),
                  ],
                ),
              ],
            ),
          ),
          selected: context.watch<Cart>().select == index ? true : false,
          onSelected: (value) {
            setState(() {
              context.read<Cart>().setSelect(index);
            });
          },
        );
      },
    );
  }
}
