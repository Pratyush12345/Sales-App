import 'package:flutter/material.dart';
import 'package:pozitive/Core/ViewModel/DualFuelAddProspect-viewModel/DualFuelBusiness-ViewModel.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';


class AddAddresses extends StatefulWidget {
  @override
  _AddAddressesState createState() => _AddAddressesState();
}

class _AddAddressesState extends State<AddAddresses> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<DualFuelAddProspectBusinessViewModel>(
        onModelReady: (model) => model.initialData((){}),
    builder: (context, model, child) {

    return Column(
      children: [

        Text(
          "Home Address1",
          style: TextStyle(
              fontSize:
              MediaQuery.of(context).size.height * .025,
              color: Color.fromRGBO(31, 33, 29, 1)),
        ),
        Divider(thickness: 2,),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        RichText(
          text: TextSpan(
            text: 'Address 1',
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

        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
          child: innerLongtextfield(
              5,
              model.address1Controller,
              model.autovalidation,
              TextInputType.text,
              "Billing Address 1", (value) {
            if (value.isEmpty) {
              return 'Please enter Site Address 1';
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .062,
          child: innertextfield(
              model.cityController,
              false,
              model.autovalidation,
              TextInputType.text,
              "Billing City", (value) {
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
              fontSize:
              MediaQuery.of(context).size.height * .015,
              color: Color.fromRGBO(31, 33, 29, 1)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
          child: innerLongtextfield(
              5,
              model.address2Controller,
              model.autovalidation,
              TextInputType.text,
              "Billing Address 2", (value) {
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .062,
          child: innertextfield(
              model.postcode,
              false,
              model.autovalidation,
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
                    model.yearListController,
                    false,
                    model.autovalidation,
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
                            MediaQuery.of(context).size.height *
                                0.03,
                          ),
                          Text(
                            "--Year--",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.of(context)
                                    .size
                                    .height *
                                    0.03),
                          ),
                          SizedBox(
                            height:
                            MediaQuery.of(context).size.height *
                                0.02,
                          ),
                          Container(
                            width:
                            MediaQuery.of(context).size.width,
                            height: 1,
                            color: Colors.grey.withOpacity(.2),
                          ),
                          Flexible(
                            child: Container(
                              child: model.yearList(),
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
                    model.monthhListController,
                    false,
                    model.autovalidation,
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
                            MediaQuery.of(context).size.height *
                                0.03,
                          ),
                          Text(
                            "--Month--",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.of(context)
                                    .size
                                    .height *
                                    0.03),
                          ),
                          SizedBox(
                            height:
                            MediaQuery.of(context).size.height *
                                0.02,
                          ),
                          Container(
                            width:
                            MediaQuery.of(context).size.width,
                            height: 1,
                            color: Colors.grey.withOpacity(.2),
                          ),
                          Flexible(
                            child: Container(
                              child: model.monthList(),
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

    );
    })
        : Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
