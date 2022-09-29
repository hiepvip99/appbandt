import 'package:animate_do/animate_do.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:app_ban_dien_thoai/models/category.dart';
import 'package:app_ban_dien_thoai/screens/home/components/menu_and_listcategory_childmenu/menu.dart';
import 'package:app_ban_dien_thoai/screens/home/components/menu_and_listcategory_childmenu/components/item_category_child_menu.dart';
import 'package:app_ban_dien_thoai/settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Item extends StatefulWidget {
  Item({
    Key? key,
    required this.index,
  }) : super(key: key);
  int index;
  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> with TickerProviderStateMixin {
  bool isOpen = false;

  late AnimateIconController controller;
  late AnimationController animateController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimateIconController();
    animateController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(categories[widget.index].name),
                    AnimateIcons(
                      startIcon: Icons.arrow_right_rounded,
                      endIcon: Icons.arrow_drop_down_rounded,
                      controller: controller,
                      // size: 60.0,
                      onStartIconPress: () {
                        print("Clicked on Add Icon");
                        return true;
                      },
                      onEndIconPress: () {
                        print("Clicked on Close Icon");
                        return true;
                      },
                      duration: Duration(milliseconds: 500),
                      startIconColor: context.watch<Setting>().isDark
                          ? Colors.white
                          : Colors.black,
                      endIconColor: context.watch<Setting>().isDark
                          ? Colors.white
                          : Colors.black,
                      clockwise: true,
                    ),
                  ],
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isOpen = !isOpen;
                          if (controller.isStart()) {
                            controller.animateToEnd();
                          } else if (controller.isEnd()) {
                            controller.animateToStart();
                          }
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            isOpen
                ? BounceInUp(
                    duration: Duration(milliseconds: 600),
                    manualTrigger: true,
                    controller: (p0) => animateController = p0,
                    child: CategoryMenu(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
