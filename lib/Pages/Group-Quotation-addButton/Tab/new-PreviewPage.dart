import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/purple_flat_button.dart';
import 'package:pozitive/Widget/Group-Quotation-Widget/Group-Preview-Widget.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/providers/site_list_provider.dart';
import 'package:pozitive/providers/quotation_detail_provider.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/preview_page_group_view_model.dart';
import 'package:pozitive/providers/tabcontroller3_provider.dart';


class Previewpage extends StatefulWidget {
  @override
  _PreviewpageState createState() => _PreviewpageState();
}

class _PreviewpageState extends State<Previewpage> {
  var key;
  bool isSwitched = false;
  TextEditingController partnercontroller = TextEditingController();
  ThemeApp themeApp = ThemeApp();

  List viewlist = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 20; i++) {
      setState(() {
        viewlist.add({"view": false, "click": false, "checkbox": false});
      });
    }
  }

  SiteListProvider siteListProviderData;
  GroupQuotaionDetailsProvider quotationDetailsProviderData;
  TabController3Provider tabController3Provider;

  @override
  Widget build(BuildContext context) {
    tabController3Provider = Provider.of<TabController3Provider>(context);
    siteListProviderData = Provider.of<SiteListProvider>(context);
    quotationDetailsProviderData =
        Provider.of<GroupQuotaionDetailsProvider>(context);
    return Scaffold(
      body: BaseView<PreviewPageGroupViewModel>(
        builder: (context, model, child) {
          if (model.state == ViewState.BUSY) {
            return AppConstant.circularProgressIndicator();
          }
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .04,
                      right: MediaQuery.of(context).size.width * .04,
                      top: MediaQuery.of(context).size.width * .04,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.060,
                          color: Color.fromRGBO(18, 122, 69, 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .02,
                              ),
                              Container(
                                child: Text(
                                  AppString.businessName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.022),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .03,
                              ),
                              Container(
                                child: Text(
                                  AppString.mpanOrmprn,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount:
                                siteListProviderData.siteListProvider.length,
                            itemBuilder: (BuildContext context, int index) {
                              return PreviewListWidget(
                                isGreenCerti: siteListProviderData
                                    .siteListProvider[index]
                                    .bisGreenCertificate,
                                isSingleRate: siteListProviderData
                                    .siteListProvider[index].bIsSingleRate,
                                index: index,
                                viewlist: viewlist,
                                businessName: siteListProviderData
                                    .siteListProvider[index].businessName,
                                businessNameErr: siteListProviderData
                                    .siteListProvider[index].businessNameErr,
                                mpan: siteListProviderData
                                    .siteListProvider[index].fullMpanNumber,
                                mpanErr: siteListProviderData
                                    .siteListProvider[index].mpanErr,
                                mprn: siteListProviderData
                                    .siteListProvider[index].gasMprn,
                                mprnErr: siteListProviderData
                                    .siteListProvider[index].mprnErr,
                                preferredStartDate: siteListProviderData
                                    .siteListProvider[index]
                                    .dteContractStartDate,
                                preferredStartDateErr: siteListProviderData
                                    .siteListProvider[index].startDateErr,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: PurpleFlatButton(
                    onTap: () {
                      model.onAskForQuoteFinal(
                        tabController3Provider: tabController3Provider,
                        siteListProviderData: siteListProviderData,
                        context: context,
                        quotationDetailsProviderData:
                            quotationDetailsProviderData,
                      );
                    },
                    text: 'Ask For Quote',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
