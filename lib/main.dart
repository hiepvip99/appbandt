import 'package:app_ban_dien_thoai/models/cart.dart';
import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/network/network_request.dart';
import 'package:app_ban_dien_thoai/screens/home/home_screen.dart';
import 'package:app_ban_dien_thoai/settings/setting.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Setting(),
          ),
          ChangeNotifierProvider(
            create: (context) => Cart(),
          ),
          ChangeNotifierProvider(
            create: (context) => PhoneS(),
          ),
        ],
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    await NetworkRequest.fetchPhones().then(
      (value) {
        context.read<PhoneS>().importData(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            foregroundColor: context.watch<Setting>().isDark
                ? buttonDeflaultColor2
                : buttonDeflaultColor,
          )),
          appBarTheme: AppBarTheme(
              elevation: 0,
              foregroundColor:
                  context.watch<Setting>().isDark ? Colors.white : Colors.black,
              backgroundColor: context.watch<Setting>().isDark
                  ? Colors.transparent
                  : Colors.white),
          brightness: context.watch<Setting>().isDark
              ? Brightness.dark
              : Brightness.light),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

Color buttonDeflaultColor = Color.fromARGB(255, 42, 148, 116);
Color buttonDeflaultColor2 = Color.fromARGB(255, 73, 255, 200);
