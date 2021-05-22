import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/appStyles.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/business_type_widget.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/check_box_field_widget.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/purple_flat_button.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/upload_file_widget.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';

class TemplateQuoteGroupScreen extends StatefulWidget {
  @override
  _TemplateQuoteGroupScreenState createState() =>
      _TemplateQuoteGroupScreenState();
}

class _TemplateQuoteGroupScreenState extends State<TemplateQuoteGroupScreen> {
  bool autoValidation = false;
  TextEditingController uniqueRefNoGroup = TextEditingController();
  ThemeApp themeApp = ThemeApp();
  int businessTypeSelected = 0;
  bool ltd = false;
  bool charity = false;
  bool soleProprietor = false;
  bool limitedLiability = false;
  bool microBusiness = false;
  bool plc = false;
  bool publicSector = false;
  bool partnerShip = false;
  bool llc = false;
  bool other = false;

  bool sameBillingAddressForAllCustomer = false;
  TextEditingController businessName = TextEditingController();
  TextEditingController regCompanyName = TextEditingController();
  TextEditingController companyRegNo = TextEditingController();
  TextEditingController charityRegNo = TextEditingController();

  TextEditingController contractBillAddress = TextEditingController();
  TextEditingController contractBillTown = TextEditingController();
  TextEditingController contractBillPostcode = TextEditingController();

  TextEditingController contractEamName = TextEditingController();
  TextEditingController contractEamEmail = TextEditingController();
  TextEditingController contractEamPhone = TextEditingController();
  TextEditingController contractEamMobile = TextEditingController();

  void togglesameBillingAddressForAll() {
    setState(() {
      sameBillingAddressForAllCustomer = !sameBillingAddressForAllCustomer;
    });
  }

  void toggleLtd() {
    setState(() {
      ltd = !ltd;
    });
  }

  void toggleCharity() {
    setState(() {
      charity = !charity;
    });
  }

  void toggleSoleProprietor() {
    setState(() {
      soleProprietor = !soleProprietor;
    });
  }

  void toggleLimitedLiability() {
    setState(() {
      limitedLiability = !limitedLiability;
    });
  }

  void toggleMicroBusiness() {
    setState(() {
      microBusiness = !microBusiness;
    });
  }

  void togglePlc() {
    setState(() {
      plc = !plc;
    });
  }

  void toggleOther() {
    setState(() {
      other = !other;
    });
  }

  void togglePublicSector() {
    setState(() {
      publicSector = !publicSector;
    });
  }

  void togglePartnerShip() {
    setState(() {
      partnerShip = !partnerShip;
    });
  }

