import 'package:app_ban_dien_thoai/models/phone_info.dart';
import 'package:app_ban_dien_thoai/screens/home/components/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search_List extends StatefulWidget {
  const Search_List({Key? key}) : super(key: key);

  @override
  State<Search_List> createState() => _Search_ListState();
}

class _Search_ListState extends State<Search_List> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PhoneS>(
      builder: (context, searchName, child) {
        return searchName.list_search.length > 0
            ? Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: searchName.list_search.length > 5
                      ? 5
                      : searchName.list_search.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      // searchName
                      //     .setStringValue(searchName.list_search[index].name);
                      textEditingController.text =
                          searchName.list_search[index].name!;

                      textEditingController.selection =
                          TextSelection.fromPosition(
                        TextPosition(offset: textEditingController.text.length),
                      );
                      context
                          .read<PhoneS>()
                          .search(searchName.list_search[index].name!);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Theme.of(context).dividerColor))),
                            child: Row(children: [
                              // Image.asset('name'),
                              SizedBox(
                                width: 10,
                              ),
                              Text(searchName.list_search[index].name!),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
