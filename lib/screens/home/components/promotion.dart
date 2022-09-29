import 'package:app_ban_dien_thoai/models/slider.dart';
import 'package:app_ban_dien_thoai/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class Promotion extends StatelessWidget {
  const Promotion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView.builder(
        itemCount: promotion.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 230,
            margin: EdgeInsets.only(right: 10),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    '${promotion[index]}',
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
