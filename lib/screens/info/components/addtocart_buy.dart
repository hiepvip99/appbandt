import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/cart.dart';
import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/screens/info/components/choose_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCardAndBuy extends StatefulWidget {
  AddToCardAndBuy({
    Key? key,
    required this.phoneInFo,
  }) : super(key: key);
  PhoneInFo phoneInFo;

  @override
  State<AddToCardAndBuy> createState() => _AddToCardAndBuyState();
}

class _AddToCardAndBuyState extends State<AddToCardAndBuy> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                context.read<Cart>().addToCartVip(Phone(widget.phoneInFo,
                    Provider.of<Cart>(context, listen: false).select, 1));
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text('Thêm sp thành công')));
              },
              child: Text('Thêm vào giỏ hàng'),
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(10)),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Flexible(
          fit: FlexFit.tight,
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Mua ngay'),
              style: ElevatedButton.styleFrom(
                  primary: buttonDeflaultColor, padding: EdgeInsets.all(10)),
            ),
          ),
        )
      ],
    );
  }
}
