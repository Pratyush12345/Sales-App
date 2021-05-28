import 'package:flutter/material.dart';
import 'package:pozitive/Core/ViewModel/group_quotation_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/Addgroup_quotation.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/contract_detail.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/template_quote_group.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/group_details_page.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/new-PreviewPage.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/price_electricity_gas.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/group_quote_history.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/ElectricityView.dart';
import 'package:pozitive/Util/PrefGroupQuote/PrefQuoteGroup.dart';
import 'package:pozitive/providers/site_list_provider.dart';
import 'package:pozitive/providers/quotation_detail_provider.dart';
import 'package:pozitive/providers/tabcontroller3_provider.dart';
import 'package:provider/provider.dart';

class AddGroupQuotationPagesTab extends StatefulWidget {
  final String groupID;
  final String downloadUrl;

  const AddGroupQuotationPagesTab({this.groupID, this.downloadUrl});

  @override
  _AddGroupQuotationPagesTabState createState() =>
      _AddGroupQuotationPagesTabState();
}

class _AddGroupQuotationPagesTabState extends State<AddGroupQuotationPagesTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    clearGroupId();
    globals.tabController8 = new TabController(length: 2, vsync: this);
    globals.tabController8.addListener(_handleTabSelection);
    super.initState();
  }

  Future<void> clearGroupId() async {
    await PrefGroupQuote.gRQclearGroupId();
    setState(() {});
  }

  void _handleTabSelection() {
    setState(() {
      globals.tabController8.index;
    });
  }
  // void _handleTabSelection() {
  //   int index = globals.tabController3.index;
  //   setState(() {
  //     if (tabController3Provider.tabList[index] == false) {
  //       globals.tabController3.animateTo(index - 1);
  //     }
  //   });
  // }

  SiteListProvider siteListProviderData;
  GroupQuotaionDetailsProvider quotationDetailsProviderData;
  TabController3Provider tabController3Provider;

  @override
  Widget build(BuildContext context) {
    siteListProviderData = Provider.of<SiteListProvider>(context);
    quotationDetailsProviderData =
        Provider.of<GroupQuotaionDetailsProvider>(context);
    tabController3Provider = Provider.of<TabController3Provider>(context);
    double width = MediaQuery.of(context).size.width;
    double tabWidth = width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: appbar("Quotation", context, _scaffoldKey, true, true),
      drawer: DrawerWidget(),
      body: BaseView<GroupQuotationViewModel>(
        onModelReady: (model) async {
          await PrefGroupQuote.clearSiteDetails();
          await PrefGroupQuote.clearQuotationGroupDetailsAddQuote();
          // await PrefGroupQuote.gRQclearGroupId();
          siteListProviderData.siteListProvider.clear();

          quotationDetailsProviderData.groupQuotaionDetailsProvider?.groupId =
              null;
          tabController3Provider.resetTabListProvider();
        },
        builder: (context, model, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .5,

                // width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(228, 241, 215, 1),
                child: TabBar(
                  //physics: NeverScrollableScrollPhysics(),
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
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    new Tab(
                      child: Text(
                        "Preview Detail",
                        style: TextStyle(
                            color: globals.tabController8.index == 1
                                ? ThemeApp().purplecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // new Tab(
                    //   child: Text(
                    //     "Group",
                    //     style: TextStyle(
                    //         color: globals.tabController3.index == 2
                    //             ? ThemeApp().purplecolor
                    //             : Colors.grey,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // new Tab(
                    //   child: Text(
                    //     "Price Electricity/Gas",
                    //     style: TextStyle(
                    //         color: globals.tabController3.index == 3
                    //             ? ThemeApp().purplecolor
                    //             : Colors.grey,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // new Tab(
                    //   child: Text(
                    //     "Price 1 Year Electricity",
                    //     style: TextStyle(
                    //         color: globals.tabController3.index == 4
                    //             ? ThemeApp().purplecolor
                    //             : Colors.grey,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // new Tab(
                    //   child: Text(
                    //     "Contract Detail",
                    //     style: TextStyle(
                    //         color: globals.tabController3.index == 4
                    //             ? ThemeApp().purplecolor
                    //             : Colors.grey,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // new Tab(
                    //   child: Text(
                    //     "Template Quote",
                    //     style: TextStyle(
                    //         color: globals.tabController3.index == 5
                    //             ? ThemeApp().purplecolor
                    //             : Colors.grey,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // new Tab(
                    //   child: Text(
                    //     "Group Quote History",
                    //     style: TextStyle(
                    //         color: globals.tabController3.index == 6
                    //             ? ThemeApp().purplecolor
                    //             : Colors.grey,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                  ],
                  controller: globals.tabController8,
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    GroupQuotation(
                      groupID: widget.groupID,
                      downloadUrl: widget.downloadUrl,
                    ),
                    Previewpage(),
                    // GroupDetailsPage(),
                    // PriceElectricityGas(),
                    // ElectricityView(),
                    //ContractDetail(),
                    // TemplateQuoteGroupScreen(),
                    // GroupQuoteHistoryScreen(),
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