  void toggleLlc() {
    setState(() {
      llc = !llc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultWhite,
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        child: ListView(
          children: [
            //Upload file field
            Text(
              AppString.select,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            UploadFileWidget(
              onTapChooseFile: () {},
              path: null,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //Download file button
            PurpleFlatButton(
              text: AppString.downloadYourFileCaps,
              onTap: () {},
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //Unique ref no
            AppTextField(
              enabled: false,
              title: AppString.uniqueRefNo,
              controller: uniqueRefNoGroup,
              autoValidation: autoValidation,
              textInputType: TextInputType.text,
              hintText: AppString.uniqueRefNo,
              validator: (value) =>
                  AppConstant.stringValidator(value, AppString.businessName),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //Terms
            Text(
              AppString.terms,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //LTD
                        BusinessTypeCheckBoxWidget(
                          selected: businessTypeSelected == 1 ? true : false,
                          businessTypeName: 'LTD',
                          onTap: () {
                            setState(() {
                              businessTypeSelected = 1;
                            });
                          },
                        ),

                        //Charity
                        BusinessTypeCheckBoxWidget(
                          businessTypeName: 'Charity',
                          selected: businessTypeSelected == 3 ? true : false,
                          onTap: () {
                            setState(() {
                              businessTypeSelected = 3;
                            });
                          },
                        ),

                        //PLC
                        BusinessTypeCheckBoxWidget(
                          businessTypeName: 'PLC',
                          selected: businessTypeSelected == 2 ? true : false,
                          onTap: () {
                            setState(() {
                              businessTypeSelected = 2;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Public Sector
                        BusinessTypeCheckBoxWidget(
                          businessTypeName: 'Public Sector',
                          selected: businessTypeSelected == 4 ? true : false,
                          onTap: () {
                            setState(() {
                              businessTypeSelected = 4;
                            });
                          },
                        ),

                        //Sole Proprietor
                        BusinessTypeCheckBoxWidget(
                          businessTypeName: 'Sole Proprietor',
                          selected: businessTypeSelected == 5 ? true : false,
                          onTap: () {
                            setState(() {
                              businessTypeSelected = 5;
                            });
                          },
                        ),

                        //LLC
                        BusinessTypeCheckBoxWidget(
                          businessTypeName: 'LLC',
                          selected: businessTypeSelected == 8 ? true : false,
                          onTap: () {
                            setState(() {
                              businessTypeSelected = 8;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Microbusiness
                        BusinessTypeCheckBoxWidget(
                          businessTypeName: 'Microbusiness',
                          selected: businessTypeSelected == 7 ? true : false,
                          onTap: () {
                            setState(() {
                              businessTypeSelected = 7;
                            });
                          },
                        ),

                        //Partnership
                        BusinessTypeCheckBoxWidget(
                          businessTypeName: 'Partnership',
                          selected: businessTypeSelected == 6 ? true : false,
                          onTap: () {
                            setState(() {
                              businessTypeSelected = 6;
                            });
                          },
                        ),

                        Container(),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Limited Liability
                        BusinessTypeCheckBoxWidget(
                          businessTypeName: 'Limited Liability',
                          selected: businessTypeSelected == 10 ? true : false,
                          onTap: () {
                            setState(() {
                              businessTypeSelected = 10;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: themeApp.textfieldbordercolor, width: 2),
                  borderRadius: BorderRadius.circular(3)),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //Business Detail
            Text(
              AppString.businessDetail,
              style: AppStyle.purpleBold20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

            //Business Name
            AppTextField(
              title: AppString.businessName,
              controller: businessName,
              autoValidation: autoValidation,
              textInputType: TextInputType.text,
              hintText: AppString.businessName,
              validator: (value) {
                if (value) {
                  return AppConstant.stringValidator(
                      value, AppString.businessName);
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            //Reg Company name
            AppTextField(
              title: AppString.regCompanyName,
              controller: regCompanyName,
              autoValidation: autoValidation,
              textInputType: TextInputType.text,
              hintText: AppString.regCompanyName,
              validator: (value) {
                if (value) {
                  return AppConstant.stringValidator(
                      value, AppString.regCompanyName);
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            //Company Reg No
            AppTextField(
              title: AppString.companyRegNo,
              controller: companyRegNo,
              autoValidation: autoValidation,
              textInputType: TextInputType.number,
              hintText: AppString.companyRegNo,
              validator: (value) {
                if (value) {
                  return AppConstant.stringValidator(
                      value, AppString.companyRegNo);
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            //Charity Reg No
            AppTextField(
              title: AppString.charityRegNo,
              controller: charityRegNo,
              autoValidation: autoValidation,
              textInputType: TextInputType.number,
              hintText: AppString.charityRegNo,
              validator: (value) {
                if (value) {
                  return AppConstant.stringValidator(
                      value, AppString.charityRegNo);
                }
                return null;
              },
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            CheckBoxFieldWidget(
              labelText: AppString.sameBillingAddressForEveryCustomer,
              checkBoxSelected: sameBillingAddressForAllCustomer,
              onTap: togglesameBillingAddressForAll,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

            //Billing Address
            Text(
              AppString.billingAddress,
              style: AppStyle.purpleBold20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

            //Address
            AppTextField(
              title: AppString.address,
              controller: contractBillTown,
              autoValidation: autoValidation,
              textInputType: TextInputType.text,
              hintText: AppString.address,
              validator: (value) {
                if (value) {
                  return AppConstant.stringValidator(
                      value, AppString.regCompanyName);
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            //Town/City
            AppTextField(
              title: AppString.town,
              controller: contractBillTown,
              autoValidation: autoValidation,
              textInputType: TextInputType.text,
              hintText: AppString.town,
              validator: (value) {
                if (value) {
                  return AppConstant.stringValidator(
                      value, AppString.regCompanyName);
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            //Postcode
            AppTextField(
              title: AppString.postCode,
              controller: contractBillPostcode,
              autoValidation: autoValidation,
              textInputType: TextInputType.text,
              hintText: AppString.postCode,
              validator: (value) {
                if (value) {
                  return AppConstant.stringValidator(
                      value, AppString.companyRegNo);
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //Energy Account Manager
            Text(
              AppString.eneryAccManager,
              style: AppStyle.purpleBold20,
            ),
            Text(
              AppString.forDayToDayRunningOfTheAccout,
              style: AppStyle.purpleBold16,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            //EAM Name
            AppTextField(
              title: AppString.name,
              controller: contractEamName,
              autoValidation: autoValidation,
              textInputType: TextInputType.text,
              hintText: AppString.name,
              validator: (value) {
                if (value) {
                  return AppConstant.stringValidator(value, AppString.name);
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            //Email Address
            AppTextField(
              title: AppString.emailAddess,
              controller: contractEamEmail,
              autoValidation: autoValidation,
              textInputType: TextInputType.text,
              hintText: AppString.emailAddess,
              validator: (value) {
                if (value) {
                  return AppConstant.stringValidator(
                      value, AppString.emailAddess);
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            //Phone no
            AppTextField(
              title: AppString.phoneNo,
              controller: contractEamPhone,
              autoValidation: autoValidation,
              textInputType: TextInputType.number,
              hintText: AppString.phoneNo,
              validator: (value) {
                if (value) {
                  return AppConstant.stringValidator(value, AppString.phoneNo);
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            //Mobile No
            AppTextField(
              title: AppString.mobileNo,
              controller: contractEamMobile,
              autoValidation: autoValidation,
              textInputType: TextInputType.number,
              hintText: AppString.mobileNo,
              validator: (value) {
                if (value) {
                  return AppConstant.stringValidator(value, AppString.mobileNo);
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.030,
            ),
            PurpleFlatButton(
              text: AppString.saveAndGenerateContractCaps,
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            PurpleFlatButton(
              text: AppString.saveAndSendCaps,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
