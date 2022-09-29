import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/network/network_request.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderI extends StatefulWidget {
  SliderI({Key? key, required this.phoneInFo}) : super(key: key);
  PhoneInFo phoneInFo;
  int _initPage = 0;

  @override
  State<SliderI> createState() => _SliderIState();
}

class _SliderIState extends State<SliderI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              height: 300.0,
              onPageChanged: (index, reason) {
                setState(() {
                  widget._initPage = index;
                });
              },
            ),
            items: widget.phoneInFo.images!
                .map((e) => Container(
                      child: Image.network(
                        NetworkRequest.urlImage + e,
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
                        fit: BoxFit.cover,
                      ),
                    ))
                .toList(),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Text(
                '${widget._initPage + 1} / ${widget.phoneInFo.images!.length}'),
          ),
        ],
      ),
    );
  }
}
