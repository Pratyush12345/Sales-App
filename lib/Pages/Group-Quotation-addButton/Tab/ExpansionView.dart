import 'package:flutter/material.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Widget/TextField/dropdownTextField.dart';

class ExpansionView extends StatefulWidget {
  @override
  _ExpansionViewState createState() => _ExpansionViewState();
}

class _ExpansionViewState extends State<ExpansionView> {
  bool _autovalidation = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      color: Colors.grey.shade200,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.94,
            child: Text(
              "Contract Date",
              style: TextStyle(
                  color: Color.fromRGBO(18, 122, 69, 1),
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            // decoration: BoxDecoration(
            //   border: Border(
            //     bottom: BorderSide(
            //       width: 2,
            //       color: Color.fromRGBO(18, 122, 69, 1),
            //     ),
            //   ),
            // ),
          ),
          Divider(
            color: Color.fromRGBO(18, 122, 69, 1),
            thickness: 1.5,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Contract start date'),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.43,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Color.fromRGBO(128, 189, 40, 1)),
                          color: Colors.white,
                        ),

                        //color: Color.fromRGBO(18, 122, 69, 1),
                        child: Text(
                          "Start Date",
                          style: TextStyle(
                              color: Color.fromRGBO(18, 122, 69, 1),
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Contract end date'),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.43,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Color.fromRGBO(128, 189, 40, 1)),
                          color: Colors.white,
                        ),

                        //color: Color.fromRGBO(18, 122, 69, 1),
                        child: Text(
                          "End Date",
                          style: TextStyle(
                              color: Color.fromRGBO(18, 122, 69, 1),
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.94,
              //padding: EdgeInsets.only(top :10,bottom: 10),
              child: Text(
                "Base Rate",
                style: TextStyle(
                    color: Color.fromRGBO(18, 122, 69, 1),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )),
          Divider(
            color: Color.fromRGBO(18, 122, 69, 1),
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                // padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.day,
                  //controller: model.dayController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  hintText: 'Day',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.day),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                //padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.night,
                  //controller: model.nightController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'night',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.day),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                // padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.eWE,
                  //controller: model.eweController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'EWE',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.eWE),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                //padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.sc,
                  //controller: model.scController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'SC',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.sc),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.018,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.94,
              //padding: EdgeInsets.only(top :10,bottom: 10),
              child: Text(
                "Required Uplift",
                style: TextStyle(
                    color: Color.fromRGBO(18, 122, 69, 1),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )),
          Divider(
            color: Color.fromRGBO(18, 122, 69, 1),
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                // padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.day,
                  //  controller: model.requiredUpLiftDayController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'Day',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.day),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                //padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.night,
                  //controller:      model.requiredUpLiftNightController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'night',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.day),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                // padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.eWE,
                  //  controller: model.requiredUpLiftEweController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'EWE',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.eWE),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                //padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.sc,
                  //  controller: model.requiredUpLiftScController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'SC',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.sc),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.94,
              //padding: EdgeInsets.only(top :10,bottom: 10),
              child: Text(
                "Uplift Price Premium",
                style: TextStyle(
                    color: Color.fromRGBO(18, 122, 69, 1),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )),
          Divider(
            color: Color.fromRGBO(18, 122, 69, 1),
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                // padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.day,
                  //  controller:
                  //     model.affiliateUpLiftDayController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'Day',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.day),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                //padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.night,
                  //  controller:
                  //      model.affiliateUpLiftNightController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'night',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.day),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                // padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.eWE,
                  //controller:
                  //   model.affiliateUpLiftEweController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'EWE',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.eWE),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                //padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.sc,
                  // controller: model.affiliateUpLiftScController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'SC',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.sc),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.94,
              //padding: EdgeInsets.only(top :10,bottom: 10),
              child: Text(
                "Affiliate Uplift",
                style: TextStyle(
                    color: Color.fromRGBO(18, 122, 69, 1),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )),
          Divider(
            color: Color.fromRGBO(18, 122, 69, 1),
            thickness: 1.5,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Contract start date',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: DropDownTextField(
                // controller: model.partnerController,
                obscureText: false,
                autoValidation: _autovalidation,
                textInputType: TextInputType.text,
                hintText: "Select Partner",
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Select Partner';
                  }
                  return null;
                },
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
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          "Select Partner",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Colors.grey.withOpacity(.2),
                        ),
                        Container(
                            //
                            //        partnerview(['${user.userName}'], model),
                            )
                      ],
                    ),
                  ));
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .43,
                // height: MediaQuery.of(context).size.height * 0.062,
                // padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.day,
                  //  controller:
                  //     model.affiliateUpLiftDayController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'Day',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.day),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                //padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.night,
                  //  controller:
                  //      model.affiliateUpLiftNightController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'night',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.day),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                // padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.eWE,
                  //controller:
                  //   model.affiliateUpLiftEweController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'EWE',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.eWE),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                //padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.sc,
                  // controller: model.affiliateUpLiftScController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'SC',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.sc),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.94,
              //padding: EdgeInsets.only(top :10,bottom: 10),
              child: Text(
                "Final Price",
                style: TextStyle(
                    color: Color.fromRGBO(18, 122, 69, 1),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )),
          Divider(
            color: Color.fromRGBO(18, 122, 69, 1),
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                // padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.day,
                  // controller: model.finalUpLiftDayController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'Day',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.day),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                //padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.night,
                  //  controller: model.finalUpLiftNightController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'night',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.day),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                // padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.eWE,
                  //  controller: model.finalUpLiftEweController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'EWE',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.eWE),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .43,
                //  height: MediaQuery.of(context).size.height*0.062,
                //padding: EdgeInsets.all(10),
                //height: 500,
                child: AppTextField(
                  title: AppString.sc,
                  //  controller: model.finalUpLiftScController,
                  autoValidation: _autovalidation,
                  textInputType: TextInputType.number,
                  hintText: 'SC',
                  textInputFormatter: [
                    new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  validator: (value) =>
                      AppConstant.stringValidator(value, AppString.sc),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
