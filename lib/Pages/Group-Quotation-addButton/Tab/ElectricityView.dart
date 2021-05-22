import 'package:flutter/material.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/purple_flat_button.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/ExpansionView.dart';

class ElectricityView extends StatefulWidget {
  @override
  _ElectricityViewState createState() => _ElectricityViewState();
}

class _ElectricityViewState extends State<ElectricityView>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TabController tabController;
  List<String> mpanList = [
    'MPAN:4585478596321',
    'MPAN:8569784523546',
    'MPAN:4585478596321',
    'MPAN:8569784523546',
    'MPAN:4585478596321'
  ];
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool check5 = false;

  bool getBool(int index) {
    if (index == 1) {
      return check1;
    } else if (index == 2) {
      return check2;
    } else if (index == 3) {
      return check3;
    } else if (index == 4) {
      return check4;
    } else {
      return check5;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double tabWidth = width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: ListView.builder(
                        itemCount: mpanList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: ExpansionTile(
                              leading: Checkbox(
                                checkColor: Colors.greenAccent,
                                activeColor: Colors.green,
                                value: getBool(index + 1),
                                onChanged: (value) {
                                  if (index == 0) {
                                    check1 = !check1;
                                  }
                                  if (index == 1) {
                                    check2 = !check2;
                                  }
                                  if (index == 2) {
                                    check3 = !check3;
                                  }
                                  if (index == 3) {
                                    check4 = !check4;
                                  }
                                  if (index == 4) {
                                    check5 = !check5;
                                  }
                                  setState(() {});
                                },
                              ),
                              trailing: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.green,
                              ),
                              title: Text(
                                mpanList[index],
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              children: [
                                ExpansionView(),
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                          );
                        }),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  PurpleFlatButton(
                    text: 'GENERATE CONTRACT',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PurpleFlatButton(
                    text: 'REMOVE SITE',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PurpleFlatButton(
                    text: 'EDIT SITE',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
