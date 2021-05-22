import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Widget/TextField/innerTextField.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Widget/bottonfram.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:intl/intl.dart';

class AppointmentWidget extends StatefulWidget {
  @override
  _AppointmentWidgetState createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController postcode = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController appointmentDateController = TextEditingController();
  TextEditingController appointmentTimeController = TextEditingController();

  bool _autovalidation = false;
  int genders = 1;

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  TimeOfDay _time = TimeOfDay(hour: 00, minute: 00);

  Future selectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.add(new Duration(days: 4)),
        firstDate: selectedDate.add(new Duration(days: 4)),
        lastDate: DateTime(2101));

    if (picked != null) {
      setState(() {
        appointmentDateController.text = dateFormat.format(picked);
      });
    } else {
      return 'please select date';
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
        appointmentTimeController.text = _time.format(context);
      });
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: appbar("New Appointment", context, _scaffoldKey, true, true),
      drawer: DrawerWidget(),
      body: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.width * 0.03),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                  RichText(
                    text: TextSpan(
                      text: AppString.firstName,
                      style: TextStyle(
                          fontSize: titlefontResize(context, 0.015),
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' \*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  InnerTextField(
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: AppString.firstName,
                    controller: firstName,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter FirstName';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * .01,
                  ),
                  RichText(
                    text: TextSpan(
                      text: AppString.lastName,
                      style: TextStyle(
                          fontSize: titlefontResize(context, 0.015),
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' \*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  InnerTextField(
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: AppString.lastName,
                    controller: lastName,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter LastName';
                      } else {
                        return null;
                      }
                    },
                  ),
                  RichText(
                    text: TextSpan(
                      text: AppString.emailAddess,
                      style: TextStyle(
                          fontSize: titlefontResize(context, 0.015),
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' \*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  InnerTextField(
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: AppString.emailAddess,
                    controller: email,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Text(
                    AppString.gender,
                    style: TextStyle(
                        fontSize: titlefontResize(context, 0.015),
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    //height: MediaQuery.of(context).size.height * .062,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .062,
                            child: Row(
                              children: <Widget>[
                                genders == 1
                                    ? Icon(
                                        Icons.radio_button_checked,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      )
                                    : InkWell(
                                        child: Icon(
                                          Icons.radio_button_unchecked,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            genders = 1;
                                          });
                                        },
                                      ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .0015,
                                ),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                      color: Color.fromRGBO(0, 0, 0, .8)),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              genders = 1;
                            });
                          },
                        ),
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .062,
                            child: Row(
                              children: <Widget>[
                                genders == 2
                                    ? Icon(Icons.radio_button_checked,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                        color: Color.fromRGBO(155, 119, 217, 1))
                                    : InkWell(
                                        child: Icon(
                                            Icons.radio_button_unchecked,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .023,
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1)),
                                        onTap: () {
                                          setState(() {
                                            genders = 2;
                                          });
                                        },
                                      ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .0015,
                                ),
                                Text(
                                  "Female",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                      color: Color.fromRGBO(0, 0, 0, .8)),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              genders = 2;
                            });
                          },
                        ),
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .062,
                            child: Row(
                              children: <Widget>[
                                genders == 3
                                    ? Icon(
                                        Icons.radio_button_checked,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                      )
                                    : InkWell(
                                        child: Icon(
                                          Icons.radio_button_unchecked,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            genders = 3;
                                          });
                                        },
                                      ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .0015,
                                ),
                                Text(
                                  "Other",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                      color: Color.fromRGBO(0, 0, 0, .8)),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              genders = 3;
                            });
                          },
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: ThemeApp().textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Text(
                    AppString.phoneNo,
                    style: TextStyle(
                        fontSize: titlefontResize(context, 0.015),
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    // width: MediaQuery.of(context).size.width * .818,
                    child: InnerTextField(
                      enablepadding: false,
                      textInputType: TextInputType.text,
                      hintText: AppString.phoneNo,
                      controller: phoneNumber,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Address 1',
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
                  SizedBox(
                    child: innerLongtextfield(
                        5,
                        address1Controller,
                        _autovalidation,
                        TextInputType.text,
                        "Address 1", (value) {
                      if (value.isEmpty) {
                        return 'Please enter Address 1';
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
                        TextSpan(
                            text: ' \*', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: innertextfield(cityController, false,
                        _autovalidation, TextInputType.text, "City", (value) {
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
                    child: innerLongtextfield(
                        5,
                        address2Controller,
                        _autovalidation,
                        TextInputType.text,
                        "Address 2", (value) {
                      /* if (value.isEmpty) {
                              return 'Please enter Address 2';
                            }*/
                      return null;
                    }, context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'PostCode',
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
                  SizedBox(
                    //height: MediaQuery.of(context).size.height * .062,
                    child: innertextfield(postcode, false, _autovalidation,
                        TextInputType.text, "Post Code", (value) {
                      String patttern =
                          r'^[A-Z]{1,2}[0-9][A-Z0-9]? ?[0-9][A-Z]{2}$';
                      RegExp regExp = new RegExp(patttern);

                      if (value.isEmpty) {
                        return 'Please enter PostCode';
                      }
                      if (!regExp.hasMatch(value)) {
                        return 'Please enter valid Post code';
                      }
                      return null;
                    }, context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Text(
                    AppString.appointmentInformation,
                    style: TextStyle(
                        fontSize: titlefontResize(context, 0.03),
                        color: Colors.green,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Appointment Date',
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
                      //height: MediaQuery.of(context).size.height * .062,
                      child: datetextfield(
                          appointmentDateController,
                          false,
                          _autovalidation,
                          TextInputType.datetime,
                          "Appointment date", (value) {
                        if (appointmentDateController.text.isEmpty) {
                          return 'Choose Date';
                        }
                        return appointmentDateController = value;
                      }, context),
                    ),
                    onTap: () {
                      selectDate(context, "Required");
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Appointment Time',
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
                      //height: MediaQuery.of(context).size.height * .062,
                      child: datetextfield(
                          appointmentTimeController,
                          false,
                          _autovalidation,
                          TextInputType.datetime,
                          "Appointment Time", (value) {
                        if (appointmentTimeController.text.isEmpty) {
                          return 'Choose Time';
                        }
                        return appointmentTimeController = value;
                      }, context),
                    ),
                    onTap: () {
                      _selectTime(context);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Appointment Details',
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
                  SizedBox(
                    child: innerLongtextfield(
                        5,
                        address2Controller,
                        _autovalidation,
                        TextInputType.text,
                        "Appointment Details", (value) {
                      return null;
                    }, context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  InkWell(
                    child: buttonframe(context, "SEND THE APPOINTMENT REQUEST"),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
