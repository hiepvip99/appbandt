import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/slider.dart';
import 'package:app_ban_dien_thoai/screens/home/home_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class SliderS extends StatefulWidget {
  const SliderS({
    Key? key,
  }) : super(key: key);

  @override
  State<SliderS> createState() => _SliderSState();
}

class _SliderSState extends State<SliderS> {
  double initPage = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Stack(
        children: [
          CarouselSlider(
            items: sliders.map((i) {
              return Container(
                width: size.width,
                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        '$i',
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
            }).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              height: 200.0,
              onPageChanged: (index, reason) {
                setState(() {
                  initPage = index.toDouble();
                });
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 5,
            child: DotsIndicator(
              dotsCount: sliders.length,
              position: initPage,
            ),
          ),
        ],
      ),
    );
  }
}
