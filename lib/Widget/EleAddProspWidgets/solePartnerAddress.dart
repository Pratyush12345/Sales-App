import 'package:flutter/material.dart';
import 'package:pozitive/Core/ViewModel/EleAddProspectViewModels/ele_business_viewmodel.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:pozitive/Util/PrefBusinessType/ElePrefBusines.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBusinessOwnershipDetailsCredential.dart';

class SoleAddresses extends StatefulWidget {
  @override
  _SoleAddressesState createState() => _SoleAddressesState();
}

class _SoleAddressesState extends State<SoleAddresses> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController yearListController = TextEditingController();
  TextEditingController monthhListController = TextEditingController();
  TextEditingController strTitleQwner1 = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController strTitleDirector2 = TextEditingController();
  TextEditingController strDirector2Firstname = TextEditingController();
  TextEditingController strDirector2Lastname = TextEditingController();
  TextEditingController strDobOwner1 = TextEditingController();
  TextEditingController home_Address = TextEditingController();
  TextEditingController home_Address2 = TextEditingController();
  TextEditingController strHomeAdressPostCode = TextEditingController();
  TextEditingController strHomeAdressCity = TextEditingController();
  TextEditingController strHomeaddressLiveYear = TextEditingController();
  TextEditingController strHomeaddressLiveMonth = TextEditingController();
  TextEditingController strHomeaddress1 = TextEditingController();
  TextEditingController strHomeaddress2 = TextEditingController();
  TextEditingController strHomeaddressCity1 = TextEditingController();
  TextEditingController strHomeaddressPostCode1 = TextEditingController();
  TextEditingController strHomeaddressLiveYear1 = TextEditingController();
  TextEditingController strHomeaddressLiveMonth1 = TextEditingController();
  TextEditingController strHomeaddress3 = TextEditingController();
  TextEditingController strHomeaddress4 = TextEditingController();
  TextEditingController strHomeaddressCity2 = TextEditingController();
  TextEditingController strHomeaddressPostCode2 = TextEditingController();
  TextEditingController strHomeaddressPostLiveYear2 = TextEditingController();
  TextEditingController strHomeaddressPostLiveMonth2 = TextEditingController();
  TextEditingController strHomeaddress5 = TextEditingController();
  TextEditingController strHomeaddress6 = TextEditingController();
  TextEditingController strHomeaddressCity3 = TextEditingController();
  TextEditingController strHomeaddressPostCode3 = TextEditingController();
  TextEditingController strHomeaddressLiveYear3 = TextEditingController();
  TextEditingController strHomeaddressLivemonth3 = TextEditingController();
  TextEditingController strHomeaddress7 = TextEditingController();
  TextEditingController strHomeaddress8 = TextEditingController();
  TextEditingController strHomeaddressCity4 = TextEditingController();
  TextEditingController strHomeaddressPostCode4 = TextEditingController();
  TextEditingController strHomeaddressLiveYear4 = TextEditingController();
  TextEditingController strHomeaddressLiveMonth4 = TextEditingController();
  TextEditingController strHomeaddress9 = TextEditingController();
  TextEditingController strHomeaddress10 = TextEditingController();
  TextEditingController strHomeaddressCity5 = TextEditingController();
  TextEditingController strHomeaddressPostCode5 = TextEditingController();
  TextEditingController strHomeaddressLiveYear5 = TextEditingController();
  TextEditingController strHomeaddressLiveMonth5owner = TextEditingController();

  List nameTitle = ["Mr", "Mrs", "Miss", "Ms", "Sir", "Dr"];

  Widget nameList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: nameTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                nameTitle[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strTitleQwner1.text = nameTitle[index];
                });
                Navigator.pop(context);
              },
            ),
          );
        });
  }

  DateTime selectedDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 21);

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  Future dobSelect(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "Required") {
        setState(() {
          print("picked");
        });

        strDobOwner1.text = dateFormat.format(picked);
      } else {
        setState(() {
          print("not picke");
        });
        strDobOwner1.text = dateFormat.format(picked);
      }
    }
  }

  List year = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "More than 10 year"
  ];

  List month = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12"
  ];
  int addAddress = 1;

  Widget yearList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: year.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                year[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strHomeaddressLiveYear.text = year[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget monthList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: month.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                month[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strHomeaddressLiveYear.text = month[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget yearList1() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: year.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                year[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strHomeaddressLiveYear1.text = year[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget monthList1() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: month.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                month[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strHomeaddressLiveMonth1.text = month[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget yearList2() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: year.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                year[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strHomeaddressPostLiveYear2.text = year[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget monthList2() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: month.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                month[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strHomeaddressPostLiveMonth2.text = month[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget yearList3() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: year.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                year[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strHomeaddressLiveYear3.text = year[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget monthList3() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: month.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                month[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strHomeaddressLivemonth3.text = month[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget yearList4() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: year.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                year[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strHomeaddressLiveYear4.text = year[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget monthList4() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: month.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                month[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strHomeaddressLiveYear4.text = month[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget yearList5() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: year.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                year[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strHomeaddressLiveYear5.text = year[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget monthList5() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: month.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                month[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strHomeaddressLiveMonth5owner.text = month[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

/*
  Widget yearList6() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: year.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                year[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  strHomeaddressLiveMonth.text = year[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget monthList6() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: month.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                month[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  monthhListController.text = month[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }*/

  Widget addLogic() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Home Address",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * .025,
              color: Color.fromRGBO(31, 33, 29, 1)),
        ),
        InkWell(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  "Add Address",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              addAddress = addAddress + 1;
            });
          },
        ),
        InkWell(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              addAddress = addAddress - 1;
            });
          },
        ),
        /* IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              addAddress = addAddress + 1;
            });
          },
        ),*/
        /*   IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              addAddress = addAddress - 1;
            });
          },
        )*/
      ],
    );
  }

  bool autovalidation = false;

  Widget defaultAddress() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Home Address1",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .022,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'Address 1',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, home_Address, autovalidation,
                  TextInputType.text, "Home Address 1", (value) {
                if (value.isEmpty) {
                  return 'Please enter Home Address 1';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'City',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              //height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(strHomeAdressCity, false, autovalidation,
                  TextInputType.text, "Home City", (value) {
                if (value.isEmpty) {
                  return 'Please enter City';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Address 2",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, home_Address2, autovalidation,
                  TextInputType.text, "Home Address 2", (value) {
                /*if (value.isEmpty) {
                              return 'Please enter Site Address 2';
                            }*/
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'PostCode',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(
                  strHomeAdressPostCode,
                  false,
                  autovalidation,
                  TextInputType.text,
                  "Billing Post Code", (value) {
                if (value.isEmpty) {
                  return 'Please enter PostCode';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'Time at address',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //   height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveYear,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select Year", (value) {
                      if (value.isEmpty) {
                        return 'Please Select Year';
                      }
                      return null;
                    }, context),
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
                                "--Year--",
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
                              Flexible(
                                child: Container(
                                  child: yearList(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveMonth,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select month", (value) {
                      if (value.isEmpty) {
                        return 'Please Select month';
                      }
                      return null;
                    }, context),
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
                                "--Month--",
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
                              Flexible(
                                child: Container(
                                  child: monthList(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

  Widget firstAddress() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Home Address1",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .022,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'Address 1',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, strHomeaddress1, autovalidation,
                  TextInputType.text, "Home Address 1", (value) {
                if (value.isEmpty) {
                  return 'Please enter Home Address 1';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'City',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(strHomeaddressCity1, false, autovalidation,
                  TextInputType.text, "Home City", (value) {
                if (value.isEmpty) {
                  return 'Please enter City';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Address 2",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, strHomeaddress2, autovalidation,
                  TextInputType.text, "Home Address 2", (value) {
                /*if (value.isEmpty) {
                              return 'Please enter Site Address 2';
                            }*/
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'PostCode',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(
                  strHomeaddressPostCode1,
                  false,
                  autovalidation,
                  TextInputType.text,
                  "Billing Post Code", (value) {
                if (value.isEmpty) {
                  return 'Please enter PostCode';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'Time at address',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //   height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveYear1,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select Year", (value) {
                      if (value.isEmpty) {
                        return 'Please Select Year';
                      }
                      return null;
                    }, context),
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
                                "--Year--",
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
                              Flexible(
                                child: Container(
                                  child: yearList1(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveMonth1,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select month", (value) {
                      if (value.isEmpty) {
                        return 'Please Select month';
                      }
                      return null;
                    }, context),
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
                                "--Month--",
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
                              Flexible(
                                child: Container(
                                  child: monthList1(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

  Widget secondAddress() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Home Address2",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .022,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'Address 1',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  //    TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, strHomeaddress3, autovalidation,
                  TextInputType.text, "Home Address 1", (value) {
                // if (value.isEmpty) {
                //   return 'Please enter Home Address 1';
                // }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'City',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  //  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(strHomeaddressCity2, false, autovalidation,
                  TextInputType.text, "Home City ", (value) {
                // if (value.isEmpty) {
                //   return 'Please enter City 2';
                // }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Address 2",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, strHomeaddress4, autovalidation,
                  TextInputType.text, "Home Address 2", (value) {
                /*if (value.isEmpty) {
                              return 'Please enter Site Address 2';
                            }*/
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'PostCode',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  // TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              //   height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(
                  strHomeaddressPostCode2,
                  false,
                  autovalidation,
                  TextInputType.text,
                  "Home Post Code ", (value) {
                // if (value.isEmpty) {
                //   return 'Please enter PostCode 3';
                // }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'Time at address',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  //  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //   height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressPostLiveYear2,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select Year", (value) {
                      // if (value.isEmpty) {
                      //   return 'Please Select Year';
                      // }
                      return null;
                    }, context),
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
                                "--Year--",
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
                              Flexible(
                                child: Container(
                                  child: yearList3(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressPostLiveMonth2,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select month", (value) {
                      // if (value.isEmpty) {
                      //   return 'Please Select month';
                      // }
                      return null;
                    }, context),
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
                                "--Month--",
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
                              Flexible(
                                child: Container(
                                  child: monthList3(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

  Widget thirdAddress() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Home Address3",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .022,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'Address 1',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  // TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, strHomeaddress5, autovalidation,
                  TextInputType.text, "Home Address 1", (value) {
                // if (value.isEmpty) {
                //   return 'Please enter Home Address 1';
                // }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'City',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  // TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              //      height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(strHomeaddressCity3, false, autovalidation,
                  TextInputType.text, "Home City ", (value) {
                // if (value.isEmpty) {
                //   return 'Please enter City 1';
                // }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Address 2",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, strHomeaddress6, autovalidation,
                  TextInputType.text, "Home Address 2", (value) {
                /*if (value.isEmpty) {
                              return 'Please enter Site Address 2';
                            }*/
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'PostCode',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  //  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              //   height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(
                  strHomeaddressPostCode3,
                  false,
                  autovalidation,
                  TextInputType.text,
                  "Home Post Code ", (value) {
                // if (value.isEmpty) {
                //   return 'Please enter PostCode 2';
                // }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'Time at address',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  //TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //   height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveYear3,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select Year", (value) {
                      // if (value.isEmpty) {
                      //   return 'Please Select Year';
                      // }
                      return null;
                    }, context),
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
                                "--Year--",
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
                              Flexible(
                                child: Container(
                                  child: yearList2(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveYear3,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select month", (value) {
                      // if (value.isEmpty) {
                      //   return 'Please Select month';
                      // }
                      return null;
                    }, context),
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
                                "--Month--",
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
                              Flexible(
                                child: Container(
                                  child: monthList2(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

  Widget forthAddress() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Home Address4",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .022,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'Address 4',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  // TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, strHomeaddress7, autovalidation,
                  TextInputType.text, "Home Address 1", (value) {
                // if (value.isEmpty) {
                //   return 'Please enter Home Address 1';
                // }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'City',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  // TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              //  height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(strHomeaddressCity4, false, autovalidation,
                  TextInputType.text, "Home City ", (value) {
                // if (value.isEmpty) {
                //   return 'Please enter City 4';
                // }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Address 2",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, strHomeaddress8, autovalidation,
                  TextInputType.text, "Home Address 2", (value) {
                /*if (value.isEmpty) {
                              return 'Please enter Site Address 2';
                            }*/
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'PostCode',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  // TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              //    height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(
                  strHomeaddressPostCode4,
                  false,
                  autovalidation,
                  TextInputType.text,
                  "Home Post Code ", (value) {
                // if (value.isEmpty) {
                //   return 'Please enter PostCode 4';
                // }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'Time at address',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  // TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //   height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveYear4,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select Year", (value) {
                      // if (value.isEmpty) {
                      //   return 'Please Select Year';
                      // }
                      return null;
                    }, context),
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
                                "--Year--",
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
                              Flexible(
                                child: Container(
                                  child: yearList4(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveMonth4,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select month", (value) {
                      // if (value.isEmpty) {
                      //   return 'Please Select month';
                      // }
                      return null;
                    }, context),
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
                                "--Month--",
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
                              Flexible(
                                child: Container(
                                  child: monthList4(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

  Widget fifthAddress() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Home Address 1",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .022,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'Address 1',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  //  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, strHomeaddress9, autovalidation,
                  TextInputType.text, "Home Address 1", (value) {
                if (value.isEmpty) {
                  return 'Please enter Home Address 1';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'City',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  // TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(strHomeaddressCity5, false, autovalidation,
                  TextInputType.text, "Home City ", (value) {
                // if (value.isEmpty) {
                //   return 'Please enter City ';
                // }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Address 2",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, strHomeaddress10, autovalidation,
                  TextInputType.text, "Home Address 2", (value) {
                /*if (value.isEmpty) {
                              return 'Please enter Site Address 2';
                            }*/
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'PostCode',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  //  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              //   height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(
                  strHomeaddressPostCode5,
                  false,
                  autovalidation,
                  TextInputType.text,
                  "Home Post Code ", (value) {
                // if (value.isEmpty) {
                //   return 'Please enter PostCode 3';
                // }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'Time at address',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  // TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //   height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveYear5,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select Year", (value) {
                      if (value.isEmpty) {
                        return 'Please Select Year';
                      }
                      return null;
                    }, context),
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
                                "--Year--",
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
                              Flexible(
                                child: Container(
                                  child: yearList5(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveMonth5owner,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select month", (value) {
                      if (value.isEmpty) {
                        return 'Please Select month';
                      }
                      return null;
                    }, context),
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
                                "--Month--",
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
                              Flexible(
                                child: Container(
                                  child: monthList5(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

/*
  Widget sixthAddress() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Home Address6",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .022,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'Address 1',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, strHomeaddress3, autovalidation,
                  TextInputType.text, "Home Address 1", (value) {
                    if (value.isEmpty) {
                      return 'Please enter Home Address 1';
                    }
                    return null;
                  }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'City',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(strHomeaddressCity3, false, autovalidation,
                  TextInputType.text, "Home City 1", (value) {
                    if (value.isEmpty) {
                      return 'Please enter City 1';
                    }
                    return null;
                  }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Address 2",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, strHomeaddress2owner5, autovalidation,
                  TextInputType.text, "Home Address 2", (value) {
                    */
/*if (value.isEmpty) {
                              return 'Please enter Site Address 2';
                            }*/
  /*

                    return null;
                  }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: 'PostCode',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(strHomeaddressPostCode2owner5, false, autovalidation,
                  TextInputType.text, "Home Post Code 3", (value) {
                    if (value.isEmpty) {
                      return 'Please enter PostCode 3';
                    }
                    return null;
                  }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'Time at address',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //   height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressPostLiveYear2owner5,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select Year", (value) {
                      if (value.isEmpty) {
                        return 'Please Select Year';
                      }
                      return null;
                    }, context),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showDialog(
                        context: context,
                        child: Dialog(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.03,
                              ),
                              Text(
                                "--Year--",
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
                              Flexible(
                                child: Container(
                                  child: yearList6(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressPostLiveMonth2owner5,
                        false,
                        autovalidation,
                        TextInputType.text,
                        "Select month", (value) {
                      if (value.isEmpty) {
                        return 'Please Select month';
                      }
                      return null;
                    }, context),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showDialog(
                        context: context,
                        child: Dialog(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.03,
                              ),
                              Text(
                                "--Month--",
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
                              Flexible(
                                child: Container(
                                  child: monthList6(),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
*/

  Widget getAddress(int add) {
    if (add == 0) {
      return Column(
        children: [
          addLogic(),
          SizedBox(
            height: 20,
          ),
          defaultAddress(),
        ],
      );
      /* return Container(child: defaultAddress());*/
    }
    if (add == 1) {
      return Column(
        children: [
          addLogic(),
          SizedBox(
            height: 20,
          ),
          firstAddress(),
        ],
      );
    }
    if (add == 2) {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          firstAddress(),
          SizedBox(
            height: 20,
          ),
          addLogic(),
          SizedBox(
            height: 20,
          ),
          secondAddress(),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }
    if (add == 3) {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          firstAddress(),
          SizedBox(
            height: 20,
          ),
          secondAddress(),
          SizedBox(
            height: 20,
          ),
          addLogic(),
          SizedBox(
            height: 20,
          ),
          thirdAddress(),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }
    if (add == 4) {
      return Column(
        children: [
          firstAddress(),
          SizedBox(
            height: 20,
          ),
          secondAddress(),
          SizedBox(
            height: 20,
          ),
          thirdAddress(),
          SizedBox(
            height: 20,
          ),
          addLogic(),
          SizedBox(
            height: 20,
          ),
          forthAddress(),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }
    if (add == 5) {
      return Column(
        children: [
          firstAddress(),
          SizedBox(
            height: 20,
          ),
          secondAddress(),
          SizedBox(
            height: 20,
          ),
          thirdAddress(),
          SizedBox(
            height: 20,
          ),
          forthAddress(),
          SizedBox(
            height: 20,
          ),
          addLogic(),
          SizedBox(
            height: 20,
          ),
          fifthAddress(),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }
    /*  if (add == 6) {
      return Column(
        children: [
          firstAddress(),
          SizedBox(
            height: 20,
          ),
          secondAddress(),
          SizedBox(
            height: 20,
          ),
          thirdAddress(),
          SizedBox(
            height: 20,
          ),
          forthAddress(),
          SizedBox(
            height: 20,
          ),
          fifthAddress(),
          SizedBox(
            height: 20,
          ),
          addLogic(),
          SizedBox(
            height: 20,
          ),
          sixthAddress(),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }*/
    if (add > 5) {
      return Column(
        children: [
          addLogic(),
          SizedBox(
            height: 20,
          ),
          firstAddress(),
        ],
      );
    }
    // return Container(
    //   child: defaultAddress(),
    // );
  }

  void soleAddressInitialData() async {
    final data = await EleBusinessTypePref.getSoleBusinessTypeAdd();
    setState(() {
      print(strTitleQwner1.text);
      if (data != null) {
        strTitleQwner1.text = data.strTitleQwner1;
        firstName.text = data.firstName;
        lastName.text = data.lastName;
        strTitleDirector2.text = data.strTitleDirector2;
        strDirector2Firstname.text = data.strDirector2Firstname;
        strDirector2Lastname.text = data.strDirector2Lastname;
        strDobOwner1.text = data.strDobOwner1;
        home_Address.text = data.home_Address;
        home_Address2.text = data.home_Address2;
        strHomeAdressPostCode.text = data.strHomeAdressPostCode;
        strHomeAdressCity.text = data.strHomeAdressCity;
        strHomeaddressLiveYear.text = data.strHomeaddressLiveYear;
        strHomeaddressLiveMonth.text = data.strHomeaddressLiveMonth;
        strHomeaddress1.text = data.strHomeaddress1;
        strHomeaddress2.text = data.strHomeaddress2;
        strHomeaddressCity1.text = data.strHomeaddressCity1;
        strHomeaddressPostCode1.text = data.strHomeaddressPostCode1;
        strHomeaddressLiveYear1.text = data.strHomeaddressLiveYear1;
        strHomeaddressLiveMonth1.text = data.strHomeaddressLiveMonth1;
        strHomeaddress3.text = data.strHomeaddress3;
        strHomeaddress4.text = data.strHomeaddress4;
        strHomeaddressCity2.text = data.strHomeaddressCity2;
        strHomeaddressPostCode2.text = data.strHomeaddressPostCode2;
        strHomeaddressPostLiveYear2.text = data.strHomeaddressPostLiveYear2;
        strHomeaddressPostLiveMonth2.text = data.strHomeaddressPostLiveMonth2;
        strHomeaddress5.text = data.strHomeaddress5;
        strHomeaddress6.text = data.strHomeaddress6;
        strHomeaddressCity3.text = data.strHomeaddressCity3;
        strHomeaddressPostCode3.text = data.strHomeaddressPostCode3;
        strHomeaddressLiveYear3.text = data.strHomeaddressLiveYear3;
        strHomeaddressLivemonth3.text = data.strHomeaddressLivemonth3;
        strHomeaddress7.text = data.strHomeaddress7;
        strHomeaddress8.text = data.strHomeaddress8;
        strHomeaddressCity4.text = data.strHomeaddressCity4;
        strHomeaddressPostCode4.text = data.strHomeaddressPostCode4;
        strHomeaddressLiveYear4.text = data.strHomeaddressLiveYear4;
        strHomeaddressLiveMonth4.text = data.strHomeaddressLiveMonth4;
        strHomeaddress9.text = data.strHomeaddress9;
        strHomeaddress10.text = data.strHomeaddress10;
        strHomeaddressCity5.text = data.strHomeaddressCity5;
        strHomeaddressPostCode5.text = data.strHomeaddressPostCode5;
        strHomeaddressLiveYear5.text = data.strHomeaddressLiveYear5;
        strHomeaddressLiveMonth5owner.text = data.strHomeaddressLiveMonth5owner;
      }
    });
  }

  void soleAddressOnSaveAndNext() {
    setState(() {
      EleBusinessTypePref.setSoleBusinessTypeAdd(SoleBusinessCredential(
        strTitleQwner1: strTitleQwner1.text,
        firstName: firstName.text,
        lastName: lastName.text,
        strTitleDirector2: strTitleDirector2.text,
        strDirector2Firstname: strDirector2Firstname.text,
        strDirector2Lastname: strDirector2Lastname.text,
        strDobOwner1: strDobOwner1.text,
        home_Address: home_Address.text,
        home_Address2: home_Address2.text,
        strHomeAdressPostCode: strHomeAdressPostCode.text,
        strHomeAdressCity: strHomeAdressCity.text,
        strHomeaddressLiveYear: strHomeaddressLiveYear.text,
        strHomeaddressLiveMonth: strHomeaddressLiveMonth.text,
        strHomeaddress1: strHomeaddress1.text,
        strHomeaddress2: strHomeaddress2.text,
        strHomeaddressCity1: strHomeaddressCity1.text,
        strHomeaddressPostCode1: strHomeaddressPostCode1.text,
        strHomeaddressLiveYear1: strHomeaddressLiveYear1.text,
        strHomeaddressLiveMonth1: strHomeaddressLiveMonth1.text,
        strHomeaddress3: strHomeaddress3.text,
        strHomeaddress4: strHomeaddress4.text,
        strHomeaddressCity2: strHomeaddressCity2.text,
        strHomeaddressPostCode2: strHomeaddressPostCode2.text,
        strHomeaddressPostLiveYear2: strHomeaddressPostLiveYear2.text,
        strHomeaddressPostLiveMonth2: strHomeaddressPostLiveMonth2.text,
        strHomeaddress5: strHomeaddress5.text,
        strHomeaddress6: strHomeaddress6.text,
        strHomeaddressCity3: strHomeaddressCity3.text,
        strHomeaddressPostCode3: strHomeaddressPostCode3.text,
        strHomeaddressLiveYear3: strHomeaddressLiveYear3.text,
        strHomeaddressLivemonth3: strHomeaddressLivemonth3.text,
        strHomeaddress7: strHomeaddress7.text,
        strHomeaddress8: strHomeaddress8.text,
        strHomeaddressCity4: strHomeaddressCity4.text,
        strHomeaddressPostCode4: strHomeaddressPostCode4.text,
        strHomeaddressLiveYear4: strHomeaddressLiveYear4.text,
        strHomeaddressLiveMonth4: strHomeaddressLiveMonth4.text,
        strHomeaddress9: strHomeaddress9.text,
        strHomeaddress10: strHomeaddress10.text,
        strHomeaddressCity5: strHomeaddressCity5.text,
        strHomeaddressPostCode5: strHomeaddressPostCode5.text,
        strHomeaddressLiveYear5: strHomeaddressLiveYear5.text,
        strHomeaddressLiveMonth5owner: strHomeaddressLiveMonth5owner.text,
      ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    soleAddressInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<EleBusAddProspectViewModel>(
            //onModelReady: (model) => model.initialData(),
            builder: (context, model, child) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  Row(
                    children: [
                      Text(
                        "Owner1",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .025,
                            color: Color.fromRGBO(31, 33, 29, 1)),
                      ),
                      /*  FlatButton(
                                   child: Text("add "),
                                )*/
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Title",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * .062,
                      child: dropdowntextfield(
                          strTitleQwner1,
                          false,
                          model.autovalidation,
                          TextInputType.text,
                          "Select Title", (value) {
                        if (value.isEmpty) {
                          return 'Please select title';
                        }
                        return null;
                      }, context),
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
                                  "Select Title",
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
                                  child: nameList(),
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'First Name',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' \*',
                                style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    // height: MediaQuery.of(context).size.height * .062,
                    child: innertextfield(
                        firstName,
                        false,
                        model.autovalidation,
                        TextInputType.text,
                        "First name", (value) {
                      if (value.isEmpty) {
                        return 'Please enter First name';
                      }
                      return null;
                    }, context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'Last Name',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                          children: <TextSpan>[
                            TextSpan(
                                text: '', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    // height: MediaQuery.of(context).size.height * .062,
                    child: innertextfield(lastName, false, model.autovalidation,
                        TextInputType.text, "Last name", (value) {
                      if (value.isEmpty) {
                        return 'Please enter Last name';
                      }
                      return null;
                    }, context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'BOD',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                          color: Color.fromRGBO(31, 33, 29, 1)),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' \*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  InkWell(
                    child: SizedBox(
                      //   height: MediaQuery.of(context).size.height * .062,
                      child: datetextfield(
                          strDobOwner1,
                          false,
                          model.autovalidation,
                          TextInputType.text,
                          "Select date", (value) {
                        if (value.isEmpty) {
                          return 'Please Select date';
                        }
                        return null;
                      }, context),
                    ),
                    onTap: () {
                      dobSelect(context, "Contract Start Date");
                    },
                  ),
                  /* InkWell(
                      child: SizedBox(
                        //height: MediaQuery.of(context).size.height * .062,
                        child: datetextfield(
                            strDobOwner1 ,
                            false,
                            model.autovalidation,
                            TextInputType.text,
                            "Select date", (value) {
                          setState(() {
                            if (value.isEmpty) {
                              return 'Please Select date';
                            } else {
                              return value.text.toString();
                            }
                          });
                          // return null;
                          return strDobOwner1.text = value;
                        }, context),
                      ),
                      onTap: () {
                        dobSelect(context, "Required");
                      },
                    ),*/
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  //Home Address
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: theme.innertextfieldbordercolor)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          /*  defaultAddress != null ?  Row(
                              children: [
                                Text(
                                  "Home Address",
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * .025,
                                      color: Color.fromRGBO(31, 33, 29, 1)),
                                ),
                                IconButton(icon: Icon(Icons.add),onPressed: (){
                                  setState(() {
                                   addAddress = addAddress+1;
                                  });
                                },),
                                IconButton(icon: Icon(Icons.delete),onPressed: (){

                                  setState(() {
                                    addAddress = addAddress-1;
                                  });
                                },)
                              ],
                            ):Container(),*/
                          addAddress != null
                              ? Container(
                                  child: getAddress(addAddress),
                                )
                              : getAddress(addAddress)
                        ],
                      ),
                    ),
                  ),
/*
getAddress(model.addAddress),
*/
/*
Container(
  child:getAddress(model.addAddress),
),
*/

                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.062,
                      child: Center(
                        child: Text(
                          "Save And Next",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.017,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: ThemeApp().purplecolor,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onTap: () {
                      // soleAddressOnSaveAndNext();
                      // globals.tabController1.animateTo(7);
                      /*      if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                 soleAddressOnSaveAndNext();
                                  if(_formKey!=null){
                                    globals.tabController1.animateTo(6);
                                  }
                                } else {
                                  setState(() {
                                    model.autovalidation = true;
                                  });
                                }*/
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        soleAddressOnSaveAndNext();

                        globals.tabController1.animateTo(7);
                      } else {
                        setState(() {
                          model.autovalidation = true;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.028,
                  ),
                ],
              ),
            );
          })
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
