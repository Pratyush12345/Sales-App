import 'package:flutter/material.dart';
import 'package:pozitive/Core/ViewModel/view_group_quotation_viewmodels/view_group_quotation_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart' as bs;
import 'package:pozitive/Pages/Group-Quotation/Tab/Price_2_Year/Price(2_year)_Electricity.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/Price_3_Year/Price(3_year)_Electricity.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/Price_4_Year/Price(4_year)_Electricity.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/group_quotation.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/view_group_details.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/view_price_electricity_gas_group.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/view_price_ele_gas_1year.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Model/get_partner_quote_group_price_model.dart';
import 'package:pozitive/Core/Model/Api/get_partner_quote_group_price_credentials.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential..dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/Price_1_Year/Price(1_Year)_Electricity.dart';
import 'package:pozitive/Core/ViewModel/group_quotation_viewmodel.dart';
import 'package:http/http.dart' as htp;
import 'dart:convert';
class GroupQuotationPagesTab extends StatefulWidget {
  final String groupID;
  final String quoteId;
  final String title;
  final String status;

  const GroupQuotationPagesTab({this.groupID,this.quoteId, this.title,this.status});

  @override
  _GroupQuotationPagesTabState createState() => _GroupQuotationPagesTabState();
}

class _GroupQuotationPagesTabState extends State<GroupQuotationPagesTab>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GetPartnerQuoteGroupPriceModel getPartnerQuoteGroupPriceModel;
 // Database database = getIt<DatabaseImplementation>();
  RequestQuoteViewButtonModel requestQuoteViewButtonModel =
  RequestQuoteViewButtonModel();
  @override
  List<Widget> tabitems =
  [
  ];
  List<String> tabtitles = [
    "Quotation Details",
    "Group Details",
    "Price Electricity Gas",
    "Price(1_Year)_Electricity or Gas",
    "Price(2_Year)_Electricity or Gas",
    "Price(3_Year)_Electricity or Gas",
    "Price(4_Year)_Electricity or Gas",
  ];
  List<Widget> tabbarviews = [];
  int number;
  bool check;
  void initState() {
    setState(() {
      check = false;
    });
     onCallApi();

    super.initState();
  }

  void _handleTabSelection() {
    setState(() {
      globals.tabController8.index;
    });
  }

  Future<void> onCallApi() async {

    User _user = await Prefs.getUser();

    htp.Response response = await htp.post(
        Uri.parse(
            'https://api.boshposh.com/api/Partner/GetPartnerQuoteGroup_Price'),
        headers: {"Content-Type": "application/json"},
        // body: (json1.substring(1, lstLength - 1)),
        body: json.encode({
          "AccountId": _user.accountId,
          "GroupId": widget.groupID ,
          "type": "group"
        })
    );
    var res  = jsonDecode(response.body);

    Set<String>yearlist = {};
    List<Widget> tabbarviewstemp = [
      GroupQuotation(
        groupId: widget.groupID,
        //groupId: '19781',
        title: widget.title,
        loaddata: res,
        status: widget.status,
      ),
      ViewGroupDetailsPage(
        // groupId: '19781',
        groupId: widget.groupID,
        loaddata: res,
      ),
      ViewPriceElecGasGroup(
        // groupId: '19781',
        groupId: widget.groupID,
      ),
      // ViewGasELEPricePerYear(
      //   quoteId: widget.quoteId,
      //   requestQuote: requestQuoteViewButtonModel,
      //   title: widget.title,
      // ),
      oneYearPage(
        // groupId: '19781',
        groupId: widget.groupID,
      ),
      twoYearPage(
        // groupId: '19781',
        groupId: widget.groupID,
      ),
      threeYearPage(
        // groupId: '19781',
        groupId: widget.groupID,
      ),
      fourYearPage(
        // groupId: '19781',
        groupId: widget.groupID,
      ),
    ];
    number =2;
    if(widget.status == 'Quoted') {
      number++;

      if (res['data']['lstPriceValues'] != null) {
        for (int i = 0; i < res['data']['lstPriceValues'].length; i++) {
          yearlist.add(res['data']['lstPriceValues'][i]['intTermType']);
        }
      }
      if (yearlist != null)
        number += yearlist.length;
    }
      globals.tabController8 = new TabController(length: number, vsync: this);
      globals.tabController8.addListener(_handleTabSelection);

      for(int i=0;i<number;i++){
       tabitems.add(
         new Tab(
           child: Text(
             tabtitles[i],
             style: TextStyle(
               //color: Colors.grey,
               fontWeight: FontWeight.bold,
             ),
           ),
         ),
       );
       tabbarviews.add(
         tabbarviewstemp[i],
       );

      }



    print("\n");
    print(tabitems.length);


    // requestQuoteViewButtonModel = await database.getRequestQuoteViewButtonDetails(
    //   RequestQuoteViewButtonCredential(
    //     accountId: _user.accountId,
    //     type: 'group',
    //     quoteId: widget.quoteId,
    //   ),
    // );
    // print(getPartnerQuoteGroupPriceModel);
    // print(requestQuoteViewButtonModel);
   setState(() {
     check = true;
   });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tabWidth = width / 7;

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: appbar("Group-Quotation", context, _scaffoldKey, true, true),
      drawer: DrawerWidget(),
      body: bs.BaseView<ViewGroupQuotationViewModel>(
        //onModelReady: (model) => model.initializeData(context: context,grpid: widget.groupID),
        builder: (context, model, child) {
          // if (model.state == ViewState.BUSY) {
          //   return Container(
          //     height: MediaQuery.of(context).size.height,
          //     child: Scaffold(
          //       body: Center(
          //         child: AppConstant.circularProgressIndicator(),
          //       ),
          //     ),
          //   );
          // }
          if(!check){
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Scaffold(
                body: Center(
                  child: AppConstant.circularProgressIndicator(),
                ),
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(228, 241, 215, 1),
                child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: ThemeApp().purplecolor,
                  indicatorColor: ThemeApp().purplecolor,
                  isScrollable: true,
                  tabs: tabitems,
                  // [
                  //
                  //   new Tab(
                  //     child: Text(
                  //       "Quotation Details",
                  //       style: TextStyle(
                  //         color: globals.tabController8.index == 0
                  //             ? ThemeApp().purplecolor
                  //             : Colors.grey,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  //   new Tab(
                  //     child: Text(
                  //       "Group Details",
                  //       style: TextStyle(
                  //         color: globals.tabController8.index == 1
                  //             ? ThemeApp().purplecolor
                  //             : Colors.grey,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  //   new Tab(
                  //     child: Text(
                  //       "Price Electricity Gas",
                  //       style: TextStyle(
                  //         color: globals.tabController8.index == 2
                  //             ? ThemeApp().purplecolor
                  //             : Colors.grey,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  //   // new Tab(
                  //   //   child: Text(
                  //   //     "Price(1year)",
                  //   //     style: TextStyle(
                  //   //       color: globals.tabController8.index == 3
                  //   //           ? ThemeApp().purplecolor
                  //   //           : Colors.grey,
                  //   //       fontWeight: FontWeight.bold,
                  //   //     ),
                  //   //   ),
                  //   // ),
                  //   new Tab(
                  //     child: Text(
                  //       "Price(1_Year)_Electricity or Gas",
                  //       style: TextStyle(
                  //         color: globals.tabController8.index == 3
                  //             ? ThemeApp().purplecolor
                  //             : Colors.grey,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  //   new Tab(
                  //     child: Text(
                  //       "Price(2_Year)_Electricity or Gas",
                  //       style: TextStyle(
                  //         color: globals.tabController8.index == 4
                  //             ? ThemeApp().purplecolor
                  //             : Colors.grey,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  //   new Tab(
                  //     child: Text(
                  //       "Price(3_Year)_Electricity or Gas",
                  //       style: TextStyle(
                  //         color: globals.tabController8.index == 5
                  //             ? ThemeApp().purplecolor
                  //             : Colors.grey,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  //   new Tab(
                  //     child: Text(
                  //       "Price(4_Year)_Electricity or Gas",
                  //       style: TextStyle(
                  //         color: globals.tabController8.index == 6
                  //             ? ThemeApp().purplecolor
                  //             : Colors.grey,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ],
                  controller: globals.tabController8,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: tabbarviews,
                  //[
                  // GroupQuotation(
                  //   groupId: widget.groupID,
                  //   //groupId: '19781',
                  //   title: widget.title,
                  // ),
                  // ViewGroupDetailsPage(
                  //   // groupId: '19781',
                  //   groupId: widget.groupID,
                  // ),
                  // ViewPriceElecGasGroup(
                  //   // groupId: '19781',
                  //   groupId: widget.groupID,
                  // ),
                  // // ViewGasELEPricePerYear(
                  // //   quoteId: widget.quoteId,
                  // //   requestQuote: requestQuoteViewButtonModel,
                  // //   title: widget.title,
                  // // ),
                  // oneYearPage(
                  //   // groupId: '19781',
                  //   groupId: widget.groupID,
                  // ),
                  // twoYearPage(
                  //   // groupId: '19781',
                  //   groupId: widget.groupID,
                  // ),
                  // threeYearPage(
                  //   // groupId: '19781',
                  //   groupId: widget.groupID,
                  // ),
                  // fourYearPage(
                  //   // groupId: '19781',
                  //   groupId: widget.groupID,
                  // ),
                  // ],
                  controller: globals.tabController8,
                ),
              )
            ],
          );


        },
      ),
    );
  }
}
