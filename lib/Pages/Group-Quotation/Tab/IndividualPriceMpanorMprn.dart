import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/group_final_Qutation_viewmodel.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/view_group_details_viewmodel.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/yearvisedetails.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Core/Model/group_details_sub_model.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/view_price_ele_gas_1year.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as htp;
import 'dart:convert';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Pages/Group-Quotation/EditSite.dart';

class GroupQuotePriceList extends StatefulWidget {
  final int index;
  final List viewlist;
  final List<EachyYearList> groupDetailslst;
  final String type;
  GroupQuotePriceList(
      {this.index, this.viewlist, @required this.groupDetailslst, this.type});

  @override
  _GroupQuotePriceListState createState() => _GroupQuotePriceListState();
}

class _GroupQuotePriceListState extends State<GroupQuotePriceList> {
  final ThemeApp themeApp = ThemeApp();
  String mpanOrMprn = '';
  RequestQuoteViewButtonModel requestQuoteViewButtonModel =
      RequestQuoteViewButtonModel();
  bool check = false;
  String title = '';
  Future<void> Editsite() async {
    // setState(ViewState.BUSY);
    var s = widget.groupDetailslst[widget.index].mpan;
    if(s!=''){
      mpan1.text='';
      for(int i=0;i<2;i++){
        mpan1.text +=  s[i];
        //print(s[i]);
      }
      mpan2.text='';
      for(int i=2;i<5;i++){
        mpan2.text += s[i];
      }
      mpan3.text='';
      for(int i=5;i<8;i++){
        mpan3.text += s[i];
      }
      mpan4.text='';
      for(int i=8;i<10;i++){
        mpan4.text += s[i];
      }
      mpan5.text='';
      for(int i=10;i<14;i++){
        mpan5.text += s[i];
      }
      mpan6.text='';
      for(int i=14;i<18;i++){
        mpan6.text += s[i];
      }
      mpan7.text='';
      for(int i=18;i<=20;i++){
        mpan7.text += s[i];
      }
     // conStartDate.text='';

      // if( widget.groupDetailslst[widget.index].mprn == ''){
      //   dayEAC.text = "0";
      //   nightEAC.text = "0";
      //   strAq.text = '0';
      // }
      // else{
      //   strAq.text = eacvalues[ widget.groupDetailslst[widget.index].mprn].strAq;
      //   // dayEAC.text = eacvalues[ widget.groupDetailslst[widget.index].mpan].EACDay;
      //   // nightEAC.text = eacvalues[ widget.groupDetailslst[widget.index].mpan].EACnight;
      // }
        // dayEAC.text = eacvalues[""].EACDay ?? "";
        // nightEAC.text = eacvalues[""].EACnight ?? "";

    }
    conStartDate.text = widget.groupDetailslst[widget.index].contractStartDate;

    dayEAC.text = '0';
    nightEAC.text = '0';
    strAq.text = eacvalues[widget.groupDetailslst[widget.index].mprn].strAq;
    mprnedit.text = widget.groupDetailslst[widget.index].mprn;
    print(eacvalues[widget.groupDetailslst[widget.index].mprn].strAq);

  }

  String getMpanOrMprn() {
    //print(widget.groupDetailslst[widget.index].mprn);
    if (widget.groupDetailslst[widget.index].mpan == '') {
      {
        mpanOrMprn = widget.groupDetailslst[widget.index].mprn;
      }
    } else if (widget.groupDetailslst[widget.index].mprn == '') {
      {
        mpanOrMprn = widget.groupDetailslst[widget.index].mpan;
      }
    } else {
      mpanOrMprn =
          '${widget.groupDetailslst[widget.index].mpan} / ${widget.groupDetailslst[widget.index].mprn}';
    }
    // if(widget.type == "MPAN"){
    //   mpanOrMprn = widget.groupDetailslst[widget.index].mpan;
    // }
    // else{
    //   mpanOrMprn = widget.groupDetailslst[widget.index].mprn;
    // }

    return mpanOrMprn; //'MPAN : ' + widget.groupDetailslst[widget.index].mpan;
  }

