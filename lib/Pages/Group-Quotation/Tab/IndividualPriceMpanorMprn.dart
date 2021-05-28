import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/yearvisedetails.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Core/Model/group_details_sub_model.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/view_price_ele_gas_1year.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';

class GroupQuotePriceList extends StatefulWidget {
  final int index;
  final List viewlist;
  final List<GroupDetailsSubModel> groupDetailslst;
  GroupQuotePriceList(
      {this.index, this.viewlist, @required this.groupDetailslst});

  @override
  _GroupQuotePriceListState createState() => _GroupQuotePriceListState();
}

class _GroupQuotePriceListState extends State<GroupQuotePriceList> {
  final ThemeApp themeApp = ThemeApp();
  String mpanOrMprn = '';
  RequestQuoteViewButtonModel requestQuoteViewButtonModel =
  RequestQuoteViewButtonModel();
  String getMpanOrMprn() {
    if (widget.groupDetailslst[widget.index].mpan == '') {
      mpanOrMprn = widget.groupDetailslst[widget.index].mprn;
    } else if (widget.groupDetailslst[widget.index].mprn == '') {
      mpanOrMprn = widget.groupDetailslst[widget.index].mpan;
    } else {
      mpanOrMprn =
      '${widget.groupDetailslst[widget.index].mpan} / ${widget.groupDetailslst[widget.index].mprn}';
    }
    return mpanOrMprn;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                bottom: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      widget.groupDetailslst[widget.index].businessName ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * 0.033),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .001,
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      getMpanOrMprn(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * 0.033),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                InkWell(
                  child: Container(
                    //width: MediaQuery.of(context).size.width * .32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            "assets/view.png",
                            scale: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          //  Text("View Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,color:  themeApp.purplecolor),),
                        ],
                      )),
                  onTap: () {
                    setState(() {
                      widget.viewlist[widget.index]["click"] =
                      !widget.viewlist[widget.index]["click"];
                    });
                  },
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white60,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 20.0,
                ),
              ],
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10,top: 10)),
        widget.viewlist[widget.index]["click"]
            ? Container(
          height: 500,
          child: ListView(
            shrinkWrap: true,
            children: [
              play(
                quoteId: '1',
                requestQuote: requestQuoteViewButtonModel,
                title: 'Requested Requote',
              )],
          ),
        )

            : Container()
      ],
    );
  }
}

