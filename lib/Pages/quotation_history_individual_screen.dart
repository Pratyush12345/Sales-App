import 'package:flutter/material.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Widget/TextField/dropdownTextField.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/request_quote_history_model.dart';
import 'package:pozitive/Core/ViewModel/QuoteHistoryIndividualViewModel.dart';
import 'package:pozitive/Util/Pref.dart';

class QuotationHistoryScreen extends StatefulWidget {
  final RequestQuoteHistoryModel apiResponseModel;
  final String quoteId;
  QuotationHistoryScreen({this.apiResponseModel, this.quoteId});
  @override
  _QuotationHistoryScreenState createState() => _QuotationHistoryScreenState();
}

class _QuotationHistoryScreenState extends State<QuotationHistoryScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int index = 0;
  String selectedDate;
  bool oneYear = false;
  bool twoYear = false;
  bool threeYear = false;
  bool fourYear = false;
  bool fiveYear = false;
  String baseRateSc;
  String baseRateUc;
  String requiredSc;
  String requiredUc;
  String affiliateSc;
  String affiliateUc;
  String finalSc;
  String finalUc;

  @override
  Widget build(BuildContext context) {
    TextEditingController affiliates = TextEditingController();
    Color quoteHist = Color.fromRGBO(18, 122, 69, 1);
    bool _autovalidation = false;

    return BaseView<QuoteHistoryIndividualViewModel>(
      //  onModelReady: (model) => model.getQuoteHistoryDropDownGroupDetails(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: appbar(
              "Individual Quote History", context, _scaffoldKey, true, true),
          drawer: DrawerWidget(),
          key: _scaffoldKey,
          body: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.015,
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03),
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: Text('Created At :',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                    MediaQuery.of(context).size.width *
                                        0.027,
                                  )),
                              width: MediaQuery.of(context).size.width * 0.46,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .01,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.46,
                                child: Text(
                                    widget.apiResponseModel.strCreatedDate
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.027)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.46,
                                child: Text('Created By :',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.027))),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .01,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.46,
                                child: Text(
                                    widget.apiResponseModel.strCreatedBy
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.027)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.46,
                                child: Text('Gas Validity Date :',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.027))),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .01,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.46,
                                child: Text(
                                    '${widget.apiResponseModel.lSTQuoteHistory[0].strGasValidityDate}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.027)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.46,
                              child: Text('Electricity Validity Date(NHH) :',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          0.027)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .01,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.46,
                                child: Text(
                                    '${widget.apiResponseModel.lSTQuoteHistory[0].strEleValidityDateNHH}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.027)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.46,
                                child: Text('Total EAC :',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.027,
                                        fontWeight: FontWeight.bold))),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .01,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.46,
                                child: Text(
                                    widget.apiResponseModel.decTotalEAC
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.027)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.46,
                                child: Text('Total AQ :',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.027))),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .01,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.46,
                                child: Text(
                                    widget.apiResponseModel.decTotalAQ
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.027)))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                //new
                InkWell(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .062,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: DropDownTextField(
                        //   controller: affiliates,
                        obscureText: false,
                        autoValidation: _autovalidation,
                        textInputType: TextInputType.text,
                        hintText: selectedDate ?? "Quote History",
                      ),
                    ),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showDialog(
                        context: context,
                        builder: (context)=> Dialog(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.03,
                              ),
                              Text(
                                "Quote History",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                    MediaQuery.of(context).size.height *
                                        0.03),
                              ),
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: Colors.grey.withOpacity(.2),
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (BuildContext context, index) {
                                    return Container(
                                      child: InkWell(
                                        child: ListTile(
                                          title: Text(
                                              '${widget.apiResponseModel.lSTQuoteHistoryDate[index + 1].text}'),
                                          onTap: () async {
                                            setState(() {
                                              selectedDate = widget
                                                  .apiResponseModel
                                                  .lSTQuoteHistoryDate[
                                              index + 1]
                                                  .text
                                                  .toString();
                                            });

                                            User _user = await Prefs.getUser();
                                            model
                                                .getQuoteHistoryDropDownIndividualDetails(
                                                _user.accountId,
                                                widget.apiResponseModel
                                                    .quoteId
                                                    .toString(),
                                                'Individual',
                                                widget
                                                    .apiResponseModel
                                                    .lSTQuoteHistoryDate[
                                                index + 1]
                                                    .text,
                                                'Refresh',
                                                context);
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: widget.apiResponseModel
                                      .lSTQuoteHistoryDate.length
                                      .toInt() -
                                      1)
                            ],
                          ),
                        ));
                  },
                ),
                //new
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decSCElectricity
                                .toString() !=
                                ''
                                ? Container(
                              padding: EdgeInsets.only(
                                  left:
                                  MediaQuery.of(context).size.width *
                                      0.02),
                              child: Text(
                                'Price(${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].intTermType.toString()} Year) Electricity',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.purple.withOpacity(0.8),
                                    fontSize: 16),
                              ),
                            )
                                : Container(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            //For base rate 1
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decSCElectricity
                                .toString() !=
                                ''
                                ? Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      'Base Rate',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: quoteHist,
                                          fontSize: 14),
                                    ),
                                  ), //1
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'Day',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'Night',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'EWE',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'SC',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //2
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: Colors.white,
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decChargesDay.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decChargesNight.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decChargesEwe.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decSCElectricity}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container(),
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decSCElectricity
                                .toString() !=
                                ''
                                ? SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.03,
                            )
                                : SizedBox(),
                            // for base rate 2
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decUpliftEleSC
                                .toString() !=
                                ''
                                ? Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      'Required Uplift',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: quoteHist,
                                          fontSize: 14),
                                    ),
                                  ), //1
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'Day',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'Night',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'EWE',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'SC',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //2
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: Colors.white,
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleDay.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleNight.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleEWE.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleSC.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container(),

                            //For Affiliated Uplift
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decUpliftEleSCSub
                                .toString() !=
                                ''
                                ? Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      'Affiliated Uplift',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: quoteHist,
                                          fontSize: 14),
                                    ),
                                  ), //1
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'Day',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'Night',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'EWE',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'SC',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //2
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: Colors.white,
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleDaySub.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleNightSub.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleEWESub.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleSCSub.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container(),
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decUpliftEleSCSub
                                .toString() !=
                                ''
                                ? SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.03,
                            )
                                : SizedBox(),

                            //For Final Price
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decSCElectricityF
                                .toString() !=
                                ''
                                ? Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      'Final Price',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: quoteHist,
                                          fontSize: 14),
                                    ),
                                  ), //1
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'Day',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'Night',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'EWE',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: quoteHist,
                                          child: Text(
                                            'SC',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //2
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: Colors.white,
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decChargesDayF.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decChargesNightF.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decChargesEweF.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decSCElectricityF.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container(),
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decSupplyCapacity
                                .toString() !=
                                ''
                                ? SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.03,
                            )
                                : SizedBox(),
                            //For List 1
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decSupplyCapacity
                                .toString() !=
                                ''
                                ? Container(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(6),
                                      color: quoteHist,
                                      child: Text(
                                        'Supply Capacity (kVA)',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(3),
                                              child: Container(
                                                padding:
                                                EdgeInsets.all(6),
                                                color: Colors.grey[300],
                                                child: Text(
                                                  '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decSupplyCapacity.toString()}',
                                                  style: TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                  TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container(),
                            model.quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index].decCCPriceF
                                .toString() !=
                                ''
                                ? Container(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(6),
                                      color: quoteHist,
                                      child: Text(
                                        'Capacity charge per year (kVA)',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(3),
                                              child: Container(
                                                padding:
                                                EdgeInsets.all(6),
                                                color: Colors.grey[300],
                                                child: Text(
                                                  '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decCCPriceF.toString()}',
                                                  style: TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                  TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container(),
                            model.quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index].decEMR
                                .toString() !=
                                ''
                                ? Container(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(6),
                                      color: quoteHist,
                                      child: Text(
                                        'EMR CFD (p/Unit)',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(3),
                                              child: Container(
                                                padding:
                                                EdgeInsets.all(6),
                                                color: Colors.grey[300],
                                                child: Text(
                                                  '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decEMR.toString()}',
                                                  style: TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                  TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container(),
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decExcessCapacityCharge
                                .toString() !=
                                ''
                                ? Container(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(6),
                                      color: quoteHist,
                                      child: Text(
                                        'Excess Capacity Charge per year (kVA)',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(3),
                                              child: Container(
                                                padding:
                                                EdgeInsets.all(6),
                                                color: Colors.grey[300],
                                                child: Text(
                                                  '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decExcessCapacityCharge.toString()}',
                                                  style: TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                  TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container(), //For last list
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decReactiveCharge
                                .toString() !=
                                ''
                                ? Container(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(6),
                                      color: quoteHist,
                                      child: Text(
                                        'Reactive Charge per year (kVA)',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(3),
                                              child: Container(
                                                padding:
                                                EdgeInsets.all(6),
                                                color: Colors.grey[300],
                                                child: Text(
                                                  '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decReactiveCharge.toString()}',
                                                  style: TextStyle(
                                                      fontSize: 10),
                                                  textAlign:
                                                  TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container(),
                            model.quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index].decSCGas
                                .toString() !=
                                ''
                                ? SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.03,
                            )
                                : SizedBox(),
                            model.quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index].decSCGas
                                .toString() !=
                                ''
                                ? Container(
                              padding: EdgeInsets.only(
                                  left:
                                  MediaQuery.of(context).size.width *
                                      0.02),
                              child: Text(
                                'Price(${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].intTermType.toString()} Year) Gas',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.purple.withOpacity(0.8),
                                    fontSize: 16),
                              ),
                            )
                                : Container(),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            //Base Rate 1
                            model.quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index].decSCGas
                                .toString() !=
                                ''
                                ? Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      'Base Rate',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: quoteHist,
                                          fontSize: 14),
                                    ),
                                  ), //1
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.233,
                                            padding: EdgeInsets.all(6),
                                            color: quoteHist,
                                            child: Text(
                                              'Standing Charge',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.233,
                                            padding: EdgeInsets.all(6),
                                            color: quoteHist,
                                            child: Text(
                                              'Unit Charge',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //2
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: Colors.white,
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decSCGas.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUnitPriceGas.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container(),
                            model.quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index].decSCGas
                                .toString() !=
                                ''
                                ? SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.03,
                            )
                                : SizedBox(),
                            //Required Uplift

                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decUpliftGas
                                .toString() !=
                                ''
                                ? Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      'Required Uplift',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: quoteHist,
                                          fontSize: 14),
                                    ),
                                  ), //1
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.233,
                                            padding: EdgeInsets.all(6),
                                            color: quoteHist,
                                            child: Text(
                                              'Standing Charge',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.233,
                                            padding: EdgeInsets.all(6),
                                            color: quoteHist,
                                            child: Text(
                                              'Unit Charge',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //2
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: Colors.white,
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftGasSC.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftGas.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container(),
                            //Affliliate Uplift
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decUpliftGasSub
                                .toString() !=
                                ''
                                ? Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      'Affliliate Uplift',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: quoteHist,
                                          fontSize: 14),
                                    ),
                                  ), //1
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.233,
                                            padding: EdgeInsets.all(6),
                                            color: quoteHist,
                                            child: Text(
                                              'Standing Charge',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.233,
                                            padding: EdgeInsets.all(6),
                                            color: quoteHist,
                                            child: Text(
                                              'Unit Charge',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //2
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: Colors.white,
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftGasSCSub.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftGasSub.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container(),
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decUpliftGasSub
                                .toString() !=
                                ''
                                ? SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.03,
                            )
                                : SizedBox(),

                            //Final Price
                            model
                                .quoteHistoryDropDownIndividualModel
                                .lSTQuotePriceHistory[index]
                                .decUnitPriceGasF
                                .toString() !=
                                ''
                                ? Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      'Final Price',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: quoteHist,
                                          fontSize: 14),
                                    ),
                                  ), //1
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.233,
                                            padding: EdgeInsets.all(6),
                                            color: quoteHist,
                                            child: Text(
                                              'Standing Charge',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.233,
                                            padding: EdgeInsets.all(6),
                                            color: quoteHist,
                                            child: Text(
                                              'Unit Charge',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //2
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          color: Colors.white,
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decSCGasF.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.002,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.233,
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUnitPriceGasF.toString()}',
                                            style:
                                            TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container()
                          ],
                        ),
                      );
                    },
                    itemCount: model.totalTabs,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color quoteHist = Color.fromRGBO(18, 122, 69, 1);
}
