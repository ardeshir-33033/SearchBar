import 'package:flutter/material.dart';
import 'package:search_bar/Models/Sample.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  _SearchWidgetState() {
    filter.addListener(() {
      if (filter.text.isNotEmpty) {
        setState(() {
          searchText = filter.text;
        });
        SearchFunc();
      } else {
        setState(() {
          searchList.clear();
        });
      }
    });
  }

  List<SampleModel> searchList = [];
  String searchText;
  bool showSearch1 = false;
  final TextEditingController filter = TextEditingController();
  double shadowOnTap = -2;
  Color boxShadowbool = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: boxShadowbool.withOpacity(0.5),
            spreadRadius: shadowOnTap,
            blurRadius: 5,
            offset: Offset(2, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10.0),
            margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              // BorderRadius.only(
              //     topLeft: Radius.circular(10.0),
              //     topRight: Radius.circular(10.0)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.36,
                  child: TextField(
                    onTap: () {
                      shadowOnTap = 5;
                      showSearch1 = true;
                      boxShadowbool = Colors.grey.withOpacity(0.5);
                      // SearchColor = Colors.grey[200];
                      setState(() {});
                      // SampleModel1().SetShowSearch(true);
                    },
                     controller: filter,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search...",
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      filter.clear();
                      showSearch1 = false;
                      setState(() {});
                    }),
              ],
            ),
          ),
          Visibility(
            visible: showSearch1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Visibility(
                    visible: searchList.length != 0,
                    child: Divider(
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: searchList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    searchList[index].imageUrl,
                                    fit: BoxFit.fill,
                                    width: 80,
                                    height: 80,
                                  ),
                                ),
                                Text(searchList[index].title),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(searchList[index].name),
                                    Text(searchList[index].subtitle),
                                  ],
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      searchList[index].price.toString(),
                                    ),
                                  ),
                                  width: 80,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 1,
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.keyboard_arrow_up),
                      onPressed: () {
                        boxShadowbool = Colors.white;
                        shadowOnTap = -2;
                        showSearch1 = false;
                        // SearchColor = Colors.white;
                        // widget.showSearch = false;
                        setState(() {});
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void SearchFunc() {
    if (searchText.isNotEmpty) {
      searchList.clear();
      for (int i = 0; i < sampleList.length; i++) {
        if (sampleList[i]
                .name
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
            sampleList[i]
                .subtitle
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
            sampleList[i]
                .title
                .toLowerCase()
                .contains(searchText.toLowerCase())) {
          searchList.add(sampleList[i]);
        }
      }
    }
  }
}
