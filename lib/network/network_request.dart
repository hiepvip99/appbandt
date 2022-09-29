import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:app_ban_dien_thoai/models/phone_info.dart';

class NetworkRequest {
  static const urlImage = "http://192.168.0.106:8000/uploads/";
  static const String urlGetAll = "http://192.168.0.106:8000/product/get";

  static Future<List<PhoneInFo>> parsePhone(String responseBody) async {
    var list = await json.decode(responseBody) as List<dynamic>;
    List<PhoneInFo> resPhone =
        await list.map((model) => PhoneInFo.fromJson(model)).toList();
    return resPhone;
  }

  static Future<List<PhoneInFo>> fetchPhones() async {
    final response = await http.get(Uri.parse(urlGetAll));
    if (response.statusCode == 200) {
      return compute(parsePhone, response.body);
    } else if (response.statusCode == 404) {
      throw Exception("Not Found");
    } else {
      throw Exception("ERROR : " + response.statusCode.toString());
    }
  }
}
