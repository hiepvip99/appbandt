import 'package:app_ban_dien_thoai/models/cart.dart';
import 'package:app_ban_dien_thoai/screens/cart/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({Key? key}) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          context.watch<Cart>().phoness.length > 0
              ? Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: context.watch<Cart>().phoness.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return ProductCard(index: index);
                    },
                  ),
                )
              : Container(
                  child: Center(
                      child: Text(
                    'Không có sản phẩm!',
                    style: Theme.of(context).textTheme.headline4,
                  )),
                ),
        ],
      ),
    );
  }
}
