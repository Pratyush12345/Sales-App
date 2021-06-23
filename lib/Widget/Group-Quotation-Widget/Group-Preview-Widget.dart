import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/providers/site_list_provider.dart';
import 'package:provider/provider.dart';

class PreviewListWidget extends StatefulWidget {
  final int index;
  final List viewlist;
  bool isSingleRate;
  bool isGreenCerti;
  String businessName;
  String mpan;
  String mprn;
  String preferredStartDate;
  String businessNameErr;
  String mpanErr;
  String mprnErr;
  String preferredStartDateErr;

  PreviewListWidget({
    this.index,
    this.viewlist,
    this.businessName,
    this.mpan,
    this.isGreenCerti,
    this.isSingleRate,
    this.businessNameErr,
    this.mpanErr,
    this.mprn,
    this.mprnErr,
    this.preferredStartDate,
    @required this.preferredStartDateErr,
  });

  @override
  _PreviewListWidgetState createState() => _PreviewListWidgetState();
}

class _PreviewListWidgetState extends State<PreviewListWidget> {
  final ThemeApp themeApp = ThemeApp();
  TextEditingController businessName;
  TextEditingController mpan;
  TextEditingController mprn;
  TextEditingController preferredStartDate;
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  String mpanOrMprn = '';

  initializeData() {
    businessName = TextEditingController(text: widget.businessName);
    mpan = TextEditingController(text: widget.mpan);
    mprn = TextEditingController(text: widget.mprn);
    preferredStartDate = TextEditingController(text: widget.preferredStartDate);
  }

