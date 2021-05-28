import 'package:flutter/material.dart';
import 'package:pozitive/Core/ViewModel/view_group_quotation_viewmodels/view_group_quotation_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart' as bs;
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
import 'package:pozitive/Pages/Group-Quotation/Tab/Price(1_Year)_Electricity.dart';

class GroupQuotationPagesTab extends StatefulWidget {
  final String groupID;
  final String quoteId;
  final String title;

  const GroupQuotationPagesTab({this.groupID,this.quoteId, this.title});

  @override
  _GroupQuotationPagesTabState createState() => _GroupQuotationPagesTabState();
}

class _GroupQuotationPagesTabState extends State<GroupQuotationPagesTab>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GetPartnerQuoteGroupPriceModel getPartnerQuoteGroupPriceModel;
  Database database = getIt<DatabaseImplementation>();
  RequestQuoteViewButtonModel requestQuoteViewButtonModel =
  RequestQuoteViewButtonModel();
  @override
  void initState() {
    globals.tabController8 = new TabController(length: 5, vsync: this);
    globals.tabController8.addListener(_handleTabSelection);
    onCallApi();

    super.initState();
  }

  void _handleTabSelection() {
    setState(() {
      globals.tabController8.index;
    });
  }

  void onCallApi() async {
    User _user = await Prefs.getUser();
    getPartnerQuoteGroupPriceModel = await database.getPartnerGroupQuotePrice(
      GetPartnerQuoteGroupPriceCredentials(
        accountId: _user.accountId,
        groupId: widget.groupID,
        type: 'group',
      ),
    );
    // requestQuoteViewButtonModel = await database.getRequestQuoteViewButtonDetails(
    //   RequestQuoteViewButtonCredential(
    //     accountId: _user.accountId,
    //     type: 'group',
    //     quoteId: widget.quoteId,
    //   ),
    // );
    // print(getPartnerQuoteGroupPriceModel);
    // print(requestQuoteViewButtonModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tabWidth = width / 5;

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: appbar("Group-Quotation", context, _scaffoldKey, true, true),
      drawer: DrawerWidget(),
      body: bs.BaseView<ViewGroupQuotationViewModel>(
        onModelReady: (model) => model.initializeData(context: context,grpid: widget.groupID),
        builder: (context, model, child) {
          if (model.state == ViewState.BUSY) {
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
                  tabs: [
                    new Tab(
                      child: Text(
                        "Quotation Details",
                        style: TextStyle(
                          color: globals.tabController8.index == 0
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    new Tab(
                      child: Text(
                        "Group Details",
                        style: TextStyle(
                          color: globals.tabController8.index == 1
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    new Tab(
                      child: Text(
                        "Price Electricity Gas",
                        style: TextStyle(
                          color: globals.tabController8.index == 2
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    new Tab(
                      child: Text(
                        "Price(1year)",
                        style: TextStyle(
                          color: globals.tabController8.index == 3
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    new Tab(
                      child: Text(
                        "Price(1_Year)_Electricity",
                        style: TextStyle(
                          color: globals.tabController8.index == 4
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  controller: globals.tabController8,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GroupQuotation(
                      groupId: widget.groupID,
                      //groupId: '19781',
                      title: widget.title,
                    ),
                    ViewGroupDetailsPage(
                      // groupId: '19781',
                      groupId: widget.groupID,
                    ),
                    ViewPriceElecGasGroup(
                      // groupId: '19781',
                      groupId: widget.groupID,
                    ),
                    ViewGasELEPricePerYear(
                      quoteId: widget.quoteId,
                      requestQuote: requestQuoteViewButtonModel,
                      title: widget.title,
                    ),
                    oneYearPage(
                      // groupId: '19781',
                      groupId: widget.groupID,
                    ),
                  ],
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
