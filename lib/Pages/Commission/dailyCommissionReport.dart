import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/daily_commission_report_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commission/commission_item_widget.dart';
import 'package:pozitive/Widget/commission/DailyCommissionReport_widget.dart';
import 'package:provider/provider.dart';

class DailyCommissionReport extends StatefulWidget {
  @override
  _DailyCommissionReportState createState() => _DailyCommissionReportState();
}

class _DailyCommissionReportState extends State<DailyCommissionReport> {
  var key;
  ThemeApp themeApp = ThemeApp();
  final _formKey = GlobalKey<FormState>();

  List requestedlist = [
    {
      "Postcode": "125643",
      "PozitiveCustID": "123",
      "ContractStartDate": "17/02/2020",
      "ContractEndDate": "17/02/2020",
      "Fuel": "All",
      "Mpanprnno": "159369.6158",
      "Invoiceno": "159369.6158",
      "Supplyfrom": "-",
      "Supplyto": "-",
      "Billdays": "-",
      "Billeddaykwh": "-",
      "Daycontractprice": "-",
      "Billednightkwh": "-",
      "Nightcontractprice": "-",
      "BilledEWEkwh": "-",
      "EWEcontractprice": "-",
      "BilledTotalkwh": "-",
      "SCcontractprice": "-",
      "SCtotaldays": "-",
      "Subtotal": "-",
      "Fixedamount": "-",
      "Commissionamountclaimed": "-",
      "Totalclaimed": "-",
      "business_name": "Young Mei Wong",
      "customer_name": "Young Mei Wong",
      "invoice_total": "Sales commissions"
    }
  ];
  List viewlist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 20; i++) {
      setState(() {
        viewlist.add({"view": false, "click": false, "checkbox": false});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar:
          appbar(AppString.dailyCommissionReport, context, key, false, true),
      body: BaseView<DailyCommissionReportViewModel>(
        onModelReady: (model) => model.getDaily(user.accountId, context),
        builder: (context, model, child) {
          return Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03),
            child: ListView(children: <Widget>[
              CommissionReportWidget(
                dailyCommissionReportViewModel: model,
                formkey: key,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .07,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .02,
                    right: MediaQuery.of(context).size.width * .02),
                child: Column(
                  children: <Widget>[
                    Container(
//                  width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(18, 122, 69, 1),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.017,
                            bottom: MediaQuery.of(context).size.height * 0.017),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * .31,
                                child: Text(
                                  "Business Name",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width * .28,
                                child: Text(
                                  "Customer Name",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width * .26,
                                child: Text(
                                  "Action",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ),
                    ),
                    /*   BaseView<GetDailyCommissionViewModel>(
                              builder: (context,model,child){
                                if(model.state==ViewState.BUSY){
                                  return AppConstant.circularProgressIndicator();
                                }*/
                    model.state == ViewState.BUSY
                        ? AppConstant.circularProgressIndicator()
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: model.lstGetDailycommission
                                .brokerCommissionList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CommissionItemWidget(
                                lstGetDailycommission:
                                    model.lstGetDailycommission,
                                index: index,
                                viewlist: viewlist,
                                requestedlist: requestedlist,
                              );
                            })
                  ],
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
