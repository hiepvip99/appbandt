import 'package:app_ban_dien_thoai/screens/info/info_screen.dart';
import 'package:flutter/material.dart';

class InFomation extends StatelessWidget {
  const InFomation({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final InFoScreen widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Thông số kĩ thuật:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CPU: ' + widget.phoneInFo.cpu!),
                    SizedBox(
                      height: 10,
                    ),
                    Text('GPU: ' + widget.phoneInFo.gpu!),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Màn hình: ' + widget.phoneInFo.screen!),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Camera: ' + widget.phoneInFo.camera!),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Pin: ' + widget.phoneInFo.battery!),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Ram: ' + catchuoi(widget.phoneInFo.ramRom![0])[0]),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Rom: ' + catchuoi(widget.phoneInFo.ramRom![0])[1]),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Sim: ' + widget.phoneInFo.numOfSim! + ' sim'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Os: ' + widget.phoneInFo.os!),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Xuất xứ: ' + widget.phoneInFo.origin!),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Thời gian ra mắt: ' + widget.phoneInFo.releaseTime!),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> catchuoi(String value) {
  final splitted = value.split('/');
  return splitted;
}
