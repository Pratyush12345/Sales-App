import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';

class PegGroupQuoteHistoryList extends StatefulWidget {
  final int index;
  final List viewlist;
  final String termYear;
  final String grossValue;
  final String volumeDiscountAmt;
  final String netValueOfContract;

  PegGroupQuoteHistoryList(
      {this.index,
      this.viewlist,
      this.termYear,
      this.grossValue,
      this.volumeDiscountAmt,
      this.netValueOfContract});

  @override
  _PegGroupQuoteHistoryListState createState() =>
      _PegGroupQuoteHistoryListState();
}

class _PegGroupQuoteHistoryListState extends State<PegGroupQuoteHistoryList> {
  final ThemeApp themeApp = ThemeApp();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: widget.index % 2 == 0 ? Colors.grey[200] : Colors.grey[100],
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                bottom: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.termYear,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.038),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .01,
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.grossValue,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.038),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                InkWell(
                  child: Container(
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
                      ],
                    ),
                  ),
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
        ),
        widget.viewlist[widget.index]["click"]
            ? Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.01,
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,

                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            child: Text("Term Year",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                )),
                            width: MediaQuery.of(context).size.width * 0.40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.46,
                              child: Text(widget.termYear,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035)))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.01,
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Text(
                              "Gross Value of the\nContract (Pence)",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.035),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.46,
                            child: Text(
                              widget.grossValue,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.035),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.01,
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Text("Volume Discount\nAmount (Pence)",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035))),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.46,
                              child: Text(widget.volumeDiscountAmt,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035)))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.01,
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Text("Net Value of the \nContract (Pence)",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035))),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.46,
                              child: Text(widget.netValueOfContract,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035)))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container()
      ],
    );
  }
}
