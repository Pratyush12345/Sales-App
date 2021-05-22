import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Pages/Add-Prospect-FormTab-view/Gas/Tab/PrimaryContactDetails.dart';
import 'package:pozitive/Pages/Add-Prospect-FormTab-view/Gas/Tab/gastab.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Pages/Add-Prospect-FormTab-view/Gas/Tab/siteAddressTab.dart';
import 'package:pozitive/Pages/Add-Prospect-FormTab-view/Gas/Tab/billingAddressTab.dart';
import 'package:pozitive/Pages/Add-Prospect-FormTab-view/Gas/Tab/energyAccountManagerTab.dart';
import 'package:pozitive/Pages/Add-Prospect-FormTab-view/Gas/Tab/pymentDetails.dart';
import 'package:pozitive/Pages/Add-Prospect-FormTab-view/Gas/Tab/partnerDetails.dart';
import 'package:pozitive/Pages/Add-Prospect-FormTab-view/Gas/Tab/groupDetails.dart';
import 'package:pozitive/Pages/Add-Prospect-FormTab-view/Gas/Tab/businessDetailsTab.dart';
import 'package:pozitive/Pages/Add-Prospect-FormTab-view/Gas/Tab/BusinessTypeDetailsGas.dart';
import 'package:pozitive/Widget/drawerwidget.dart';

class Gas extends StatefulWidget {
  @override
  _GasState createState() => _GasState();
}

class _GasState extends State<Gas> with TickerProviderStateMixin {
  //TabController _tabController;
  List<Tab> _tabs = List<Tab>();
  List<Widget> _generalWidgets = List<Widget>();

  @override
  void initState() {
    _tabs = getTabs(10);
    globals.tabController = getTabController();
    super.initState();
  }

  TabController getTabController() {
    return TabController(length: _tabs.length, vsync: this);
  }

  void updatePage() {
    print('gassssssss${_tabs.length}');
    _tabs = getTabs(_tabs.length + 1);
    print('gassssssss${_tabs.length}');

    globals.tabController.index = 0;
    globals.tabController = TabController(length: 10, vsync: this);
    print('gassssssssdasffffffffffs${_tabs.length}');
  }

  List<Tab> getTabs(int count) {
    _tabs.clear();
    for (int i = 0; i < count; i++) {
      _tabs.add(getTab(i));
    }
    return _tabs;
  }

  Tab getTab(int widgetNumber) {
    new Tab(
      child: Text("Gas",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Business Details",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Site Address",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Billing Address",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Primary Contact Detail",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Energy Account Manager",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Business OwnerShip Details",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Payment Details",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Partner Details",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
    new Tab(
      child: Text("Group Details",
          style: TextStyle(
              color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
    );
  }

  List<Widget> getTabRow() {
    if (_tabs.length == 9) {
      return [
        new Tab(
          child: Text("Gas",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Business Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Site Address",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Billing Address",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Primary Contact Detail",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Energy Account Manager",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Payment Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Partner Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Group Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
      ];
    } else {
      return [
        new Tab(
          child: Text("Gas",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Business Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Site Address",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Billing Address",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Primary Contact Detail",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Energy Account Manager",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Business OwnerShip Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Payment Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Partner Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
        new Tab(
          child: Text("Group Details",
              style: TextStyle(
                  color: ThemeApp().purplecolor, fontWeight: FontWeight.bold)),
        ),
      ];
    }
  }

  List<Widget> getWidgets() {
    if (_tabs.length == 9) {
      return [
        GasTab(),
        BusinessDetailsTab(
          increment: updatePage,
        ),
        SiteAddressTab(),
        BillingAddressTab(),
        PrimaryContactDetail(),
        EnergyAccountManager(),
        PaymentDetailsTab(),
        PartnerDetailsTab(),
        GroupDetailsTab()
      ];
    } else {
      return [
        GasTab(),
        BusinessDetailsTab(
          increment: updatePage,
        ),
        SiteAddressTab(),
        BillingAddressTab(),
        PrimaryContactDetail(),
        EnergyAccountManager(),
        GasBusinessTypeDetails(),
        PaymentDetailsTab(),
        PartnerDetailsTab(),
        GroupDetailsTab()
      ];
    }
  }

  void _handleTabSelection() {
    setState(() {
      globals.tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Gas'),
      ),
      // drawer: DrawerWidget(),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(228, 241, 215, 1),
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: ThemeApp().purplecolor,
              indicatorColor: ThemeApp().purplecolor,
              isScrollable: true,
              tabs: getTabRow(),
              controller: globals.tabController,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: getWidgets(),
              controller: globals.tabController,
            ),
          )
        ],
      ),
    );
  }
}
