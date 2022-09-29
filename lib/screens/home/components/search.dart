import 'package:app_ban_dien_thoai/main.dart';
import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              textEditingController.text = '';
              context.read<PhoneS>().search('');
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // onTap: ,

        onChanged: (value) {
          setState(() {
            context.read<PhoneS>().search(value);
            // textEditingController.text = context.read<SearchName>().selectValue;
          });
        },
      ),
    );
  }
}

TextEditingController textEditingController = TextEditingController();
