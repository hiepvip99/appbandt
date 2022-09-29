import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/network/network_request.dart';
import 'package:app_ban_dien_thoai/screens/home/home_screen.dart';
import 'package:app_ban_dien_thoai/screens/info/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:provider/provider.dart';

class TabCategory extends StatefulWidget {
  const TabCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<TabCategory> createState() => _TabCategoryState();
}

class _TabCategoryState extends State<TabCategory>
    with TickerProviderStateMixin {
  late TabController controller;
  int initPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this, initialIndex: initPage);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FLASH SALE ONLINE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              Container(
                height: 40,
                child: TabBar(
                  controller: controller,
                  onTap: (value) {
                    setState(() {
                      initPage = value;
                    });
                  },
                  tabs: tab_category
                      .map(
                        (e) => Tab(
                          child: Text('$e'),
                        ),
                      )
                      .toList(),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicator: RectangularIndicator(
                    color: buttonDeflaultColor,
                    bottomLeftRadius: 10,
                    bottomRightRadius: 10,
                    topLeftRadius: 10,
                    topRightRadius: 10,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 300,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: MediaQuery.of(context).size.width,
            color: buttonDeflaultColor.withOpacity(0.5),
            child: TVPhoneWatch(),
          ),
        ],
      ),
    );
  }
}

List<String> tab_category = [
  'Điện thoại/Đồng hồ/Tv',
  'Laptop/Tablet',
  'Phụ kiện'
];

class TVPhoneWatch extends StatelessWidget {
  const TVPhoneWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: context.watch<PhoneS>().phones.length,
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
                            Provider.of<PhoneS>(context, listen: false)
                                .phones[index]
                                .images![0]
                                .toString(),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              color: buttonDeflaultColor,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        width: 150,
                        height: 200,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      context.watch<PhoneS>().phones[index].name!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      format(int.parse(
                          context.watch<PhoneS>().phones[index].price![0])),
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
                                phoneInFo:
                                    context.watch<PhoneS>().phones[index]),
                          ));
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
