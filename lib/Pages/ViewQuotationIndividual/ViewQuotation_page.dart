import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/view_quotation_page_argument.dart';
import 'package:pozitive/Pages/ViewQuotationIndividual/Tab/ViewElectricity.dart';
import 'package:pozitive/Pages/ViewQuotationIndividual/Tab/ViewElectricity1Year.dart';
import 'package:pozitive/Pages/ViewQuotationIndividual/Tab/ViewGas.dart';
import 'package:pozitive/Pages/ViewQuotationIndividual/Tab/ViewGasPrice3Year.dart';
import 'package:pozitive/Pages/ViewQuotationIndividual/Tab/ViewIndividual.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'Tab/ViewElectricity2Year.dart';
import 'Tab/ViewElectricity3Year.dart';
import 'Tab/ViewElectricity4Year.dart';
import 'Tab/ViewElectricity5Year.dart';
import 'Tab/ViewGasPrice1Year.dart';
import 'Tab/ViewGasPrice2Year.dart';
import 'Tab/ViewGasPrice4Year.dart';
import 'Tab/ViewGasPrice5Year.dart';
import 'Tab/ViewPrice_electricity-gas.dart';
import 'package:pozitive/Core/ViewModel/ViewRequestQuoteViewModels/ViewQuotationPageViewModel.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential..dart';

class ViewQuotationPage extends StatefulWidget {
  final String quoteID;
  final String title;
  ViewQuotationPage({this.quoteID, this.title});

  @override
  _ViewQuotationPageState createState() => _ViewQuotationPageState();
}

