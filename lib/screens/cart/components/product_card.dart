import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/cart.dart';
import 'package:app_ban_dien_thoai/network/network_request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  ProductCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                NetworkRequest.urlImage +
                    cart.phoness[widget.index].phoneInFo.images![0],
                height: 100,
                width: 100,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(cart.phoness[widget.index].phoneInFo.name! +
                      ' ' +
                      cart.phoness[widget.index].phoneInFo
                          .ramRom![cart.phoness[widget.index].index]),
                  // Text(cart.phoness[widget.index].phoneInFo
                  //     .ramRom![cart.phoness[widget.index].index]
                  //     .toString()),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          cart.reduceProductInCart(widget.index);
                        },
                        child: Icon(Icons.remove),
                        style: ElevatedButton.styleFrom(
                          primary: buttonDeflaultColor,
                          padding: EdgeInsets.all(0),
                          shape: CircleBorder(),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(cart.phoness[widget.index].amount.toString()),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cart.augmentProductInCart(widget.index);
                        },
                        child: Icon(Icons.add),
                        style: ElevatedButton.styleFrom(
                          primary: buttonDeflaultColor,
                          padding: EdgeInsets.all(0),
                          shape: CircleBorder(),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cart.removeProductInCart(widget.index);
                        },
                        child: Icon(
                          Icons.highlight_off,
                          color: Colors.red,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(0),
                          shape: CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