  void dateSelect(
      {BuildContext context, TextEditingController controller}) async {
    FocusScope.of(context).unfocus();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      controller.text = dateFormat.format(picked).toString();
      siteListProviderData.siteListProvider[widget.index].dteContractStartDate =
          controller.text;
      setState(() {});
      setState(() {});
    }
  }

  @override
  void initState() {
    initializeData();
    super.initState();
  }

  void onToggleSingleRate({@required int index}) {
    setState(() {
      widget.isSingleRate = !widget.isSingleRate;
      siteListProviderData.siteListProvider[index].bIsSingleRate =
          widget.isSingleRate;
    });
  }

  void onToggleIsGreenCerti({@required int index}) {
    setState(() {
      widget.isGreenCerti = !widget.isGreenCerti;
      siteListProviderData.siteListProvider[index].bisGreenCertificate =
          widget.isGreenCerti;
    });
  }

  String getMpanOrMprn() {
    if (widget.mpan == '') {
      mpanOrMprn = widget.mprn;
    } else if (widget.mprn == '') {
      mpanOrMprn = widget.mpan;
    } else {
      mpanOrMprn = '${widget.mpan} / ${widget.mprn}';
    }
    return mpanOrMprn;
  }

  SiteListProvider siteListProviderData;

  @override
  Widget build(BuildContext context) {
    siteListProviderData = Provider.of<SiteListProvider>(context);
    return Column(
      children: <Widget>[
        Container(
          color: widget.index.isOdd
              ? Color.fromRGBO(228, 241, 215, 1)
              : Color.fromRGBO(237, 243, 231, 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.015,
                bottom: MediaQuery.of(context).size.height * 0.015),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      //"Business Name ",
                      "${widget.businessName}",
                      style: TextStyle(
                          color: Colors.black,
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
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.033),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
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
                  ),
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
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       bottom: MediaQuery.of(context).size.height * 0.01,
                    //       top: MediaQuery.of(context).size.height * 0.01),
                    //   child: Row(
                    //     // crossAxisAlignment: CrossAxisAlignment.center,
                    //
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: <Widget>[
                    //       SizedBox(
                    //         child: Text("Business Name",
                    //             textAlign: TextAlign.end,
                    //             style: TextStyle(
                    //               color: Colors.black,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize:
                    //                   MediaQuery.of(context).size.width *
                    //                       0.033,
                    //             )),
                    //         width: MediaQuery.of(context).size.width * 0.40,
                    //         // height: widget.businessNameErr == null
                    //         //     ? MediaQuery.of(context).size.height * 0.055
                    //         //     : MediaQuery.of(context).size.height * 0.065,
                    //       ),
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width * .03,
                    //       ),
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width * 0.46,
                    //         // height: widget.businessNameErr == null
                    //         //     ? MediaQuery.of(context).size.height * 0.055
                    //         //     : MediaQuery.of(context).size.height * 0.065,
                    //         child: TextField(
                    //           //textAlignVertical: TextAlignVertical(y: -1.0),
                    //           onChanged: (val) {
                    //             siteListProviderData
                    //                 .siteListProvider[widget.index]
                    //                 .businessName = val;
                    //             setState(() {});
                    //           },
                    //           enabled:
                    //               widget.businessNameErr == null ? false : true,
                    //           autocorrect: false,
                    //           autofocus: false,
                    //           decoration: InputDecoration(
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: new BorderSide(
                    //                 color: Colors.red,
                    //               ),
                    //             ),
                    //             helperText: widget.businessNameErr == null
                    //                 ? ''
                    //                 : widget.businessNameErr,
                    //             helperStyle: TextStyle(
                    //               color: Colors.red,
                    //             ),
                    //             counterText: '',
                    //             border: widget.businessNameErr == null
                    //                 ? InputBorder.none
                    //                 : OutlineInputBorder(
                    //                     borderSide: new BorderSide(
                    //                       color: Colors.red,
                    //                     ),
                    //                   ),
                    //           ),
                    //           controller: businessName,
                    //           style: TextStyle(
                    //             color: Colors.grey,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize:
                    //                 MediaQuery.of(context).size.width * 0.033,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.01,
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            child: Text("Business Name",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                  MediaQuery.of(context).size.width * 0.033,
                                )),
                            width: MediaQuery.of(context).size.width * 0.40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.46,
                            child: Text(
                             businessName.text,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                MediaQuery.of(context).size.width * 0.033,
                              ),
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
                            child: Text( "MPAN",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                  MediaQuery.of(context).size.width * 0.033,
                                )),
                            width: MediaQuery.of(context).size.width * 0.40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.46,
                            child: Text(
                              mpan.text == "" ? "-": mpan.text,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                MediaQuery.of(context).size.width * 0.033,
                              ),
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
                            child: Text( "MPRN",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                  MediaQuery.of(context).size.width * 0.033,
                                )),
                            width: MediaQuery.of(context).size.width * 0.40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.46,
                            child: Text(
                              mprn.text == "" ? "-": mprn.text,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                MediaQuery.of(context).size.width * 0.033,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    //*Mpan Core */
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       bottom: MediaQuery.of(context).size.height * 0.01,
                    //       top: MediaQuery.of(context).size.height * 0.01),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: <Widget>[
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width * 0.40,
                    //         height: widget.mpanErr == null
                    //             ? MediaQuery.of(context).size.height * 0.055
                    //             : MediaQuery.of(context).size.height * 0.065,
                    //         child: Padding(
                    //           padding: const EdgeInsets.only(),
                    //           child: Text(
                    //             "MPAN",
                    //             textAlign: TextAlign.end,
                    //             style: TextStyle(
                    //                 color: Colors.black,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize:
                    //                     MediaQuery.of(context).size.width *
                    //                         0.033),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width * .03,
                    //       ),
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width * 0.46,
                    //         height:
                    //             // widget.mpanErr == null
                    //             //     ? MediaQuery.of(context).size.height * 0.052
                    //             //     :
                    //             MediaQuery.of(context).size.height * 0.060,
                    //         child: TextField(
                    //           keyboardType: TextInputType.number,
                    //           onChanged: (val) {
                    //             siteListProviderData
                    //                 .siteListProvider[widget.index]
                    //                 .fullMpanNumber = val;
                    //             setState(() {});
                    //           },
                    //           enabled: widget.mpanErr == null ? false : true,
                    //           autocorrect: false,
                    //           autofocus: false,
                    //           decoration: InputDecoration(
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: new BorderSide(
                    //                 color: Colors.red,
                    //               ),
                    //             ),
                    //             helperText: widget.mpanErr == null
                    //                 ? ''
                    //                 : widget.mpanErr,
                    //             helperStyle: TextStyle(
                    //               color: Colors.red,
                    //             ),
                    //             counterText: '',
                    //             border: widget.mpanErr == null
                    //                 ? InputBorder.none
                    //                 : OutlineInputBorder(
                    //                     borderSide: new BorderSide(
                    //                       color: Colors.red,
                    //                     ),
                    //                   ),
                    //           ),
                    //           controller: mpan,
                    //           style: TextStyle(
                    //             color: Colors.grey,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize:
                    //                 MediaQuery.of(context).size.width * 0.033,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    //MPRN No
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       bottom: MediaQuery.of(context).size.height * 0.01,
                    //       top: MediaQuery.of(context).size.height * 0.01),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: <Widget>[
                    //       SizedBox(
                    //           width: MediaQuery.of(context).size.width * 0.40,
                    //           height: widget.mprn == null
                    //               ? MediaQuery.of(context).size.height * 0.055
                    //               : MediaQuery.of(context).size.height * 0.065,
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(top: 7.0),
                    //             child: Text("MPRN",
                    //                 textAlign: TextAlign.end,
                    //                 style: TextStyle(
                    //                     color: Colors.black,
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize:
                    //                         MediaQuery.of(context).size.width *
                    //                             0.033)),
                    //           )),
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width * .03,
                    //       ),
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width * 0.46,
                    //         height:
                    //             // widget.mprnErr == null
                    //             //     ? MediaQuery.of(context).size.height * 0.055
                    //             //     :
                    //             MediaQuery.of(context).size.height * 0.060,
                    //         child: TextField(
                    //           keyboardType: TextInputType.number,
                    //           onChanged: (val) {
                    //             siteListProviderData
                    //                 .siteListProvider[widget.index]
                    //                 .gasMprn = val;
                    //             setState(() {});
                    //           },
                    //           enabled: widget.mprnErr == null ? false : true,
                    //           autocorrect: false,
                    //           autofocus: false,
                    //           decoration: InputDecoration(
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: new BorderSide(
                    //                 color: Colors.red,
                    //               ),
                    //             ),
                    //             helperText: widget.mprnErr == null
                    //                 ? ''
                    //                 : widget.mprnErr,
                    //             helperStyle: TextStyle(
                    //               color: Colors.red,
                    //             ),
                    //             counterText: '',
                    //             border: widget.mprnErr == null
                    //                 ? InputBorder.none
                    //                 : OutlineInputBorder(
                    //                     borderSide: new BorderSide(
                    //                       color: Colors.red,
                    //                     ),
                    //                   ),
                    //           ),
                    //           controller: mprn,
                    //           style: TextStyle(
                    //             color: Colors.grey,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize:
                    //                 MediaQuery.of(context).size.width * 0.033,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    //Preferred Start Date
                    widget.preferredStartDateErr == null ?  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.01,
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            child: Text(
                                "Preferred Start Date",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                  MediaQuery.of(context).size.width * 0.033,
                                )),
                            width: MediaQuery.of(context).size.width * 0.40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.46,
                            child: Text(
                              preferredStartDate.text,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                MediaQuery.of(context).size.width * 0.033,
                              ),
                            ),
                          )
                        ],
                      ),
                    ):
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.01,
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height:
                                // widget.preferredStartDateErr == null
                                //     ? MediaQuery.of(context).size.height * 0.055
                                //     :
                                MediaQuery.of(context).size.height * 0.060,
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 7.0),
                              child: Text(
                                "Preferred Start Date",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.033),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                          InkWell(
                            onTap: widget.preferredStartDateErr == null
                                ? null
                                : () {
                                    dateSelect(
                                      context: context,
                                      controller: preferredStartDate,
                                    );
                                  },
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      // widget.preferredStartDateErr == null
                                      //     ? MediaQuery.of(context).size.height *
                                      //         0.033
                                      //     :
                                      MediaQuery.of(context).size.height *
                                          0.033,
                                  width:
                                      MediaQuery.of(context).size.width * 0.46,
                                  child: TextField(
                                    onChanged: (val) {
                                      siteListProviderData
                                          .siteListProvider[widget.index]
                                          .dteContractStartDate = val;
                                      setState(() {});
                                    },
                                    enabled: false,
                                    autocorrect: false,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      disabledBorder:
                                          widget.preferredStartDateErr != null
                                              ? OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                  ),
                                                )
                                              : InputBorder.none,
                                    ),
                                    controller: preferredStartDate,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.033,
                                    ),
                                  ),
                                ),
                                widget.preferredStartDateErr != null
                                    ? Text(
                                        '${widget.preferredStartDateErr.substring(0, 28)}\n${widget.preferredStartDateErr.substring(28, 54)}\n${widget.preferredStartDateErr.substring(54)}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.red,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Single Rate
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
                              child: Text("Single rate",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.033))),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                          mpan.text != ''
                              ? SizedBox(
                                  // width: MediaQuery.of(context).size.width * 0.46,
                                  child: InkWell(
                                    onTap: () =>
                                        onToggleSingleRate(index: widget.index),
                                    child: Container(
                                      //   width: MediaQuery.of(context).size.width * 0.15,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            style: BorderStyle.solid,
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1)),
                                      ),
                                      child: widget.isSingleRate
                                          ? Icon(
                                              Icons.check,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1),
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .025,
                                            )
                                          : Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .025,
                                            ),
                                    ),
                                  ),
                                )
                              : Text('-'),
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
                              child: Text("Is Green Certificate",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.033))),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                          widget.mprn != ''
                              ? SizedBox(
                                  // width: MediaQuery.of(context).size.width * 0.46,
                                  child: InkWell(
                                    onTap: () => onToggleIsGreenCerti(
                                        index: widget.index),
                                    child: Container(
                                      //   width: MediaQuery.of(context).size.width * 0.15,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            style: BorderStyle.solid,
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1)),
                                      ),
                                      child: widget.isGreenCerti
                                          ? Icon(
                                              Icons.check,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1),
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .025,
                                            )
                                          : Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .025,
                                            ),
                                    ),
                                  ),
                                )
                              : Text('-'),
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
