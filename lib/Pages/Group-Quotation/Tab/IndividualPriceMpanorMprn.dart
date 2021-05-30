import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/yearvisedetails.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Core/Model/group_details_sub_model.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/view_price_ele_gas_1year.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroupQuotePriceList extends StatefulWidget {
  final int index;
  final List viewlist;
  final List<EachyYearList> groupDetailslst;
  final String type;
  GroupQuotePriceList(
      {this.index, this.viewlist, @required this.groupDetailslst ,this.type});

  @override
  _GroupQuotePriceListState createState() => _GroupQuotePriceListState();
}

class _GroupQuotePriceListState extends State<GroupQuotePriceList> {
  final ThemeApp themeApp = ThemeApp();
  String mpanOrMprn = '';
  RequestQuoteViewButtonModel requestQuoteViewButtonModel =
      RequestQuoteViewButtonModel();
  bool check = false;
  String getMpanOrMprn() {
    // if (widget.groupDetailslst[widget.index].mpan == '') {
    //   mpanOrMprn = 'MPRN : ' + widget.groupDetailslst[widget.index].mprn;
    // } else if (widget.groupDetailslst[widget.index].mprn == '') {
    //   mpanOrMprn = 'MPAN : ' + widget.groupDetailslst[widget.index].mpan;
    // } else {
    //   mpanOrMprn =
    //       '${widget.groupDetailslst[widget.index].mpan} / ${widget.groupDetailslst[widget.index].mprn}';
    // }
    print(widget.index);
    return 'MPAN : ' + widget.groupDetailslst[widget.index].mpan;
  }
  bool mprn = false;
  String getmprn(){
    if(widget.groupDetailslst[widget.index].mprn != '')
      {
        setState(() {
          mprn = true;
        });

      }
    return 'MPRN : '+widget.groupDetailslst[widget.index].mprn;
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

                            print(check);
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
                    widget.type == 'MPAN' ? getMpanOrMprn() : getmprn(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize:15,
                    ),
                  ),
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * .02,
                // ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .08,
                ),
                Container(
                  padding: EdgeInsets.only(left:5),
                  child: CupertinoButton(
                    // onPressed: () {
                    //   setState(() {
                    //     widget.viewlist[widget.index]["click"] =
                    //     !widget.viewlist[widget.index]["click"];
                    //   });
                    // },
                    minSize: double.minPositive,
                    padding: EdgeInsets.zero,
                    //color: Colors.green,
                    child: Icon(
                        FontAwesomeIcons.pencilAlt,
                      color:  Colors.green,
                      size: 18,
                    ),

                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .01,
                ),
                Container(
                  padding: EdgeInsets.only(left:5),
                  child:
                  CupertinoButton(
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
                      color:  Colors.green,
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
                height: 500,
                padding: EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1, //widget.groupDetailslst.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        play(
                          quoteId: '1',
                          requestQuote: requestQuoteViewButtonModel,
                          title: 'Requested Requote',
                          groupDetailslst: widget.groupDetailslst,
                          index: widget.index,
                          type: widget.type,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10, top: 10)),
                      ],
                    );
                  },
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
