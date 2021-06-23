import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/view_group_details_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
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

class ViewGroupDetailsPage extends StatefulWidget {
  final String groupId;
  dynamic loaddata;
  final String status;
  ViewGroupDetailsPage({@required this.groupId,this.loaddata,this.status});
  @override
  _ViewGroupDetailsPageState createState() => _ViewGroupDetailsPageState();
}

class _ViewGroupDetailsPageState extends State<ViewGroupDetailsPage> {
  var key;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<ViewGroupDetailViewModel>(
        onModelReady: (model) => model.initializeData(
          groupId: widget.groupId,
          context: context,
          check: true,
          loaddata: widget.loaddata,
        ),
        builder: (context, model, child) {
          if (model.state == ViewState.BUSY) {
            return AppConstant.circularProgressIndicator();
          }
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .025,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .02,
                              right: MediaQuery.of(context).size.width * .02),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height * 0.060,
//                  width: MediaQuery.of(context).size.width,
                                color: Color.fromRGBO(18, 122, 69, 1),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left:
                                      MediaQuery.of(context).size.height * 0.017,
                                      top: MediaQuery.of(context).size.height * 0.017,
                                      bottom:
                                      MediaQuery.of(context).size.height * 0.017),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width * .02,
                                      ),
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width * .36,
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
                                        width:
                                        MediaQuery.of(context).size.width * .03,
                                      ),
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width * .32,
                                        child: Text(
                                          AppString.mpanOrmprn,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                              MediaQuery.of(context).size.height *
                                                  0.022),
                                        ),
                                      ),
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width * .15,
                                        child: Text(
                                          "   ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                              MediaQuery.of(context).size.height *
                                                  0.02),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: groupDetailslst.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GroupQuoteDetailList(
                                      groupDetailslst: groupDetailslst,
                                      index: index,
                                      viewlist: viewlist,
                                      active: true,
                                    );
                                  }),
                            ],
                          ),

                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .15,
                        ),
                       skippedmapnlist.isNotEmpty ?
                           Column(
                             children: [
                               SizedBox(
                                 height: MediaQuery.of(context).size.width * .04,
                               ),
                               Padding(
                                 padding: EdgeInsets.only(
                                     left: MediaQuery.of(context).size.width * .02,
                                     right: MediaQuery.of(context).size.width * .02),
                                 child: Container(
                                   height: MediaQuery.of(context).size.height * 0.060,
//                  width: MediaQuery.of(context).size.width,
                                   color: Color.fromRGBO(18, 122, 69, 1),
                                   child: Padding(
                                     padding: EdgeInsets.only(
                                         left:
                                         MediaQuery.of(context).size.height * 0.017,
                                         top: MediaQuery.of(context).size.height * 0.017,
                                         bottom:
                                         MediaQuery.of(context).size.height * 0.017),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: <Widget>[
                                         SizedBox(
                                           width:
                                           MediaQuery.of(context).size.width * .02,
                                         ),
                                         Container(
                                           width:
                                           MediaQuery.of(context).size.width * .36,
                                           child: Text(
                                             "Skipped MPANs",
                                             style: TextStyle(
                                                 color: Colors.white,
                                                 fontWeight: FontWeight.bold,
                                                 fontSize:
                                                 MediaQuery.of(context).size.height *
                                                     0.022),
                                           ),
                                         ),

                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(
                                 height: MediaQuery.of(context).size.width * .01,
                               ),
                               Padding(
                                 padding: EdgeInsets.only(
                                     left: MediaQuery.of(context).size.width * .02,
                                     right: MediaQuery.of(context).size.width * .02),
                                 child: Column(
                                   children: <Widget>[
                                     Container(
                                       height: MediaQuery.of(context).size.height * 0.050,
//                  width: MediaQuery.of(context).size.width,
                                       color: Color.fromRGBO(18, 122, 69, 1),
                                       child: Padding(
                                         padding: EdgeInsets.only(
                                             left:
                                             MediaQuery.of(context).size.height * 0.010,
                                             top: MediaQuery.of(context).size.height * 0.010,
                                             bottom:
                                             MediaQuery.of(context).size.height * 0.017),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           children: <Widget>[
                                             SizedBox(
                                               width:
                                               MediaQuery.of(context).size.width * .02,
                                             ),
                                             Container(
                                               width:
                                               MediaQuery.of(context).size.width * .36,
                                               child: Text(
                                                 "MPAN_Core",
                                                 style: TextStyle(
                                                     color: Colors.white,
                                                     fontWeight: FontWeight.bold,
                                                     fontSize:
                                                     MediaQuery.of(context).size.height *
                                                         0.020),
                                               ),
                                             ),
                                             SizedBox(
                                               width:
                                               MediaQuery.of(context).size.width * .02,
                                             ),
                                             Container(
                                               width:
                                               MediaQuery.of(context).size.width * .32,
                                               child: Text(
                                                 "Reason",
                                                 style: TextStyle(
                                                     color: Colors.white,
                                                     fontWeight: FontWeight.bold,
                                                     fontSize:
                                                     MediaQuery.of(context).size.height *
                                                         0.020),
                                               ),
                                             ),
                                             Container(
                                               width:
                                               MediaQuery.of(context).size.width * .15,
                                               child: Text(
                                                 "   ",
                                                 style: TextStyle(
                                                     color: Colors.white,
                                                     fontWeight: FontWeight.bold,
                                                     fontSize:
                                                     MediaQuery.of(context).size.height *
                                                         0.02),
                                                 textAlign: TextAlign.center,
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     ),

                                     ListView.builder(
                                         padding: EdgeInsets.all(0),
                                         shrinkWrap: true,
                                         physics: NeverScrollableScrollPhysics(),
                                         itemCount: skippedmapnlist.length,
                                         itemBuilder: (BuildContext context, int index) {
                                           return GroupQuoteDetailList(
                                             groupDetailslst: groupDetailslst,
                                             index: index,
                                             viewlist: viewlist,
                                             active: false,
                                             skippedmpanlist: skippedmapnlist,
                                           );
                                         }),
                                     SizedBox(
                                       height:
                                       MediaQuery.of(context).size.width * .2,
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ) : Container(),
                      ],
                    ),
                  ),
                ),
                widget.status ==  "Quoted" ? Container(
                  padding: EdgeInsets.all(20),
                  child: PurpleFlatButton(
                    text: 'Next',
                    onTap: () => model.goToNext(),
                  ),
                ) : Container(),
                widget.status ==  "Accepted" ? Container(
                  padding: EdgeInsets.all(20),
                  child: PurpleFlatButton(
                    text: 'Next',
                    onTap: () => model.goToNext(),
                  ),
                ) : Container(),
              ],
            )
          );
        },
      ),
    );
  }
}
