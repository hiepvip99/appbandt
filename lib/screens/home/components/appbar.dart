import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/cart.dart';
import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/screens/cart/cart_screen.dart';
import 'package:app_ban_dien_thoai/screens/home/components/search.dart';
import 'package:app_ban_dien_thoai/screens/home/home_screen.dart';
import 'package:app_ban_dien_thoai/settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
  }) : super(key: key);

  Size get preferredSize => Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    Color _icon_color =
        context.watch<Setting>().isDark ? Colors.white : Colors.black;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      flexibleSpace: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset('assets/images/logo.png'),
          SizedBox(
            height: 10,
          ),
          Search(),
        ],
      ),
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu_open,
          color: _icon_color,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ));
          },
          icon: Stack(
            children: [
              Icon(
                Icons.card_travel,
                color: _icon_color,
              ),
              // Positioned(
              //   right: 0,
              //   top: -5,
              //   child: Container(
              //     padding: EdgeInsets.all(5),
              //     child: Text(
              //       context.watch<Cart>().phoness.length.toString(),
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: Colors.red.withOpacity(0.8),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
