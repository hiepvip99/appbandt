import 'package:flutter/material.dart';

TextEditingController name = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController note = TextEditingController();

class OrderInfomation extends StatelessWidget {
  const OrderInfomation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Thông tin đặt hàng',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Bạn cần điền đầy đủ thông tin có dấu *',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                          hintText: 'Họ Tên *',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: phone,
                      decoration: InputDecoration(
                          hintText: 'Số Điện Thoại *',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: address,
                      decoration: InputDecoration(
                          hintText: 'Địa Chỉ *',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: note,
                      minLines: 4,
                      maxLines: 4,
                      decoration: InputDecoration(
                          hintText: 'Ghi chú',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
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