class _ViewQuotationPageState extends State<ViewQuotationPage>
    with TickerProviderStateMixin {
  bool isElectricity = false;
  bool isGas = false;
  List<Tab> tabs = List<Tab>();
  List<Widget> generalWidgets = List<Widget>();
  TabController tabController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  Database database = getIt<DatabaseImplementation>();
  RequestQuoteViewButtonModel requestQuoteViewButtonModel =
      RequestQuoteViewButtonModel();

  void _handleTabSelection() {
    setState(() {
      globals.tabController3.index;
    });
  }

  @override
  void initState() {
    onCallApi();

    super.initState();
  }

  @override
  void dispose() {
    //  tabController.dispose();
    super.dispose();
  }

  TabController getTabController() {
    return TabController(length: tabs.length, vsync: this);
  }

  Tab getTab(int widgetNumber) {
    return Tab(
      text: "$widgetNumber",
    );
  }

  List<Tab> getTabs(int count) {
    tabs.clear();
    for (int i = 0; i < count; i++) {
      tabs.add(getTab(i));
    }
    return tabs;
  }

  void addAnotherTab(int length) {
    tabs = getTabs(tabs.length + 1);
    globals.tabController3.index = 0;
    globals.tabController3 = getTabController();
    updatePage();
  }

  void removeTab() {
    tabs = getTabs(tabs.length - 1);
    globals.tabController3.index = 0;
    globals.tabController3 = getTabController();
    updatePage();
  }

  void updatePage() {
    setState(() {});
  }

  bool isLoading = true;

  void onCallApi() async {
    print(widget.quoteID.toString() + " Quote Id");
    User _user = await Prefs.getUser();
    requestQuoteViewButtonModel =
        await database.getRequestQuoteViewButtonDetails(
      RequestQuoteViewButtonCredential(
        accountId: _user.accountId,
        type: 'individual',
        quoteId: widget.quoteID,
      ),
    );
    if (requestQuoteViewButtonModel.fullMPAN != null) {
      setState(() {
        isElectricity = true;
      });
    }
    if (requestQuoteViewButtonModel.mPRN != null) {
      setState(() {
        isGas = true;
      });
    }

    globals.tabController3 =
        new TabController(length: requiredTabs, vsync: this);
    globals.tabController3.addListener(_handleTabSelection);
    print(requestQuoteViewButtonModel.customerId.toString() +
        "this is customer id");
    setState(() {
      isLoading = false;
    });
  }

  int noOfTabs = 0;
  int oneYearTabs = 0;
  int twoYearTabs = 0;
  int threeYearTabs = 0;
  int fourYearTabs = 0;
  int fiveYearTabs = 0;
  bool oneTab = false;
  bool twoTab = false;
  bool threeTab = false;
  bool fourTab = false;
  bool fiveTab = false;

  List<Widget> yearONEWidget(String quoteID, ViewQuotationPageArgument argument,
      RequestQuoteViewButtonModel requestQuote) {
    if (isGas && !isElectricity) {
      return [
        ViewGasPricePerYear(
          quoteId: quoteID,
          argument: argument,
          requestQuote: requestQuoteViewButtonModel,
          title: widget.title,
        ),
      ];
    }
    if (isElectricity && !isGas) {
      return [
        ViewElectricityPricePerYear(
          quoteId: quoteID,
          argument: argument,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (isGas && isElectricity) {
      return [
        ViewGasPricePerYear(
          quoteId: quoteID,
          argument: argument,
          requestQuote: requestQuote,
          title: widget.title,
        ),
        ViewElectricityPricePerYear(
          quoteId: quoteID,
          argument: argument,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (!isGas && !isElectricity) {
      return [];
    } else {
      return [];
    }
  }

  List<Widget> yearTWOWidget(String quoteID, ViewQuotationPageArgument argument,
      RequestQuoteViewButtonModel requestQuote) {
    if (isGas && !isElectricity) {
      return [
        ViewGasPrice2Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (isElectricity && !isGas) {
      return [
        ViewElectricity2Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (isGas && isElectricity) {
      return [
        ViewGasPrice2Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
        ViewElectricity2Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (!isGas && !isElectricity) {
      return [];
    } else {
      return [];
    }
  }

  List<Widget> yearThreeWidget(
      String quoteID,
      ViewQuotationPageArgument argument,
      RequestQuoteViewButtonModel requestQuote) {
    if (isGas && !isElectricity) {
      return [
        ViewGasPrice3Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (isElectricity && !isGas) {
      return [
        ViewElectricity3Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (isGas && isElectricity) {
      return [
        ViewGasPrice3Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
        ViewElectricity3Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (!isGas && !isElectricity) {
      return [];
    } else {
      return [];
    }
  }

  List<Widget> yearFourWidget(
      String quoteID,
      ViewQuotationPageArgument argument,
      RequestQuoteViewButtonModel requestQuote) {
    if (isGas && !isElectricity) {
      return [
        ViewGasPrice4Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (isElectricity && !isGas) {
      return [
        ViewElectricity4Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (isGas && isElectricity) {
      return [
        ViewGasPrice4Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
        ViewElectricity4Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (!isGas && !isElectricity) {
      return [];
    } else {
      return [];
    }
  }

  List<Widget> yearFiveWidget(
      String quoteID,
      ViewQuotationPageArgument argument,
      RequestQuoteViewButtonModel requestQuote) {
    if (isGas && !isElectricity) {
      return [
        ViewGasPrice5Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (isElectricity && !isGas) {
      return [
        ViewElectricity5Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (isGas && isElectricity) {
      return [
        ViewGasPrice5Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
        ViewElectricity5Year(
          quoteId: quoteID,
          requestQuote: requestQuote,
          title: widget.title,
        ),
      ];
    }
    if (!isGas && !isElectricity) {
      return [];
    } else {
      return [];
    }
  }

  List<Widget> getTaBView(ViewQuotationPageArgument argument,
      RequestQuoteViewButtonModel requestQuote) {
    List<Widget> _baseWidgets = [
      ViewIndividual(
        businessNameController: argument.businessName,
        postCodeController: TextEditingController(text: argument.postCode),
        requireByDateController:
            TextEditingController(text: argument.requireByDate),
        preferredDateController:
            TextEditingController(text: argument.preferredDate),
        oneYear: requestQuote.isforFirstyear,
        twoYear: requestQuote.isforSecondyear,
        threeYear: requestQuote.isforThirdyear,
        fourYear: requestQuote.isforFourthyear,
        fiveYear: requestQuote.isforFifthyear,
        other: requestQuote.isforOtheryear,
        customerThirdPartyMop: argument.customerThirdPartyMop,
        dcDA: argument.dcDA,
        starkDcDa: argument.starkDcDa ?? '',
        singleRate: argument.singleRate ?? '',
        quoteID: widget.quoteID,
        title: widget.title,
        otherString: requestQuote.preferredEndDate,
      ),
      // isElectricity
      ViewElectricity(
        mpancodecontroller: TextEditingController(text: requestQuote.mPAN1),
        mpanOneController: TextEditingController(text: requestQuote.mPAN2),
        mpanTwoController: TextEditingController(text: requestQuote.mPAN3),
        mpanThreeController: TextEditingController(text: requestQuote.mPAN4),
        mpanFourController: TextEditingController(text: requestQuote.mPAN5),
        mpanFiveController: TextEditingController(text: requestQuote.mPAN6),
        mpanSixController: TextEditingController(text: requestQuote.mPAN7),
        dayEacController: TextEditingController(text: argument.dayEac),
        nightEacController: TextEditingController(text: argument.nightEac),
        eweEacController: TextEditingController(text: argument.eweEac),
        title: widget.title,
      ),
      ViewGas(
        quoteID: widget.quoteID,
        mprn: TextEditingController(text: requestQuote.mPRN),
        aqCharge: TextEditingController(text: requestQuote.aQ),
        title: widget.title,
        companyId: requestQuote.intCompanyId.toString(),
      ),
      ViewPriceElectricityGasIndividual(
        quoteID: widget.quoteID,
        requestQuote: requestQuote,
        title: widget.title,
        isGasTrue: isGas,
        isElecTrue: isElectricity,
      ),
    ];
    if (oneTab) {
      _baseWidgets
          .addAll(yearONEWidget(widget.quoteID, argument, requestQuote));
    }
    if (twoTab) {
      _baseWidgets
          .addAll(yearTWOWidget(widget.quoteID, argument, requestQuote));
    }
    if (threeTab) {
      _baseWidgets
          .addAll(yearThreeWidget(widget.quoteID, argument, requestQuote));
    }
    if (fourTab) {
      _baseWidgets
          .addAll(yearFourWidget(widget.quoteID, argument, requestQuote));
    }
    if (fiveTab) {
      _baseWidgets
          .addAll(yearFiveWidget(widget.quoteID, argument, requestQuote));
    }
    return _baseWidgets;
  }

  int get requiredTabs {
    print(requestQuoteViewButtonModel.isforFirstyear);
    if (requestQuoteViewButtonModel.isforFirstyear) {
      if (isElectricity) {
        noOfTabs++;
        oneTab = true;
      }
      if (isGas) {
        noOfTabs++;
        oneTab = true;
      }
    }
    if (requestQuoteViewButtonModel.isforSecondyear) {
      if (isElectricity) {
        noOfTabs++;
        twoTab = true;
      }
      if (isGas) {
        noOfTabs++;
        twoTab = true;
      }
    }
    if (requestQuoteViewButtonModel.isforThirdyear) {
      if (isElectricity) {
        noOfTabs++;
        threeTab = true;
      }
      if (isGas) {
        noOfTabs++;
        threeTab = true;
      }
    }
    if (requestQuoteViewButtonModel.isforFourthyear) {
      if (isElectricity) {
        noOfTabs++;
        fourTab = true;
      }
      if (isGas) {
        noOfTabs++;
        fourTab = true;
      }
    }
    if (requestQuoteViewButtonModel.isforFifthyear) {
      if (isElectricity) {
        noOfTabs++;
        fiveTab = true;
      }
      if (isGas) {
        noOfTabs++;
        fiveTab = true;
      }
    }
    return noOfTabs + 4;
  }

  List<Widget> tab1() {
    if (isGas && !isElectricity) {
      return [
        Tab(
          child: Text(
            "Price(1 year) Gas",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
    if (isElectricity && !isGas) {
      return [
        Tab(
          child: Text(
            "Price(1 year) Electricity",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
    if (!isGas && !isElectricity) {
      return [];
    }
    if (isGas && isElectricity) {
      return [
        Tab(
          child: Text(
            "Price(1 year) Gas",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            "Price(1 year) Electricity",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    } else {
      return [];
    }
  }

  List<Widget> tab2() {
    if (isGas && !isElectricity) {
      return [
        Tab(
          child: Text(
            "Price(2 year) Gas",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
    if (isElectricity && !isGas) {
      return [
        Tab(
          child: Text(
            "Price(2 year) Electricity",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
    if (!isGas && !isElectricity) {
      return [];
    }
    if (isGas && isElectricity) {
      return [
        Tab(
          child: Text(
            "Price(2 year) Gas",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            "Price(2 year) Electricity",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    } else {
      return [];
    }
  }

  List<Widget> tab3() {
    if (isGas && !isElectricity) {
      return [
        Tab(
          child: Text(
            "Price(3 year) Gas",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
    if (isElectricity && !isGas) {
      return [
        Tab(
          child: Text(
            "Price(3 year) Electricity",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
    if (!isGas && !isElectricity) {
      return [];
    }
    if (isGas && isElectricity) {
      return [
        Tab(
          child: Text(
            "Price(3 year) Gas",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            "Price(3 year) Electricity",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    } else {
      return [];
    }
  }

  List<Widget> tab4() {
    if (isGas && !isElectricity) {
      return [
        Tab(
          child: Text(
            "Price(4 year) Gas",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
    if (isElectricity && !isGas) {
      return [
        Tab(
          child: Text(
            "Price(4 year) Electricity",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
    if (!isGas && !isElectricity) {
      return [];
    }
    if (isGas && isElectricity) {
      return [
        Tab(
          child: Text(
            "Price(4 year) Gas",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            "Price(4 year) Electricity",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    } else {
      return [];
    }
  }

  List<Widget> tab5() {
    if (isGas && !isElectricity) {
      return [
        Tab(
          child: Text(
            "Price(5 year) Gas",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
    if (isElectricity && !isGas) {
      return [
        Tab(
          child: Text(
            "Price(5 year) Electricity",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    }
    if (!isGas && !isElectricity) {
      return [];
    }
    if (isGas && isElectricity) {
      return [
        Tab(
          child: Text(
            "Price(5 year) Gas",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            "Price(5 year) Electricity",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ];
    } else {
      return [];
    }
  }

  List<Widget> getTabsDynamic() {
    List<Widget> baseTab = [
      Tab(
        child: Text(
          "Individual",
          style: TextStyle(
              color: globals.tabController3.index == 0
                  ? ThemeApp().purplecolor
                  : Colors.grey,
              fontWeight: FontWeight.bold),
        ),
      ),
      Tab(
        child: Text("Electricity",
            style: TextStyle(
                color: globals.tabController3.index == 1
                    ? ThemeApp().purplecolor
                    : Colors.grey,
                fontWeight: FontWeight.bold)),
      ),
      Tab(
        child: Text("Gas",
            style: TextStyle(
                color: globals.tabController3.index == 2
                    ? ThemeApp().purplecolor
                    : Colors.grey,
                fontWeight: FontWeight.bold)),
      ),
      Tab(
        child: Text(
          "Price Electricity/Gas",
          style: TextStyle(
              color: globals.tabController3.index == 3
                  ? ThemeApp().purplecolor
                  : Colors.grey,
              fontWeight: FontWeight.bold),
        ),
      ),
    ];
    if (oneTab) {
      baseTab.addAll(tab1());
    }
    if (twoTab) {
      baseTab.addAll(tab2());
    }
    if (threeTab) {
      baseTab.addAll(tab3());
    }
    if (fourTab) {
      baseTab.addAll(tab4());
    }
    if (fiveTab) {
      baseTab.addAll(tab5());
    }
    return baseTab;
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? BaseView<ViewRequestQuoteViewModel>(
            onModelReady: (model) => model.getViewQuoteViewButtonDetails(
                AppString.indvidual, widget.quoteID, context),
            builder: (context, model, child) {
              if (model.state == ViewState.BUSY) {
                return AppConstant.circularProgressIndicator();
              }

              double width = MediaQuery.of(context).size.width;
              double tabWidth = width / noOfTabs;

              return Scaffold(
                backgroundColor: Colors.white,
                key: scaffoldKey,
                appBar: appbar("Quotation", context, scaffoldKey, true, true),
                drawer: DrawerWidget(),
                body: Column(
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
                        tabs: getTabsDynamic(),
                        controller: globals.tabController3,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: getTaBView(
                            ViewQuotationPageArgument(
                              addTab: addAnotherTab,
                              businessName: model.requestQuoteViewButtonModel
                                      .businessName ??
                                  '',
                              postCode:
                                  model.requestQuoteViewButtonModel.postCode ??
                                      '',
                              requireByDate: model.requestQuoteViewButtonModel
                                      .requiredByDate ??
                                  '',
                              preferredDate: model.requestQuoteViewButtonModel
                                      .preferredStartDate ??
                                  '',
                              oneYear: model.oneYear ?? '',
                              twoYear: model.twoYear ?? '',
                              threeYear: model.threeYear ?? '',
                              fourYear: model.fourYear ?? '',
                              fiveYear: model.fiveYear ?? '',
                              other: model.other ?? '',
                              customerThirdPartyMop: model
                                      .requestQuoteViewButtonModel
                                      .thirdPartyMOP ??
                                  '',
                              dcDA: model.requestQuoteViewButtonModel
                                      .isStarkDADC ??
                                  '',
                              starkDcDa: model.requestQuoteViewButtonModel
                                      .isStarkDADC ??
                                  '',
                              singleRate: model
                                      .requestQuoteViewButtonModel.singleRate ??
                                  '',
                              quoteID: model.requestQuoteViewButtonModel.quoteid
                                  .toString(),
                              mpancode: model.requestQuoteViewButtonModel.mPAN1,
                              mpanOne: model.requestQuoteViewButtonModel.mPAN2,
                              mpanTwo: model.requestQuoteViewButtonModel.mPAN3,
                              mpanThree:
                                  model.requestQuoteViewButtonModel.mPAN4,
                              mpanFour: model.requestQuoteViewButtonModel.mPAN5,
                              mpanFive: model.requestQuoteViewButtonModel.mPAN6,
                              mpanSix: model.requestQuoteViewButtonModel.mPAN7,
                              dayEac: model.requestQuoteViewButtonModel.eACDay,
                              nightEac:
                                  model.requestQuoteViewButtonModel.eACNight,
                              eweEac: model.requestQuoteViewButtonModel.eACEWE,
                            ),
                            requestQuoteViewButtonModel),
                        controller: globals.tabController3,
                      ),
                    )
                  ],
                ),
              );
            })
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}

// recent push 6-1-21
