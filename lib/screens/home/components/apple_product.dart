import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/network/network_request.dart';
import 'package:app_ban_dien_thoai/screens/home/home_screen.dart';
import 'package:app_ban_dien_thoai/screens/info/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppleProduct extends StatefulWidget {
  const AppleProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<AppleProduct> createState() => _AppleProductState();
}

class _AppleProductState extends State<AppleProduct> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'SẢN PHẨM APPLE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        GridView.builder(
          gridDelegate: s.width > 600
              ? SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.75, maxCrossAxisExtent: 400)
              : SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.6),
          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //     childAspectRatio: 0.75, maxCrossAxisExtent: 400),
          itemCount: context.watch<PhoneS>().apple.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
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
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
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
                          context.watch<PhoneS>().apple[index].name!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          format(int.parse(
                              context.watch<PhoneS>().apple[index].price![0])),
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
                                        context.watch<PhoneS>().apple[index]),
                              ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

String replace(String value) {
  final startIndex = 1;
  final replaced = value.replaceFirst(RegExp("upload"), '/', startIndex);
  return replaced;
}
