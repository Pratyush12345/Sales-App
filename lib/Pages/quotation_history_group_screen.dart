import 'package:flutter/material.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Widget/TextField/dropdownTextField.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/ViewModel/dashboardViewModels/dashboard_list_item_viewmodel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';

class QuotationHistoryGroupScreen extends StatefulWidget {
  final int index;
  final String groupId;
  final String type;

  QuotationHistoryGroupScreen(this.index, this.groupId, this.type);
  @override
  _QuotationHistoryGroupScreenState createState() =>
      _QuotationHistoryGroupScreenState();
}

class _QuotationHistoryGroupScreenState
    extends State<QuotationHistoryGroupScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextEditingController affiliates = TextEditingController();
    Color quoteHist = Color.fromRGBO(18, 122, 69, 1);
    bool _autovalidation = false;

    final user = Provider.of<User>(context);

    return BaseView<DashBoardItemViewModel>(
      onModelReady: (model) => model.getRequestQuoteHistoryGroupDetails(
          user.accountId, widget.groupId, widget.type, context),
      builder: (context, model, child) {
        if (model.state == ViewState.BUSY) {
          return AppConstant.circularProgressIndicator();
        }

        String createdAt =
            model.requestQuoteHistoryGroupModel.strCreatedDate.toString();
        String createdBy =
            model.requestQuoteHistoryGroupModel.strCreatedBy.toString();
        String gasValDate = 'gas val';
        String eleValDate = 'ele val';
        String decTotalEAC =
            model.requestQuoteHistoryGroupModel.decTotalEAC.toString();
        String totalAQ =
            model.requestQuoteHistoryGroupModel.decTotalAQ.toString();

        return Scaffold(
          appBar:
              appbar("Group Quote History", context, _scaffoldKey, true, true),
          drawer: DrawerWidget(),
          key: _scaffoldKey,
          body: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.015,
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03),
            child: ListView(
              children: <Widget>[
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
                                child: Text(createdAt,
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
                                child: Text(createdBy,
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
                                child: Text(gasValDate,
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
                              child: Text('Electricity Validity Date (NHH) :',
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
                                child: Text(eleValDate,
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
                                child: Text(totalAQ,
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
                        controller: affiliates,
                        obscureText: false,
                        autoValidation: _autovalidation,
                        textInputType: TextInputType.text,
                        hintText: "Quote History",
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Select Partner';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  // onTap: () {
                  //   model.getQuoteHistoryDropDownGroupDetails(user.accountId,
                  //       '16141', 'Group', '30/10/2020', 'Refresh', context);
                  // },
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
                              Container(
                                child: Text('Data #1'),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
                //new
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02),
                  child: Text(
                    'Price(3 Year) Electricity',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.purple.withOpacity(0.8),
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                //For base rate 1
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              color: Colors.white,
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // for base rate 2
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              color: Colors.white,
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //For Affiliated Uplift
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              color: Colors.white,
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //For Final Price
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              color: Colors.white,
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //For List 1
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6),
                          color: quoteHist,
                          child: Text(
                            'Supply Capacity(kVA)',
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
                                      '1,000',
                                      style: TextStyle(fontSize: 10),
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
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6),
                          color: quoteHist,
                          child: Text(
                            'Supply Capacity(kVA)',
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
                                      '1,000',
                                      style: TextStyle(fontSize: 10),
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
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6),
                          color: quoteHist,
                          child: Text(
                            'Supply Capacity(kVA)',
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
                                      '1,000',
                                      style: TextStyle(fontSize: 10),
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
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6),
                          color: quoteHist,
                          child: Text(
                            'Supply Capacity(kVA)',
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
                                      '1,000',
                                      style: TextStyle(fontSize: 10),
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
                ), //For last list
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6),
                          color: quoteHist,
                          child: Text(
                            'Supply Capacity(kVA)',
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
                                      '1,000',
                                      style: TextStyle(fontSize: 10),
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //-----
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02),
                  child: Text(
                    'Price(3 Year) Gas',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.purple.withOpacity(0.8),
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                //Base Rate 1
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Expanded(
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.233,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              color: Colors.white,
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Required Uplift
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          'Required',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: quoteHist,
                              fontSize: 14),
                        ),
                      ), //1
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Expanded(
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.233,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              color: Colors.white,
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Affliliate Uplift
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Expanded(
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.233,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              color: Colors.white,
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //Final Price
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.233,
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
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Expanded(
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.233,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              color: Colors.white,
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.002,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.233,
                              padding: EdgeInsets.all(6),
                              child: Text(
                                '21,000',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
