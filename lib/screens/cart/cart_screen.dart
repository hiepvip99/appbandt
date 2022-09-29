import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/cart.dart';
import 'package:app_ban_dien_thoai/screens/cart/components/cart_product_list.dart';
import 'package:app_ban_dien_thoai/screens/checkout/checkout_screen.dart';
import 'package:app_ban_dien_thoai/screens/home/home_screen.dart';
import 'package:app_ban_dien_thoai/screens/info/components/choose_item.dart';
import 'package:app_ban_dien_thoai/settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          foregroundColor:
              context.watch<Setting>().isDark ? Colors.white : Colors.black),
      body: CartProduct(),
      bottomNavigationBar: Footer(),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Thành tiền: ' + format(context.watch<Cart>().totalCart()),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: context.watch<Setting>().isDark
                        ? buttonDeflaultColor2
                        : buttonDeflaultColor),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOutScreen(),
                      ));
                },
                child: Text('Tiến hành đặt hàng'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
