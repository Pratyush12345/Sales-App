import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/QuoteHistoryDropDownIndividualCredential.dart';
import 'package:pozitive/Core/Model/QuoteHistoryDropDownIndividualModel.dart';

GetIt getIt = GetIt.instance;

class QuoteHistoryIndividualViewModel extends BaseModel {
  QuoteHistoryDropDownIndividualModel quoteHistoryDropDownIndividualModel =
      QuoteHistoryDropDownIndividualModel();
  Database database = getIt<DatabaseImplementation>();
  int lengthOfLst = 0;
  int i;
  int totalTabs = 0;
  List<int> termTypeYears = [];
  Color quoteHist = Color.fromRGBO(18, 122, 69, 1);

  void getQuoteHistoryDropDownIndividualDetails(
      String accountId,
      String quoteId,
      String type,
      String strPriceDate,
      String strAction,
      BuildContext context) async {
    setState(ViewState.BUSY);
    quoteHistoryDropDownIndividualModel =
        await database.getQuoteHistoryDropDownIndividualDetails(
      QuoteHistoryDropDownIndividualCredential(
        accountId: accountId,
        quoteId: quoteId.toString(),
        type: type,
        strPriceDate: strPriceDate,
        strAction: strAction,
      ),
    );
    Navigator.of(context).pop();
    if (quoteHistoryDropDownIndividualModel != null) {
      AppConstant.showSuccessToast(context, 'Success');
      totalTabs = quoteHistoryDropDownIndividualModel
          .lSTQuotePriceHistory.length
          .toInt();
      termTypeYears.clear();
      getTerm(context);
    } else {
      AppConstant.showFailToast(context, 'Failed');
    }
    setState(ViewState.IDLE);
  }

  Widget getTerm(BuildContext context) {
    lengthOfLst =
        quoteHistoryDropDownIndividualModel.lSTQuotePriceHistory.length.toInt();
    print(lengthOfLst);

    return Container(
      child: Column(
        children: [
          Container(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
            child: Text(
              'Price(1 Year) Gas',
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
                          width: MediaQuery.of(context).size.width * 0.233,
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
                          width: MediaQuery.of(context).size.width * 0.233,
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
                    'Required Uplift',
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
                          width: MediaQuery.of(context).size.width * 0.233,
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
                          width: MediaQuery.of(context).size.width * 0.233,
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
                    'Affliliate Uplift',
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
                          width: MediaQuery.of(context).size.width * 0.233,
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
                          width: MediaQuery.of(context).size.width * 0.233,
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
                          width: MediaQuery.of(context).size.width * 0.233,
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
                          width: MediaQuery.of(context).size.width * 0.233,
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
          )
        ],
      ),
    );
  }
}