  bool mprn = false;
  String titlestring() {
    if (widget.groupDetailslst[widget.index].mpan == '') {
      {
        title = 'MPRN';
      }
    } else if (widget.groupDetailslst[widget.index].mprn == '') {
      {
        title = 'MPAN';
      }
    }

    return title + ' : ';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              bottom: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                // Expanded(
                //   flex: 3,
                //   child: Padding(
                //     padding: const EdgeInsets.all(5.0),
                //     child: Text(
                //       widget.groupDetailslst[widget.index].tremtype ?? "",
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //           color: Colors.grey,
                //           fontSize: MediaQuery.of(context).size.width * 0.033),
                //     ),
                //   ),
                // ),
                check
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            check = false;
                            if (widget.groupDetailslst[widget.index].tremtype ==
                                '1') {
                              oneYear[widget.index].checkItem = false;
                            } else if (widget
                                    .groupDetailslst[widget.index].tremtype ==
                                '2') {
                              twoYear[widget.index].checkItem = false;
                            } else if (widget
                                    .groupDetailslst[widget.index].tremtype ==
                                '3') {
                              threeYear[widget.index].checkItem = false;
                            } else if (widget
                                    .groupDetailslst[widget.index].tremtype ==
                                '4') {
                              fourYear[widget.index].checkItem = false;
                            }
                            print(check);
                            print(widget.index);
                          });
                        },
                        child: Icon(
                          Icons.check_box,
                          color: Colors.green,
                          size: MediaQuery.of(context).size.height * .03,
                        ),
                      )
                    : InkWell(
                        child: Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.green,
                          size: MediaQuery.of(context).size.height * .03,
                        ),
                        onTap: () {
                          setState(() {
                            check = true;
                            if (widget.groupDetailslst[widget.index].tremtype ==
                                '1') {
                              oneYear[widget.index].checkItem = true;
                            } else if (widget
                                    .groupDetailslst[widget.index].tremtype ==
                                '2') {
                              twoYear[widget.index].checkItem = true;
                            } else if (widget
                                    .groupDetailslst[widget.index].tremtype ==
                                '3') {
                              threeYear[widget.index].checkItem = true;
                            } else if (widget
                                    .groupDetailslst[widget.index].tremtype ==
                                '4') {
                              fourYear[widget.index].checkItem = true;
                            }
                            print(check);
                          });
                        },
                      ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .001,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    titlestring(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    getMpanOrMprn(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                title == "MPRN" ?
                SizedBox(
                        width: MediaQuery.of(context).size.width * .33,
                      ) :
                SizedBox(
                  width: MediaQuery.of(context).size.width * .06,
                )
                ,
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: CupertinoButton(
                    onPressed: () async {
                      print(eacvalues[widget.groupDetailslst[widget.index].mprn].strAq);
                      await Editsite();
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return Dialog(
                              child: dialogcontainer(context, ctx, widget.groupDetailslst,widget.index,title),
                            );
                          });
                      // setState(() {
                      //   widget.viewlist[widget.index]["click"] =
                      //   !widget.viewlist[widget.index]["click"];
                      // });
                    },
                    minSize: double.minPositive,
                    padding: EdgeInsets.zero,
                    //color: Colors.green,
                    child: Icon(
                      FontAwesomeIcons.pencilAlt,
                      color: Colors.green,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .01,
                ),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: CupertinoButton(
                    onPressed: () {
                      setState(() {
                        widget.viewlist[widget.index]["click"] =
                            !widget.viewlist[widget.index]["click"];
                      });
                    },
                    minSize: 16,
                    padding: EdgeInsets.zero,
                    // color: Colors.green,
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.green,
                      size: 18,
                    ),
                  ),

                  // IconButton(
                  //   //minSize: double.minPositive,
                  //   padding: EdgeInsets.zero,
                  //   onPressed: () {
                  //     setState(() {
                  //       widget.viewlist[widget.index]["click"] =
                  //           !widget.viewlist[widget.index]["click"];
                  //     });
                  //   },
                  //   color: Colors.green,
                  //   icon: FaIcon(FontAwesomeIcons.plus),
                  //   iconSize: 16.0,
                  // ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .01,
                ),
                // InkWell(
                //   child: Container(
                //     //width: MediaQuery.of(context).size.width * .32,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: <Widget>[
                //           Icon(
                //             FaIcon(FontAwesomeIcons.plus),
                //             color: Colors.pink,
                //             size: 24.0,
                //             semanticLabel: 'Text to announce in accessibility modes',
                //           ),
                //           // Image.asset(
                //           //   "assets/view.png",
                //           //   scale: 10,
                //           // ),
                //           SizedBox(
                //             width: MediaQuery.of(context).size.width * .02,
                //           ),
                //           //  Text("View Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,color:  themeApp.purplecolor),),
                //         ],
                //       )),
                //   onTap: () {
                //     setState(() {
                //       widget.viewlist[widget.index]["click"] =
                //       !widget.viewlist[widget.index]["click"];
                //     });
                //   },
                // )
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white24,
            border: Border.all(color: Colors.grey),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black26,
            //     blurRadius: 20.0,
            //   ),
            // ],
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10, top: 10)),
        widget.viewlist[widget.index]["click"]
            ? Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                      children: [
                        play(
                          quoteId: '1',
                          requestQuote: requestQuoteViewButtonModel,
                          title: 'Requested Requote',
                          groupDetailslst: widget.groupDetailslst,
                          index: widget.index,
                          type: title,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10, top: 10)),
                      ],
                    ),


              )
            : Container()
      ],
    );
  }


}
// ListView(
//   shrinkWrap: true,
//
//   children: [
//     play(
//       quoteId: '1',
//       requestQuote: requestQuoteViewButtonModel,
//       title: 'Requested Requote',
//       groupDetailslst: widget.groupDetailslst,
//
//     ),
//     //Padding(padding: EdgeInsets.only(bottom: 10,top: 10)),
//   ],
//
// ),
