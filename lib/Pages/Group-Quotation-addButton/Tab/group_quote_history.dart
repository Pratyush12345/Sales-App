import 'package:flutter/material.dart';
import 'package:pozitive/Widget/TextField/dropdownTextField.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/ViewModel/QuoteHistoryIndividualViewModel.dart';

class GroupQuoteHistoryScreen extends StatefulWidget {
  @override
  _GroupQuoteHistoryScreenState createState() =>
      _GroupQuoteHistoryScreenState();
}

class _GroupQuoteHistoryScreenState extends State<GroupQuoteHistoryScreen> {
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
  String strCreatedDate = '11/2/2020';
  String strCreatedBy = 'bluereyess@gmail.com';
  String strGasValidityDate = '09/04/2019';
  String strEleValidityDateNHH = '09/04/2019';
  String decTotalEAC = '5000';
  String decTotalAQ = '15000';

  @override
  Widget build(BuildContext context) {
    TextEditingController affiliates = TextEditingController();
    Color quoteHist = Color.fromRGBO(18, 122, 69, 1);
    bool _autovalidation = false;

    return BaseView<QuoteHistoryIndividualViewModel>(
      //  onModelReady: (model) => model.getQuoteHistoryDropDownGroupDetails(),
      builder: (context, model, child) {
        return Scaffold(
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
                                strCreatedDate,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.027),
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
                                child: Text(strCreatedBy.toString(),
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
                                child: Text(strGasValidityDate,
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
                                child: Text(strEleValidityDateNHH,
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
                                child: Text(decTotalEAC.toString(),
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
                                child: Text(decTotalAQ.toString(),
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
                                          title: Text('11/02/2020'),
                                          onTap: () {},
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: 1)
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
                            (1 == 1)
                                ? Container(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                    child: Text(
                                      'Price 1 Year Electricity',
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
                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decSCElectricity
                            //             .toString() !=
                            //         ''
                            // ?
                            Container(
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decChargesDay.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decChargesNight.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decChargesEwe.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decSCElectricity}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                            // : Container(),
                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decSCElectricity
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            )
                            // : SizedBox(),
                            // for base rate 2
                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decUpliftEleSC
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            Container(
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                            //  '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleDay.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleNight.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            // '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleEWE.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            // '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleSC.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                            // : Container(),

                            //For Affiliated Uplift
                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decUpliftEleSCSub
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            Container(
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleDaySub.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            //  '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleNightSub.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleEWESub.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftEleSCSub.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                            // : Container(),
                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decUpliftEleSCSub
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            )
                            // : SizedBox(),

                            //For Final Price
                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decSCElectricityF
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            Container(
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                                fontWeight: FontWeight.bold,
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decChargesDayF.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decChargesNightF.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decChargesEweF.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            // '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decSCElectricityF.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                            // : Container(),
                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decSupplyCapacity
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            )
                            // : SizedBox(),
                            //For List 1
                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decSupplyCapacity
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            Container(
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
                                                padding: EdgeInsets.all(6),
                                                color: Colors.grey[300],
                                                child: Text(
                                                  //  '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decSupplyCapacity.toString()}',
                                                  '4000',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  textAlign: TextAlign.center,
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
                            // : Container(),
                            // model.quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index].decCCPriceF
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            Container(
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
                                                padding: EdgeInsets.all(6),
                                                color: Colors.grey[300],
                                                child: Text(
                                                  // '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decCCPriceF.toString()}',
                                                  '4000',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  textAlign: TextAlign.center,
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
                            //: Container(),
                            // model.quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index].decEMR
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            Container(
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
                                                padding: EdgeInsets.all(6),
                                                color: Colors.grey[300],
                                                child: Text(
                                                  // '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decEMR.toString()}',
                                                  '4000',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  textAlign: TextAlign.center,
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
                            // : Container(),
                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decExcessCapacityCharge
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            Container(
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
                                                padding: EdgeInsets.all(6),
                                                color: Colors.grey[300],
                                                child: Text(
                                                  //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decExcessCapacityCharge.toString()}',
                                                  '4000',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  textAlign: TextAlign.center,
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
                            //  : Container(), //For last list
                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decReactiveCharge
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            Container(
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
                                                padding: EdgeInsets.all(6),
                                                color: Colors.grey[300],
                                                child: Text(
                                                  //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decReactiveCharge.toString()}',
                                                  '4000',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                  textAlign: TextAlign.center,
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
                            //  : Container(),
                            // model.quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index].decSCGas
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            )
                            // : SizedBox(),
                            // model.quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index].decSCGas
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            Container(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: Text(
                                //'Price(${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].intTermType.toString()} Year) Gas',
                                'Price(1 Year)Gas',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.purple.withOpacity(0.8),
                                    fontSize: 16),
                              ),
                            )
                            //: Container(),

                            ,
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            //Base Rate 1
                            // model.quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index].decSCGas
                            //             .toString() !=
                            //         ''
                            //     ?
                            Container(
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
                                                  fontWeight: FontWeight.bold,
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
                                                  fontWeight: FontWeight.bold,
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decSCGas.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            '4000',
                                            // '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUnitPriceGas.toString()}',
                                            style: TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                            //: Container(),
                            // model.quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index].decSCGas
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            )
                            //  : SizedBox(),
                            //Required Uplift

                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decUpliftGas
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            Container(
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
                                                  fontWeight: FontWeight.bold,
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
                                                  fontWeight: FontWeight.bold,
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftGasSC.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            '4000',
                                            // '${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftGas.toString()}',
                                            style: TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                            // : Container(),
                            //Affliliate Uplift
                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decUpliftGasSub
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            Container(
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
                                                  fontWeight: FontWeight.bold,
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
                                                  fontWeight: FontWeight.bold,
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftGasSCSub.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUpliftGasSub.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                            // : Container(),
                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decUpliftGasSub
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            )
                            // : SizedBox(),

                            //Final Price
                            // model
                            //             .quoteHistoryDropDownIndividualModel
                            //             .lSTQuotePriceHistory[index]
                            //             .decUnitPriceGasF
                            //             .toString() !=
                            //         ''
                            //     ?
                            ,
                            Container(
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
                                                  fontWeight: FontWeight.bold,
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
                                                  fontWeight: FontWeight.bold,
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decSCGasF.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
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
                                            //'${model.quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory[index].decUnitPriceGasF.toString()}',
                                            '4000',
                                            style: TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                            //: Container()
                          ],
                        ),
                      );
                    },
                    itemCount: 1,
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
