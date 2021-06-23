import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/group_final_Qutation_viewmodel.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/view_group_details_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/IndividualPriceMpanorMprn.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Widget/Group-Quotation-Widget/GroupQuoteDetailList-Widget.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/purple_flat_button.dart';
import 'package:pozitive/providers/quotation_detail_provider.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/providers/tabcontroller3_provider.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Pages/Group-Quotation/visibility_popup.dart';

class fourYearPage extends StatefulWidget {
  final String groupId;
  final String status;
  fourYearPage({@required this.groupId,this.status});
  @override
  _fourYearPageState createState() => _fourYearPageState();
}

class _fourYearPageState extends State<fourYearPage> {
  var key;
  TextEditingController partnercontroller = TextEditingController();
  ThemeApp themeApp = ThemeApp();

  List viewlist = [];
  TextEditingController visibilityGroupName = TextEditingController();
  bool load = false;
  @override
  void initState() {
    super.initState();
    prevIndex=null;

    setState(() {
      load = false;
    });
    for (int i = 0; i < 20; i++) {
      setState(() {
        viewlist.add({"view": false, "click": false, "checkbox": false});
      });
    }
  }
  Future<String> checkupliftvalidation() async{
    //print(oneYear[0].checkItem);
    int c=0;
    for(int i=0;i<fourYear.length;i++){
      if(fourYear[i].checkItem){
        if(fourYear[i].mpan != "" && fourYear[i].mpan != null ){
          if(fourYear[i].requiredUpliftDay == '' || fourYear[i].requiredUpliftNight == '' ||fourYear[i].requiredUpliftEWE == '' ||fourYear[i].requiredUpliftSc == ''  ){
            return "Please fill Required fields at Site ${i+1} ";
          }
        }
        if(fourYear[i].mprn != "" && fourYear[i].mprn != null){
          if(fourYear[i].requiredUpliftDayGas == '' || fourYear[i].requiredUpliftScGas == ''  ){
            return "Please fill Required fields at Site ${i+1} ";
          }
        }
      }
      else{
        c++;
      }
    }
    if(c == fourYear.length){
      return "Not Selected any Site!";
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<ViewGroupDetailViewModel>(
        onModelReady: (model) => model.initializeData(
          groupId: widget.groupId,
          context: context,
          check: false,
        ),
        builder: (context, model, child) {
          if (model.state == ViewState.BUSY || load == true) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Scaffold(
                body: Center(
                  child: AppConstant.circularProgressIndicator(),
                ),
              ),
            );
          }
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width * .025,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .04,
                        right: MediaQuery.of(context).size.width * .04),
                    child: Column(
                      children: <Widget>[
//
                        Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              itemCount: fourYear.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GroupQuotePriceList(
                                  groupDetailslst: fourYear,
                                  index: index,
                                  viewlist: viewlist,
                                    type: "MPAN",
                                  groupdetailsprice: groupDetailslst,
                                  yearType: "4",
                                );
                              }),
                        ),
                        widget.status != "Accepted"
                            ? Column(
                          children: [
                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                MediaQuery.of(context).size.height *
                                    0.058,
                                child: TextButton(
                                  child: Text(
                                    "Generate Contract",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.019,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () async {
                                    String s =
                                    await checkupliftvalidation();
                                    bool valid = false;
                                    var response;
                                    print(s);
                                    if (s == null) {
                                      setState(() {
                                        load = true;
                                      });
                                      print(load);
                                      finalQuotationpPriceModel
                                      finalprocemodel =
                                      finalQuotationpPriceModel();

                                      response = await finalprocemodel
                                          .GenerateSite(
                                        termType: "4",
                                        visGroupName:
                                        visibilityGroupName.text,
                                      );
                                      setState(() {
                                        load = false;
                                      });
                                      if (response['status'] != "1") {
                                        // AppConstant.showFailToast(
                                        //     context, response['msg'] ?? 'Failed');
                                        setState(() {
                                          valid = true;
                                        });
                                      }
                                      print(load);
                                    }

                                    showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return customDialog(
                                            s: s,
                                            response: response,
                                            visibilityGroupName:
                                            visibilityGroupName,
                                            validation: valid,
                                            termtype: "4",
                                          );

                                        });

                                    // GroupQuotePriceList vs = GroupQuotePriceList();
                                    // vs.checkupliftvalidation();
                                  },
                                ),
                                decoration: BoxDecoration(
                                    color:
                                    Color.fromRGBO(155, 119, 217, 1),
                                    borderRadius:
                                    BorderRadius.circular(30)),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width *
                                  0.03,
                            ),
                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                MediaQuery.of(context).size.height *
                                    0.058,
                                child: TextButton(
                                  child: Text(
                                    "Remove Site",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.019,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    model.RemoveSite(
                                      grpId: widget.groupId,
                                      context: context,
                                      Year: '5',
                                    );
                                  },
                                ),
                                decoration: BoxDecoration(
                                    color:
                                    Color.fromRGBO(155, 119, 217, 1),
                                    borderRadius:
                                    BorderRadius.circular(30)),
                              ),
                            ),
                          ],
                        )
                            : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height *
                                0.058,
                            child: TextButton(
                              child: Text(
                                "Download Contract",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.019,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                // model.RemoveSite(
                                //   grpId: widget.groupId,
                                //   context: context,
                                //   Year: '1',
                                // );
                              },
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(155, 119, 217, 1),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.all(20),
                //   child: PurpleFlatButton(
                //     text: 'Next',
                //     onTap: () => model.goToNext(),
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
