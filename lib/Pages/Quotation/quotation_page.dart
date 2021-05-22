import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Pages/Quotation/Tab/individual.dart';
import 'package:pozitive/Pages/Quotation/Tab/electricity.dart';
import 'package:pozitive/Pages/Quotation/Tab/gas.dart';
import 'package:pozitive/Pages/Quotation/Tab/Electricity1Year.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Util/global.dart' as globals;

import 'Tab/GasPrice1Year.dart';
import 'Tab/price_electricity-gas.dart';

class QuotationPage extends StatefulWidget {
  final String quoteID;
  QuotationPage({this.quoteID});

/*
 final int intId;
const QuotationPage(this.intId);
*/

  @override
  _QuotationPageState createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage>
    with SingleTickerProviderStateMixin {
  //TabController _tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    globals.tabController7 = new TabController(length: 3, vsync: this);
    globals.tabController7.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {
      globals.tabController7.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tabWidth = width / 6;

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: appbar("Quotation", context, _scaffoldKey, true, true),
      drawer: DrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(228, 241, 215, 1),
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: ThemeApp().purplecolor,
              indicatorColor: ThemeApp().purplecolor,
//              isScrollable: true,
              tabs: [
                Container(
                  child: Text(
                    "Individual",
                    style: TextStyle(
                        color: globals.tabController7.index == 0
                            ? ThemeApp().purplecolor
                            : Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text("Electricity",
                      style: TextStyle(
                          color: globals.tabController7.index == 1
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                Tab(
                  child: Text("Gas",
                      style: TextStyle(
                          color: globals.tabController7.index == 2
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
              ],
              controller: globals.tabController7,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Individual(quoteID: widget.quoteID),
                Electricity(),
                Gas(quoteID: widget.quoteID),
              ],
              controller: globals.tabController7,
            ),
          )
        ],
      ),
    );
  }
}
