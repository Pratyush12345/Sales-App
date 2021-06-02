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

class oneYearPage extends StatefulWidget {
  final String groupId;
  oneYearPage({@required this.groupId});
  @override
  _oneYearPageState createState() => _oneYearPageState();
}

class _oneYearPageState extends State<oneYearPage> {
  var key;
  TextEditingController partnercontroller = TextEditingController();
  ThemeApp themeApp = ThemeApp();

  List viewlist = [];

  @override
  void initState() {
    super.initState();
    if(m != null)
      {m.clear();}
    for (int i = 0; i < 20; i++) {
      setState(() {
        viewlist.add({"view": false, "click": false, "checkbox": false});
      });
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
          if (model.state == ViewState.BUSY) {
            return AppConstant.circularProgressIndicator();
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
//                         Container(
//                           height: MediaQuery.of(context).size.height * 0.060,
// //                  width: MediaQuery.of(context).size.width,
//                           color: Color.fromRGBO(18, 122, 69, 1),
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                                 left:
//                                 MediaQuery.of(context).size.height * 0.017,
//                                 top: MediaQuery.of(context).size.height * 0.017,
//                                 bottom:
//                                 MediaQuery.of(context).size.height * 0.017),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: <Widget>[
//                                 SizedBox(
//                                   width:
//                                   MediaQuery.of(context).size.width * .02,
//                                 ),
//                                 Container(
//                                   width:
//                                   MediaQuery.of(context).size.width * .36,
//                                   child: Text(
//                                     AppString.businessName,
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize:
//                                         MediaQuery.of(context).size.height *
//                                             0.022),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width:
//                                   MediaQuery.of(context).size.width * .03,
//                                 ),
//                                 Container(
//                                   width:
//                                   MediaQuery.of(context).size.width * .32,
//                                   child: Text(
//                                     AppString.mpanOrmprn,
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize:
//                                         MediaQuery.of(context).size.height *
//                                             0.022),
//                                   ),
//                                 ),
//                                 Container(
//                                   width:
//                                   MediaQuery.of(context).size.width * .15,
//                                   child: Text(
//                                     "   ",
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize:
//                                         MediaQuery.of(context).size.height *
//                                             0.02),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
                        Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              itemCount: oneYear.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GroupQuotePriceList(
                                  groupDetailslst: oneYear,
                                  index: index,
                                  viewlist: viewlist,
                                  type: "MPAN",
                                );
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.058,
                            child: TextButton(
                              child: Text(
                                "Generate Site",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.height * 0.019,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: (){
                                GenerateSite();
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(

                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.058,
                            child: TextButton(
                            child: Text(
                              "Remove Site",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height * 0.019,
                                  fontWeight: FontWeight.bold),
                            ),
                              onPressed: (){
                                model.RemoveSite(
                                  grpId: widget.groupId,
                                  context: context,
                                  Year: '1',
                                );
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





































          //   Container(
          //   color: Colors.white,
          //   child: Column(
          //
          //     children :
          //
          //       [ SizedBox(
          //         height: MediaQuery.of(context).size.width * .025,
          //       ),
          //         Padding(
          //         padding: EdgeInsets.only(
          //             left: MediaQuery.of(context).size.width * .02,
          //             right: MediaQuery.of(context).size.width * .02),
          //         child: Column(
          //           children: [
          //           Expanded(child:   ListView.builder(
          //               physics: const AlwaysScrollableScrollPhysics(),
          //               padding: EdgeInsets.all(0),
          //               shrinkWrap: true,
          //               itemCount: oneYear.length,
          //               itemBuilder: (BuildContext context, int index) {
          //                 return GroupQuotePriceList(
          //                   groupDetailslst: oneYear,
          //                   index: index,
          //                   viewlist: viewlist,
          //                   type: 'MPAN',
          //                 );
          //               }),
          //           ),
          //             // ListView.builder(
          //             //     physics: const AlwaysScrollableScrollPhysics(),
          //             //     padding: EdgeInsets.all(0),
          //             //     shrinkWrap: true,
          //             //     itemCount: oneYearmprn.length,
          //             //     itemBuilder: (BuildContext context, int index) {
          //             //       return GroupQuotePriceList(
          //             //         groupDetailslst: oneYearmprn,
          //             //         index: index,
          //             //         viewlist: viewlist,
          //             //         type: 'MPRN',
          //             //       );
          //             //     })
          //           ],
          //         ),
          //       ),
          //   ]
          //   ),
          // );
        },
      ),
    );
  }
}
