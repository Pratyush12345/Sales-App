import 'package:flutter/material.dart';

class QuotationHistoryGas extends StatefulWidget {
  @override
  _QuotationHistoryGasState createState() => _QuotationHistoryGasState();
}

class _QuotationHistoryGasState extends State<QuotationHistoryGas> {
  Color quoteHist = Color.fromRGBO(18, 122, 69, 1);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
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
      );
    }
}
