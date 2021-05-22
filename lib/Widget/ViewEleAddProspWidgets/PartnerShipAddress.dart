import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBusinessOwnershipDetailsCredential.dart';
import 'package:pozitive/Core/ViewModel/EleAddProspectViewModels/ele_business_viewmodel.dart';
import 'package:pozitive/Util/PrefBusinessType/ElePrefBusines.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PartnerShipAddresses extends StatefulWidget {
  @override
  _PartnerShipAddressesState createState() => _PartnerShipAddressesState();
}

class _PartnerShipAddressesState extends State<PartnerShipAddresses> {
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
  TextEditingController strTitleQwner2 = TextEditingController();
  TextEditingController strFirstNameowner = TextEditingController();
  TextEditingController strLastNameowner = TextEditingController();
  TextEditingController strDobOwner2 = TextEditingController();
  TextEditingController home_Addressowner = TextEditingController();
  TextEditingController home_Address2owner = TextEditingController();
  TextEditingController strHomeAdressPostCodeowner = TextEditingController();
  TextEditingController strHomeAdressCityowner = TextEditingController();
  TextEditingController strHomeaddressLiveYearowner = TextEditingController();
  TextEditingController strHomeaddressLiveMonthowner = TextEditingController();
  TextEditingController strHomeaddress1owner = TextEditingController();
  TextEditingController strHomeaddress2owner = TextEditingController();
  TextEditingController strHomeaddressCity1owner = TextEditingController();
  TextEditingController strHomeaddressPostCode1owner = TextEditingController();
  TextEditingController strHomeaddressLiveYear1owner = TextEditingController();
  TextEditingController strHomeaddressLiveMonth1owner = TextEditingController();
  TextEditingController strHomeaddress3owner = TextEditingController();
  TextEditingController strHomeaddress4owner = TextEditingController();
  TextEditingController strHomeaddressCity2owner = TextEditingController();
  TextEditingController strHomeaddressPostCode2owner = TextEditingController();
  TextEditingController strHomeaddressPostLiveYear2owner =
      TextEditingController();
  TextEditingController strHomeaddressPostLiveMonth2owner =
      TextEditingController();
  TextEditingController strHomeaddress5owner = TextEditingController();
  TextEditingController strHomeaddress6owner = TextEditingController();
  TextEditingController strHomeaddressCity3owner = TextEditingController();
  TextEditingController strHomeaddressPostCode3owner = TextEditingController();
  TextEditingController strHomeaddressLiveYear3owner = TextEditingController();
  TextEditingController strHomeaddressLivemonth3owner = TextEditingController();
  TextEditingController strHomeaddress7owner = TextEditingController();
  TextEditingController strHomeaddress8owner = TextEditingController();
  TextEditingController strHomeaddressCity4owner = TextEditingController();
  TextEditingController strHomeaddressPostCode4owner = TextEditingController();
  TextEditingController strHomeaddressLiveYear4owner = TextEditingController();
  TextEditingController strHomeaddressLiveMonth4owner = TextEditingController();
  TextEditingController strHomeaddress9owner = TextEditingController();
  TextEditingController strHomeaddress10owner = TextEditingController();
  TextEditingController strHomeaddressCity5owner = TextEditingController();
  TextEditingController strHomeaddressPostCode5owner = TextEditingController();
  TextEditingController strHomeaddressLiveYear5owner = TextEditingController();
  TextEditingController strTitleQwner3 = TextEditingController();
  TextEditingController strFirstNameowner3 = TextEditingController();
  TextEditingController strLastNameowner3 = TextEditingController();
  TextEditingController strstrDobOwner3 = TextEditingController();
  TextEditingController home_Addressowner3 = TextEditingController();
  TextEditingController home_Address2owner3 = TextEditingController();
  TextEditingController strHomeAdressCityowner3 = TextEditingController();
  TextEditingController strHomeAdressPostCodeowner3 = TextEditingController();
  TextEditingController strHomeaddressLiveYearowner3 = TextEditingController();
  TextEditingController strHomeaddressLiveMonthowner3 = TextEditingController();
  TextEditingController strHomeaddress1owner3 = TextEditingController();
  TextEditingController strHomeaddress2owner3 = TextEditingController();
  TextEditingController strHomeaddressCity1owner3 = TextEditingController();
  TextEditingController strHomeaddressPostCode1owner3 = TextEditingController();
  TextEditingController strHomeaddressLiveYear1owner3 = TextEditingController();
  TextEditingController strHomeaddressLiveMonth1owner3 =
      TextEditingController();
  TextEditingController strHomeaddress3owner3 = TextEditingController();
  TextEditingController strHomeaddress4owner3 = TextEditingController();
  TextEditingController strHomeaddressCity2owner3 = TextEditingController();
  TextEditingController strHomeaddressPostCode2owner3 = TextEditingController();
  TextEditingController strHomeaddressPostLiveYear2owner3 =
      TextEditingController();
  TextEditingController strHomeaddressPostLiveMonth2owner3 =
      TextEditingController();
  TextEditingController strHomeaddress5owner3 = TextEditingController();
  TextEditingController strHomeaddress6owner3 = TextEditingController();
  TextEditingController strHomeaddressCity3owner3 = TextEditingController();
  TextEditingController strHomeaddressPostCode3owner3 = TextEditingController();
  TextEditingController strHomeaddressLiveYear3owner3 = TextEditingController();
  TextEditingController strHomeaddressLivemonth3owner3 =
      TextEditingController();
  TextEditingController strHomeaddress7owner3 = TextEditingController();
  TextEditingController strHomeaddress8owner3 = TextEditingController();
  TextEditingController strHomeaddressCity4owner3 = TextEditingController();
  TextEditingController strHomeaddressPostCode4owner3 = TextEditingController();
  TextEditingController strHomeaddressLiveYear4owner3 = TextEditingController();
  TextEditingController strHomeaddressLiveMonth4owner3 =
      TextEditingController();
  TextEditingController strHomeaddress9owner3 = TextEditingController();
  TextEditingController strHomeaddress10owner3 = TextEditingController();
  TextEditingController strHomeaddressCity5owner3 = TextEditingController();
  TextEditingController strHomeaddressPostCode5owner3 = TextEditingController();
  TextEditingController strHomeaddressLiveYear5owner3 = TextEditingController();
  TextEditingController strHomeaddressLiveMonth5owner3 =
      TextEditingController();
  TextEditingController strTitleQwner4 = TextEditingController();
  TextEditingController strFirstNameowner4 = TextEditingController();
  TextEditingController strLastNameowner4 = TextEditingController();
  TextEditingController strstrDobOwner4 = TextEditingController();
  TextEditingController home_Addressowner4 = TextEditingController();
  TextEditingController home_Address2owner4 = TextEditingController();
  TextEditingController strHomeAdressCityowner4 = TextEditingController();
  TextEditingController strHomeAdressPostCodeowner4 = TextEditingController();
  TextEditingController strHomeaddressLiveYearowner4 = TextEditingController();
  TextEditingController strHomeaddressLiveMonthowner4 = TextEditingController();
  TextEditingController strHomeaddress1owner4 = TextEditingController();
  TextEditingController strHomeaddress2owner4 = TextEditingController();
  TextEditingController strHomeaddressCity1owner4 = TextEditingController();
  TextEditingController strHomeaddressPostCode1owner4 = TextEditingController();
  TextEditingController strHomeaddressLiveYear1owner4 = TextEditingController();
  TextEditingController strHomeaddressLiveMonth1owner4 =
      TextEditingController();
  TextEditingController strHomeaddress3owner4 = TextEditingController();
  TextEditingController strHomeaddress4owner4 = TextEditingController();
  TextEditingController strHomeaddressCity2owner4 = TextEditingController();
  TextEditingController strHomeaddressPostCode2owner4 = TextEditingController();
  TextEditingController strHomeaddressPostLiveYear2owner4 =
      TextEditingController();
  TextEditingController strHomeaddressPostLiveMonth2owner4 =
      TextEditingController();
  TextEditingController strHomeaddress5owner4 = TextEditingController();
  TextEditingController strHomeaddress6owner4 = TextEditingController();
  TextEditingController strHomeaddressCity3owner4 = TextEditingController();
  TextEditingController strHomeaddressPostCode3owner4 = TextEditingController();
  TextEditingController strHomeaddressLiveYear3owner4 = TextEditingController();
  TextEditingController strHomeaddressLivemonth3owner4 =
      TextEditingController();
  TextEditingController strHomeaddress7owner4 = TextEditingController();
  TextEditingController strHomeaddress8owner4 = TextEditingController();
  TextEditingController strHomeaddressCity4owner4 = TextEditingController();
  TextEditingController strHomeaddressPostCode4owner4 = TextEditingController();
  TextEditingController strHomeaddressLiveYear4owner4 = TextEditingController();
  TextEditingController strHomeaddressLiveMonth4owner4 =
      TextEditingController();
  TextEditingController strHomeaddress9owner4 = TextEditingController();
  TextEditingController strHomeaddress10owner4 = TextEditingController();
  TextEditingController strHomeaddressCity5owner4 = TextEditingController();
  TextEditingController strHomeaddressPostCode5owner4 = TextEditingController();
  TextEditingController strHomeaddressLiveYear5owner4 = TextEditingController();
  TextEditingController strHomeaddressLiveMonth5owner4 =
      TextEditingController();
  // TextEditingController strTitleQwner5 = TextEditingController();
  // TextEditingController strFirstNameowner5 = TextEditingController();
  // TextEditingController strLastNameowner5 = TextEditingController();
  // TextEditingController strstrDobOwner5 = TextEditingController();
  // TextEditingController home_Addressowner5 = TextEditingController();
  // TextEditingController home_Address2owner5 = TextEditingController();
  // TextEditingController strHomeAdressCityowner5 = TextEditingController();
  // TextEditingController strHomeAdressPostCodeowner5 = TextEditingController();
  // TextEditingController strHomeaddressLiveYearowner5 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonthowner5 = TextEditingController();
  // TextEditingController strHomeaddress1owner5 = TextEditingController();
  // TextEditingController strHomeaddress2owner5 = TextEditingController();
  // TextEditingController strHomeaddressCity1owner5 = TextEditingController();
  // TextEditingController strHomeaddressPostCode1owner5 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear1owner5 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth1owner5 =
  //     TextEditingController();
  // TextEditingController strHomeaddress3owner5 = TextEditingController();
  // TextEditingController strHomeaddress4owner5 = TextEditingController();
  // TextEditingController strHomeaddressCity2owner5 = TextEditingController();
  // TextEditingController strHomeaddressPostCode2owner5 = TextEditingController();
  // TextEditingController strHomeaddressPostLiveYear2owner5 =
  //     TextEditingController();
  // TextEditingController strHomeaddressPostLiveMonth2owner5 =
  //     TextEditingController();
  // TextEditingController strHomeaddress5owner5 = TextEditingController();
  // TextEditingController strHomeaddress6owner5 = TextEditingController();
  // TextEditingController strHomeaddressCity3owner5 = TextEditingController();
  // TextEditingController strHomeaddressPostCode3owner5 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear3owner5 = TextEditingController();
  // TextEditingController strHomeaddressLivemonth3owner5 =
  //     TextEditingController();
  // TextEditingController strHomeaddress7owner5 = TextEditingController();
  // TextEditingController strHomeaddress8owner5 = TextEditingController();
  // TextEditingController strHomeaddressCity4owner5 = TextEditingController();
  // TextEditingController strHomeaddressPostCode4owner5 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear4owner5 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth4owner5 =
  //     TextEditingController();
  // TextEditingController strHomeaddress9owner5 = TextEditingController();
  // TextEditingController strHomeaddress10owner5 = TextEditingController();
  // TextEditingController strHomeaddressCity5owner5 = TextEditingController();
  // TextEditingController strHomeaddressPostCode5owner5 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear5owner5 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth5owner5 =
  //     TextEditingController();
  // TextEditingController strTitleQwner6 = TextEditingController();
  // TextEditingController strFirstNameowner6 = TextEditingController();
  // TextEditingController strLastNameowner6 = TextEditingController();
  // TextEditingController strstrDobOwner6 = TextEditingController();
  // TextEditingController home_Addressowner6 = TextEditingController();
  // TextEditingController home_Address2owner6 = TextEditingController();
  // TextEditingController strHomeAdressCityowner6 = TextEditingController();
  // TextEditingController strHomeAdressPostCodeowner6 = TextEditingController();
  // TextEditingController strHomeaddressLiveYearowner6 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonthowner6 = TextEditingController();
  // TextEditingController strHomeaddress1owner6 = TextEditingController();
  // TextEditingController strHomeaddress2owner6 = TextEditingController();
  // TextEditingController strHomeaddressCity1owner6 = TextEditingController();
  // TextEditingController strHomeaddressPostCode1owner6 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear1owner6 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth1owner6 =
  //     TextEditingController();
  // TextEditingController strHomeaddress3owner6 = TextEditingController();
  // TextEditingController strHomeaddress4owner6 = TextEditingController();
  // TextEditingController strHomeaddressCity2owner6 = TextEditingController();
  // TextEditingController strHomeaddressPostCode2owner6 = TextEditingController();
  // TextEditingController strHomeaddressPostLiveYear2owner6 =
  //     TextEditingController();
  // TextEditingController strHomeaddressPostLiveMonth2owner6 =
  //     TextEditingController();
  // TextEditingController strHomeaddress5owner6 = TextEditingController();
  // TextEditingController strHomeaddress6owner6 = TextEditingController();
  // TextEditingController strHomeaddressCity3owner6 = TextEditingController();
  // TextEditingController strHomeaddressPostCode3owner6 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear3owner6 = TextEditingController();
  // TextEditingController strHomeaddressLivemonth3owner6 =
  //     TextEditingController();
  // TextEditingController strHomeaddress7owner6 = TextEditingController();
  // TextEditingController strHomeaddress8owner6 = TextEditingController();
  // TextEditingController strHomeaddressCity4owner6 = TextEditingController();
  // TextEditingController strHomeaddressPostCode4owner6 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear4owner6 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth4owner6 =
  //     TextEditingController();
  // TextEditingController strHomeaddress9owner6 = TextEditingController();
  // TextEditingController strHomeaddress10owner6 = TextEditingController();
  // TextEditingController strHomeaddressCity5owner6 = TextEditingController();
  // TextEditingController strHomeaddressPostCode5owner6 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear5owner6 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth5owner6 =
  //     TextEditingController();
  // TextEditingController strTitleQwner7 = TextEditingController();
  // TextEditingController strFirstNameowner7 = TextEditingController();
  // TextEditingController strLastNameowner7 = TextEditingController();
  // TextEditingController strstrDobOwner7 = TextEditingController();
  // TextEditingController home_Addressowner7 = TextEditingController();
  // TextEditingController home_Address2owner7 = TextEditingController();
  // TextEditingController strHomeAdressCityowner7 = TextEditingController();
  // TextEditingController strHomeAdressPostCodeowner7 = TextEditingController();
  // TextEditingController strHomeaddressLiveYearowner7 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonthowner7 = TextEditingController();
  // TextEditingController strHomeaddress1owner7 = TextEditingController();
  // TextEditingController strHomeaddress2owner7 = TextEditingController();
  // TextEditingController strHomeaddressCity1owner7 = TextEditingController();
  // TextEditingController strHomeaddressPostCode1owner7 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear1owner7 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth1owner7 =
  //     TextEditingController();
  // TextEditingController strHomeaddress3owner7 = TextEditingController();
  // TextEditingController strHomeaddress4owner7 = TextEditingController();
  // TextEditingController strHomeaddressCity2owner7 = TextEditingController();
  // TextEditingController strHomeaddressPostCode2owner7 = TextEditingController();
  // TextEditingController strHomeaddressPostLiveYear2owner7 =
  //     TextEditingController();
  // TextEditingController strHomeaddressPostLiveMonth2owner7 =
  //     TextEditingController();
  // TextEditingController strHomeaddress5owner7 = TextEditingController();
  // TextEditingController strHomeaddress6owner7 = TextEditingController();
  // TextEditingController strHomeaddressCity3owner7 = TextEditingController();
  // TextEditingController strHomeaddressPostCode3owner7 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear3owner7 = TextEditingController();
  // TextEditingController strHomeaddressLivemonth3owner7 =
  //     TextEditingController();
  // TextEditingController strHomeaddress7owner7 = TextEditingController();
  // TextEditingController strHomeaddress8owner7 = TextEditingController();
  // TextEditingController strHomeaddressCity4owner7 = TextEditingController();
  // TextEditingController strHomeaddressPostCode4owner7 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear4owner7 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth4owner7 =
  //     TextEditingController();
  // TextEditingController strHomeaddress9owner7 = TextEditingController();
  // TextEditingController strHomeaddress10owner7 = TextEditingController();
  // TextEditingController strHomeaddressCity5owner7 = TextEditingController();
  // TextEditingController strHomeaddressPostCode5owner7 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear5owner7 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth5owner7 =
  //     TextEditingController();
  // TextEditingController strTitleQwner8 = TextEditingController();
  // TextEditingController strFirstNameowner8 = TextEditingController();
  // TextEditingController strLastNameowner8 = TextEditingController();
  // TextEditingController strstrDobOwner8 = TextEditingController();
  // TextEditingController home_Addressowner8 = TextEditingController();
  // TextEditingController home_Address2owner8 = TextEditingController();
  // TextEditingController strHomeAdressCityowner8 = TextEditingController();
  // TextEditingController strHomeAdressPostCodeowner8 = TextEditingController();
  // TextEditingController strHomeaddressLiveYearowner8 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonthowner8 = TextEditingController();
  // TextEditingController strHomeaddress1owner8 = TextEditingController();
  // TextEditingController strHomeaddress2owner8 = TextEditingController();
  // TextEditingController strHomeaddressCity1owner8 = TextEditingController();
  // TextEditingController strHomeaddressPostCode1owner8 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear1owner8 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth1owner8 =
  //     TextEditingController();
  // TextEditingController strHomeaddress3owner8 = TextEditingController();
  // TextEditingController strHomeaddress4owner8 = TextEditingController();
  // TextEditingController strHomeaddressCity2owner8 = TextEditingController();
  // TextEditingController strHomeaddressPostCode2owner8 = TextEditingController();
  // TextEditingController strHomeaddressPostLiveYear2owner8 =
  //     TextEditingController();
  // TextEditingController strHomeaddressPostLiveMonth2owner8 =
  //     TextEditingController();
  // TextEditingController strHomeaddress5owner8 = TextEditingController();
  // TextEditingController strHomeaddress6owner8 = TextEditingController();
  // TextEditingController strHomeaddressCity3owner8 = TextEditingController();
  // TextEditingController strHomeaddressPostCode3owner8 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear3owner8 = TextEditingController();
  // TextEditingController strHomeaddressLivemonth3owner8 =
  //     TextEditingController();
  // TextEditingController strHomeaddress7owner8 = TextEditingController();
  // TextEditingController strHomeaddress8owner8 = TextEditingController();
  // TextEditingController strHomeaddressCity4owner8 = TextEditingController();
  // TextEditingController strHomeaddressPostCode4owner8 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear4owner8 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth4owner8 =
  //     TextEditingController();
  // TextEditingController strHomeaddress9owner8 = TextEditingController();
  // TextEditingController strHomeaddress10owner8 = TextEditingController();
  // TextEditingController strHomeaddressCity5owner8 = TextEditingController();
  // TextEditingController strHomeaddressPostCode5owner8 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear5owner8 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth5owner8 =
  //     TextEditingController();
  // TextEditingController strTitleQwner9 = TextEditingController();
  // TextEditingController strFirstNameowner9 = TextEditingController();
  // TextEditingController strLastNameowner9 = TextEditingController();
  // TextEditingController strstrDobOwner9 = TextEditingController();
  // TextEditingController home_Addressowner9 = TextEditingController();
  // TextEditingController home_Address2owner9 = TextEditingController();
  // TextEditingController strHomeAdressCityowner9 = TextEditingController();
  // TextEditingController strHomeAdressPostCodeowner9 = TextEditingController();
  // TextEditingController strHomeaddressLiveYearowner9 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonthowner9 = TextEditingController();
  // TextEditingController strHomeaddress1owner9 = TextEditingController();
  // TextEditingController strHomeaddress2owner9 = TextEditingController();
  // TextEditingController strHomeaddressCity1owner9 = TextEditingController();
  // TextEditingController strHomeaddressPostCode1owner9 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear1owner9 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth1owner9 =
  //     TextEditingController();
  // TextEditingController strHomeaddress3owner9 = TextEditingController();
  // TextEditingController strHomeaddress4owner9 = TextEditingController();
  // TextEditingController strHomeaddressCity2owner9 = TextEditingController();
  // TextEditingController strHomeaddressPostCode2owner9 = TextEditingController();
  // TextEditingController strHomeaddressPostLiveYear2owner9 =
  //     TextEditingController();
  // TextEditingController strHomeaddressPostLiveMonth2owner9 =
  //     TextEditingController();
  // TextEditingController strHomeaddress5owner9 = TextEditingController();
  // TextEditingController strHomeaddress6owner9 = TextEditingController();
  // TextEditingController strHomeaddressCity3owner9 = TextEditingController();
  // TextEditingController strHomeaddressPostCode3owner9 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear3owner9 = TextEditingController();
  // TextEditingController strHomeaddressLivemonth3owner9 =
  //     TextEditingController();
  // TextEditingController strHomeaddress7owner9 = TextEditingController();
  // TextEditingController strHomeaddress8owner9 = TextEditingController();
  // TextEditingController strHomeaddressCity4owner9 = TextEditingController();
  // TextEditingController strHomeaddressPostCode4owner9 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear4owner9 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth4owner9 =
  //     TextEditingController();
  // TextEditingController strHomeaddress9owner9 = TextEditingController();
  // TextEditingController strHomeaddress10owner9 = TextEditingController();
  // TextEditingController strHomeaddressCity5owner9 = TextEditingController();
  // TextEditingController strHomeaddressPostCode5owner9 = TextEditingController();
  // TextEditingController strHomeaddressLiveYear5owner9 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonth5owner9 =
  //     TextEditingController();
  // TextEditingController strTitleQwner10 = TextEditingController();
  // TextEditingController strFirstNameowner10 = TextEditingController();
  // TextEditingController strLastNameowner10 = TextEditingController();
  // TextEditingController strstrDobOwner10 = TextEditingController();
  // TextEditingController home_Addressowner10 = TextEditingController();
  // TextEditingController home_Address2owner10 = TextEditingController();
  // TextEditingController strHomeAdressCityowner10 = TextEditingController();
  // TextEditingController strHomeAdressPostCodeowner10 = TextEditingController();
  // TextEditingController strHomeaddressLiveYearowner10 = TextEditingController();
  // TextEditingController strHomeaddressLiveMonthowner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddress1owner10 = TextEditingController();
  // TextEditingController strHomeaddress2owner10 = TextEditingController();
  // TextEditingController strHomeaddressCity1owner10 = TextEditingController();
  // TextEditingController strHomeaddressPostCode1owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddressLiveYear1owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddressLiveMonth1owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddress3owner10 = TextEditingController();
  // TextEditingController strHomeaddress4owner10 = TextEditingController();
  // TextEditingController strHomeaddressCity2owner10 = TextEditingController();
  // TextEditingController strHomeaddressPostCode2owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddressPostLiveYear2owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddressPostLiveMonth2owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddress5owner10 = TextEditingController();
  // TextEditingController strHomeaddress6owner10 = TextEditingController();
  // TextEditingController strHomeaddressCity3owner10 = TextEditingController();
  // TextEditingController strHomeaddressPostCode3owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddressLiveYear3owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddressLivemonth3owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddress7owner10 = TextEditingController();
  // TextEditingController strHomeaddress8owner10 = TextEditingController();
  // TextEditingController strHomeaddressCity4owner10 = TextEditingController();
  // TextEditingController strHomeaddressPostCode4owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddressLiveYear4owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddressLiveMonth4owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddress9owner10 = TextEditingController();
  // TextEditingController strHomeaddress10owner10 = TextEditingController();
  // TextEditingController strHomeaddressCity5owner10 = TextEditingController();
  // TextEditingController strHomeaddressPostCode5owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddressLiveYear5owner10 =
  //     TextEditingController();
  // TextEditingController strHomeaddressLiveMonth5owner10 =
  //     TextEditingController();

  List nameTitle = ["Mr", "Mrs", "Miss", "Ms", "Sir", "Dr"];

  DateTime selectedDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 21);

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  Future dobSelect1(BuildContext context, String fromfield) async {
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

  Future dobSelect2(BuildContext context, String fromfield) async {
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

        strDobOwner2.text = dateFormat.format(picked);
      } else {
        setState(() {
          print("not picke");
        });
        strDobOwner2.text = dateFormat.format(picked);
      }
    }
  }

  Future dobSelect2ndOwner(BuildContext context, String fromfield) async {
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

        strstrDobOwner3.text = dateFormat.format(picked);
      } else {
        setState(() {
          print("not picke");
        });
        strstrDobOwner3.text = dateFormat.format(picked);
      }
    }
  }

  Future dobSelect4(BuildContext context, String fromfield) async {
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

        strstrDobOwner4.text = dateFormat.format(picked);
      } else {
        setState(() {
          print("not picke");
        });
        strstrDobOwner4.text = dateFormat.format(picked);
      }
    }
  }

  // Future dobSelect5(BuildContext context, String fromfield) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     if (fromfield == "Required") {
  //       setState(() {
  //         print("picked");
  //       });
  //
  //       strstrDobOwner5.text = dateFormat.format(picked);
  //     } else {
  //       setState(() {
  //         print("not picke");
  //       });
  //       strstrDobOwner5.text = dateFormat.format(picked);
  //     }
  //   }
  // }
  //
  // Future dobSelect6(BuildContext context, String fromfield) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     if (fromfield == "Required") {
  //       setState(() {
  //         print("picked");
  //       });
  //
  //       strstrDobOwner6.text = dateFormat.format(picked);
  //     } else {
  //       setState(() {
  //         print("not picke");
  //       });
  //       strstrDobOwner6.text = dateFormat.format(picked);
  //     }
  //   }
  // }
  //
  // Future dobSelect7(BuildContext context, String fromfield) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     if (fromfield == "Required") {
  //       setState(() {
  //         print("picked");
  //       });
  //
  //       strstrDobOwner7.text = dateFormat.format(picked);
  //     } else {
  //       setState(() {
  //         print("not picke");
  //       });
  //       strstrDobOwner7.text = dateFormat.format(picked);
  //     }
  //   }
  // }
  //
  // Future dobSelect8(BuildContext context, String fromfield) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     if (fromfield == "Required") {
  //       setState(() {
  //         print("picked");
  //       });
  //
  //       strstrDobOwner8.text = dateFormat.format(picked);
  //     } else {
  //       setState(() {
  //         print("not picke");
  //       });
  //       strstrDobOwner8.text = dateFormat.format(picked);
  //     }
  //   }
  // }
  //
  // Future dobSelect9(BuildContext context, String fromfield) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     if (fromfield == "Required") {
  //       setState(() {
  //         print("picked");
  //       });
  //
  //       strstrDobOwner9.text = dateFormat.format(picked);
  //     } else {
  //       setState(() {
  //         print("not picke");
  //       });
  //       strstrDobOwner9.text = dateFormat.format(picked);
  //     }
  //   }
  // }
  //
  // Future dobSelect10(BuildContext context, String fromfield) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     if (fromfield == "Required") {
  //       setState(() {
  //         print("picked");
  //       });
  //
  //       strstrDobOwner10.text = dateFormat.format(picked);
  //     } else {
  //       setState(() {
  //         print("not picke");
  //       });
  //       strstrDobOwner10.text = dateFormat.format(picked);
  //     }
  //   }
  // }

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
  int addOwner = 0;
  int addOwnerAddress = 0;

  Widget addOwners() {
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              "Add Owner",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          addOwner = addOwner + 1;
        });
      },
    );
  }

  Widget cancelOwner() {
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              "Remove Owner",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          addOwner = addOwner - 1;
        });
      },
    );
  }

  Widget addHomeAddress() {
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
                color: Colors.green, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(10),
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
                color: Colors.green, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(10),
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
      ],
    );
  }

  bool autovalidation = false;

  ///owners addresses
  Widget getAddressOwner1(int add) {
    if (add == 1) {
      return Column(
        children: [
          addHomeAddress(),
          SizedBox(
            height: 20,
          ),
          ownerAddress(),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }

    if (add == 2) {
      return Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ownerAddress(),
          SizedBox(
            height: 20,
          ),
          addHomeAddress(),
          SizedBox(
            height: 20,
          ),
          ownerFirstAddress()
        ],
      );
    }

    ///default add
    return Column(
      children: [
        addHomeAddress(),
        SizedBox(
          height: 20,
        ),
        ownerAddress(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget getAddressOwner2(int add) {
    if (add == 1) {
      return Column(
        children: [
          addHomeAddress(),
          SizedBox(
            height: 20,
          ),
          secondOwnerAddress(),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }

    if (add == 2) {
      return Column(
        children: [
          SizedBox(
            height: 20,
          ),
          secondOwnerAddress(),
          SizedBox(
            height: 20,
          ),
          addHomeAddress(),
          SizedBox(
            height: 20,
          ),
          secondOwnerFirstAddress()
        ],
      );
    }

    ///default add
    return Column(
      children: [
        addHomeAddress(),
        SizedBox(
          height: 20,
        ),
        secondOwnerAddress(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget getAddressOwner3(int add) {
    if (add == 1) {
      return Column(
        children: [
          addHomeAddress(),
          SizedBox(
            height: 20,
          ),
          thirdOwnerAddress(),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }

    if (add == 2) {
      return Column(
        children: [
          SizedBox(
            height: 20,
          ),
          thirdOwnerAddress(),
          SizedBox(
            height: 20,
          ),
          addHomeAddress(),
          SizedBox(
            height: 20,
          ),
          thirdOwnerFirstAddress()
        ],
      );
    }

    ///default add
    return Column(
      children: [
        addHomeAddress(),
        SizedBox(
          height: 20,
        ),
        thirdOwnerAddress(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  // Widget getAddressOwner4(int add) {
  //   if (add == 1) {
  //     return Column(
  //       children: [
  //         addHomeAddress(),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         thirdOwnerAddress(),
  //         SizedBox(
  //           height: 20,
  //         ),
  //       ],
  //     );}
  //
  //   if (add == 2) {
  //     return Column(
  //       children: [
  //         SizedBox(
  //           height: 20,
  //         ),
  //         thirdOwnerAddress(),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         addHomeAddress(),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         thirdOwnerFirstAddress()
  //       ],
  //     );
  //   }
  //   ///default add
  //   return Column(
  //     children: [
  //       addHomeAddress(),
  //       SizedBox(
  //         height: 20,
  //       ),
  //       thirdOwnerAddress(),
  //       SizedBox(
  //         height: 20,
  //       ),
  //     ],
  //   );
  // }
  // Widget getAddressOwner5(int add) {
  //   if (add == 1) {
  //     return Column(
  //       children: [
  //         addHomeAddress(),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         thirdOwnerAddress(),
  //         SizedBox(
  //           height: 20,
  //         ),
  //       ],
  //     );}
  //
  //   if (add == 2) {
  //     return Column(
  //       children: [
  //         SizedBox(
  //           height: 20,
  //         ),
  //         thirdOwnerAddress(),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         addHomeAddress(),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         thirdOwnerFirstAddress()
  //       ],
  //     );
  //   }
  //   ///default add
  //   return Column(
  //     children: [
  //       addHomeAddress(),
  //       SizedBox(
  //         height: 20,
  //       ),
  //       thirdOwnerAddress(),
  //       SizedBox(
  //         height: 20,
  //       ),
  //     ],
  //   );
  // }

  ///Owners
  Widget getOwnerAddress(int addownerDetails) {
    if (addownerDetails == 0) {
      return Column(
        children: [
          owner1(),
          SizedBox(
            height: 20,
          ),
          owner2(),
          SizedBox(
            height: 20,
          ),
        ],
      );
      /* return Container(child: defaultAddress());*/
    }
    if (addownerDetails == 1) {
      return Column(
        children: [
          owner1(),
          SizedBox(
            height: 20,
          ),
          owner2(),
          SizedBox(
            height: 20,
          ),
          owner3(),
          SizedBox(
            height: 20,
          ),
          //  addOwners(),
        ],
      );
    }
/*
    if (addownerDetails == 2) {
      return Column(
        children: [
          //owner1(),
          SizedBox(
            height: 20,
          ),
          owner2(),
          SizedBox(
            height: 20,
          ),
          owner3(),
          SizedBox(
            height: 20,
          ),
          owner4(),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }
*/
    /* if (addownerDetails == 3) {
      return Column(
        children: [
       //   owner1(),
          SizedBox(
            height: 20,
          ),
          owner2(),
          SizedBox(
            height: 20,
          ),
          owner3(),
          SizedBox(
            height: 20,
          ),
          owner4(),
          SizedBox(
            height: 20,
          ),
          owner5(),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }*/
    // if (addownerDetails == 4) {
    //   return Column(
    //     children: [
    //       //owner1(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner2(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner3(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner4(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner5(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner6(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //     ],
    //   );
    // }
    // if (addownerDetails == 5) {
    //   return Column(
    //     children: [
    //       //owner1(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner2(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner3(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner4(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner5(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner6(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner7(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //     ],
    //   );
    // }
    // if (addownerDetails == 6) {
    //   return Column(
    //     children: [
    //       owner1(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner2(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner3(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner4(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner5(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner6(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner7(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner8(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //     ],
    //   );
    // }
    // if (addownerDetails == 7) {
    //   return Column(
    //     children: [
    //      // owner1(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner2(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner3(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner4(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner5(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner6(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner7(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner8(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner9(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //     ],
    //   );
    // }
    // if (addownerDetails == 8) {
    //   return Column(
    //     children: [
    //       //owner1(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner2(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner3(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner4(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner5(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner6(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner7(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner8(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       owner9(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       /*owner10(),
    //       SizedBox(
    //         height: 20,
    //       ),*/
    //     ],
    //   );
    // }

    return Container(
      child: Column(
        children: [
          //owner1(),
          SizedBox(
            height: 20,
          ),
          owner1(),
        ],
      ),
    );
  }

  void partnershipAddressInitialData() async {
    final data = await EleBusinessTypePref.getPartnerShipBusinessTypeAdd();
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
        strTitleQwner2.text = data.strTitleQwner2;
        strFirstNameowner.text = data.strFirstNameowner;
        strLastNameowner.text = data.strLastNameowner;
        strDobOwner2.text = data.strDobOwner2;
        home_Addressowner.text = data.home_Addressowner;
        home_Address2owner.text = data.home_Address2owner;
        strHomeAdressPostCodeowner.text = data.strHomeAdressPostCodeowner;
        strHomeAdressCityowner.text = data.strHomeAdressCityowner;
        strHomeaddressLiveYearowner.text = data.strHomeaddressLiveYearowner;
        strHomeaddressLiveMonthowner.text = data.strHomeaddressLiveMonthowner;
        strHomeaddress1owner.text = data.strHomeaddress1owner;
        strHomeaddress2owner.text = data.strHomeaddress2owner;
        strHomeaddressCity1owner.text = data.strHomeaddressCity1owner;
        strHomeaddressPostCode1owner.text = data.strHomeaddressPostCode1owner;
        strHomeaddressLiveYear1owner.text = data.strHomeaddressLiveYear1owner;
        strHomeaddressLiveMonth1owner.text = data.strHomeaddressLiveMonth1owner;
        strHomeaddress3owner.text = data.strHomeaddress3owner;
        strHomeaddress4owner.text = data.strHomeaddress4owner;
        strHomeaddressCity2owner.text = data.strHomeaddressCity2owner;
        strHomeaddressPostCode2owner.text = data.strHomeaddressPostCode2owner;
        strHomeaddressPostLiveYear2owner.text =
            data.strHomeaddressPostLiveYear2owner;
        strHomeaddressPostLiveMonth2owner.text =
            data.strHomeaddressPostLiveMonth2owner;
        strHomeaddress5owner.text = data.strHomeaddress5owner;
        strHomeaddress6owner.text = data.strHomeaddress6owner;
        strHomeaddressCity3owner.text = data.strHomeaddressCity3owner;
        strHomeaddressPostCode3owner.text = data.strHomeaddressPostCode3owner;
        strHomeaddressLiveYear3owner.text = data.strHomeaddressLiveYear3owner;
        strHomeaddressLivemonth3owner.text = data.strHomeaddressLivemonth3owner;
        strHomeaddress7owner.text = data.strHomeaddress7owner;
        strHomeaddress8owner.text = data.strHomeaddress8owner;
        strHomeaddressCity4owner.text = data.strHomeaddressCity4owner;
        strHomeaddressPostCode4owner.text = data.strHomeaddressPostCode4owner;
        strHomeaddressLiveYear4owner.text = data.strHomeaddressLiveYear4owner;
        strHomeaddressLiveMonth4owner.text = data.strHomeaddressLiveMonth4owner;
        strHomeaddress9owner.text = data.strHomeaddress9owner;
        strHomeaddress10owner.text = data.strHomeaddress10owner;
        strHomeaddressCity5owner.text = data.strHomeaddressCity5owner;
        strHomeaddressPostCode5owner.text = data.strHomeaddressPostCode5owner;
        strHomeaddressLiveYear5owner.text = data.strHomeaddressLiveYear5owner;
        strHomeaddressLiveMonth5owner.text = data.strHomeaddressLiveMonth5owner;
        strTitleQwner3.text = data.strTitleQwner3;
        strFirstNameowner3.text = data.strFirstNameowner3;
        strLastNameowner3.text = data.strLastNameowner3;
        strstrDobOwner3.text = data.strstrDobOwner3;
        home_Addressowner3.text = data.home_Addressowner3;
        home_Address2owner3.text = data.home_Address2owner3;
        strHomeAdressCityowner3.text = data.strHomeAdressCityowner3;
        strHomeAdressPostCodeowner3.text = data.strHomeAdressPostCodeowner3;
        strHomeaddressLiveYearowner3.text = data.strHomeaddressLiveYearowner3;
        strHomeaddressLiveMonthowner3.text = data.strHomeaddressLiveMonthowner3;
        strHomeaddress1owner3.text = data.strHomeaddress1owner3;
        strHomeaddress2owner3.text = data.strHomeaddress2owner3;
        strHomeaddressCity1owner3.text = data.strHomeaddressCity1owner3;
        strHomeaddressPostCode1owner3.text = data.strHomeaddressPostCode1owner3;
        strHomeaddressLiveYear1owner3.text = data.strHomeaddressLiveYear1owner3;
        strHomeaddressLiveMonth1owner3.text =
            data.strHomeaddressLiveMonth1owner3;
        strHomeaddress3owner3.text = data.strHomeaddress3owner3;
        strHomeaddress4owner3.text = data.strHomeaddress4owner3;
        strHomeaddressCity2owner3.text = data.strHomeaddressCity2owner3;
        strHomeaddressPostCode2owner3.text = data.strHomeaddressPostCode2owner3;
        strHomeaddressPostLiveYear2owner3.text =
            data.strHomeaddressPostLiveYear2owner3;
        strHomeaddressPostLiveMonth2owner3.text =
            data.strHomeaddressPostLiveMonth2owner3;
        strHomeaddress5owner3.text = data.strHomeaddress5owner3;
        strHomeaddress6owner3.text = data.strHomeaddress6owner3;
        strHomeaddressCity3owner3.text = data.strHomeaddressCity3owner3;
        strHomeaddressPostCode3owner3.text = data.strHomeaddressPostCode3owner3;
        strHomeaddressLiveYear3owner3.text = data.strHomeaddressLiveYear3owner3;
        strHomeaddressLivemonth3owner3.text =
            data.strHomeaddressLivemonth3owner3;
        strHomeaddress7owner3.text = data.strHomeaddress7owner3;
        strHomeaddress8owner3.text = data.strHomeaddress8owner3;
        strHomeaddressCity4owner3.text = data.strHomeaddressCity4owner3;
        strHomeaddressPostCode4owner3.text = data.strHomeaddressPostCode4owner3;
        strHomeaddressLiveYear4owner3.text = data.strHomeaddressLiveYear4owner3;
        strHomeaddressLiveMonth4owner3.text =
            data.strHomeaddressLiveMonth4owner3;
        strHomeaddress9owner3.text = data.strHomeaddress9owner3;
        strHomeaddress10owner3.text = data.strHomeaddress10owner3;
        strHomeaddressCity5owner3.text = data.strHomeaddressCity5owner3;
        strHomeaddressPostCode5owner3.text = data.strHomeaddressPostCode5owner3;
        strHomeaddressLiveYear5owner3.text = data.strHomeaddressLiveYear5owner3;
        strHomeaddressLiveMonth5owner3.text =
            data.strHomeaddressLiveMonth5owner3;
        strTitleQwner4.text = data.strTitleQwner4;
        strFirstNameowner4.text = data.strFirstNameowner4;
        strLastNameowner4.text = data.strLastNameowner4;
        strstrDobOwner4.text = data.strstrDobOwner4;
        home_Addressowner4.text = data.home_Addressowner4;
        home_Address2owner4.text = data.home_Address2owner4;
        strHomeAdressCityowner4.text = data.strHomeAdressCityowner4;
        strHomeAdressPostCodeowner4.text = data.strHomeAdressPostCodeowner4;
        strHomeaddressLiveYearowner4.text = data.strHomeaddressLiveYearowner4;
        strHomeaddressLiveMonthowner4.text = data.strHomeaddressLiveMonthowner4;
        strHomeaddress1owner4.text = data.strHomeaddress1owner4;
        strHomeaddress2owner4.text = data.strHomeaddress2owner4;
        strHomeaddressCity1owner4.text = data.strHomeaddressCity1owner4;
        strHomeaddressPostCode1owner4.text = data.strHomeaddressPostCode1owner4;
        strHomeaddressLiveYear1owner4.text = data.strHomeaddressLiveYear1owner4;
        strHomeaddressLiveMonth1owner4.text =
            data.strHomeaddressLiveMonth1owner4;
        strHomeaddress3owner4.text = data.strHomeaddress3owner4;
        strHomeaddress4owner4.text = data.strHomeaddress4owner4;
        strHomeaddressCity2owner4.text = data.strHomeaddressCity2owner4;
        strHomeaddressPostCode2owner4.text = data.strHomeaddressPostCode2owner4;
        strHomeaddressPostLiveYear2owner4.text =
            data.strHomeaddressPostLiveYear2owner4;
        strHomeaddressPostLiveMonth2owner4.text =
            data.strHomeaddressPostLiveMonth2owner4;
        strHomeaddress5owner4.text = data.strHomeaddress5owner4;
        strHomeaddress6owner4.text = data.strHomeaddress6owner4;
        strHomeaddressCity3owner4.text = data.strHomeaddressCity3owner4;
        strHomeaddressPostCode3owner4.text = data.strHomeaddressPostCode3owner4;
        strHomeaddressLiveYear3owner4.text = data.strHomeaddressLiveYear3owner4;
        strHomeaddressLivemonth3owner4.text =
            data.strHomeaddressLivemonth3owner4;
        strHomeaddress7owner4.text = data.strHomeaddress7owner4;
        strHomeaddress8owner4.text = data.strHomeaddress8owner4;
        strHomeaddressCity4owner4.text = data.strHomeaddressCity4owner4;
        strHomeaddressPostCode4owner4.text = data.strHomeaddressPostCode4owner4;
        strHomeaddressLiveYear4owner4.text = data.strHomeaddressLiveYear4owner4;
        strHomeaddressLiveMonth4owner4.text =
            data.strHomeaddressLiveMonth4owner4;
        strHomeaddress9owner4.text = data.strHomeaddress9owner4;
        strHomeaddress10owner4.text = data.strHomeaddress10owner4;
        strHomeaddressCity5owner4.text = data.strHomeaddressCity5owner4;
        strHomeaddressPostCode5owner4.text = data.strHomeaddressPostCode5owner4;
        strHomeaddressLiveYear5owner4.text = data.strHomeaddressLiveYear5owner4;
        strHomeaddressLiveMonth5owner4.text =
            data.strHomeaddressLiveMonth5owner4;
      }
    });
  }

  void partnerShipAddressOnSaveAndNext() {
    setState(() {
      EleBusinessTypePref.setPartnerShipBusinessTypeAdd(
          PartnerShipBusinessCredential(
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
        strTitleQwner2: strTitleQwner2.text,
        strFirstNameowner: strFirstNameowner.text,
        strLastNameowner: strLastNameowner.text,
        strDobOwner2: strDobOwner2.text,
        home_Addressowner: home_Addressowner.text,
        home_Address2owner: home_Address2owner.text,
        strHomeAdressPostCodeowner: strHomeAdressPostCodeowner.text,
        strHomeAdressCityowner: strHomeAdressCityowner.text,
        strHomeaddressLiveYearowner: strHomeaddressLiveYearowner.text,
        strHomeaddressLiveMonthowner: strHomeaddressLiveMonthowner.text,
        strHomeaddress1owner: strHomeaddress1owner.text,
        strHomeaddress2owner: strHomeaddress2owner.text,
        strHomeaddressCity1owner: strHomeaddressCity1owner.text,
        strHomeaddressPostCode1owner: strHomeaddressPostCode1owner.text,
        strHomeaddressLiveYear1owner: strHomeaddressLiveYear1owner.text,
        strHomeaddressLiveMonth1owner: strHomeaddressLiveMonth1owner.text,
        strHomeaddress3owner: strHomeaddress3owner.text,
        strHomeaddress4owner: strHomeaddress4owner.text,
        strHomeaddressCity2owner: strHomeaddressCity2owner.text,
        strHomeaddressPostCode2owner: strHomeaddressPostCode2owner.text,
        strHomeaddressPostLiveYear2owner: strHomeaddressPostLiveYear2owner.text,
        strHomeaddressPostLiveMonth2owner:
            strHomeaddressPostLiveMonth2owner.text,
        strHomeaddress5owner: strHomeaddress5owner.text,
        strHomeaddress6owner: strHomeaddress6owner.text,
        strHomeaddressCity3owner: strHomeaddressCity3owner.text,
        strHomeaddressPostCode3owner: strHomeaddressPostCode3owner.text,
        strHomeaddressLiveYear3owner: strHomeaddressLiveYear3owner.text,
        strHomeaddressLivemonth3owner: strHomeaddressLivemonth3owner.text,
        strHomeaddress7owner: strHomeaddress7owner.text,
        strHomeaddress8owner: strHomeaddress8owner.text,
        strHomeaddressCity4owner: strHomeaddressCity4owner.text,
        strHomeaddressPostCode4owner: strHomeaddressPostCode4owner.text,
        strHomeaddressLiveYear4owner: strHomeaddressLiveYear4owner.text,
        strHomeaddressLiveMonth4owner: strHomeaddressLiveMonth4owner.text,
        strHomeaddress9owner: strHomeaddress9owner.text,
        strHomeaddress10owner: strHomeaddress10owner.text,
        strHomeaddressCity5owner: strHomeaddressCity5owner.text,
        strHomeaddressPostCode5owner: strHomeaddressPostCode5owner.text,
        strHomeaddressLiveYear5owner: strHomeaddressLiveYear5owner.text,
        strHomeaddressLiveMonth5owner: strHomeaddressLiveMonth5owner.text,
        strTitleQwner3: strTitleQwner3.text,
        strFirstNameowner3: strFirstNameowner3.text,
        strLastNameowner3: strLastNameowner3.text,
        strstrDobOwner3: strstrDobOwner3.text,
        home_Addressowner3: home_Addressowner3.text,
        home_Address2owner3: home_Address2owner3.text,
        strHomeAdressCityowner3: strHomeAdressCityowner3.text,
        strHomeAdressPostCodeowner3: strHomeAdressPostCodeowner3.text,
        strHomeaddressLiveYearowner3: strHomeaddressLiveYearowner3.text,
        strHomeaddressLiveMonthowner3: strHomeaddressLiveMonthowner3.text,
        strHomeaddress1owner3: strHomeaddress1owner3.text,
        strHomeaddress2owner3: strHomeaddress2owner3.text,
        strHomeaddressCity1owner3: strHomeaddressCity1owner3.text,
        strHomeaddressPostCode1owner3: strHomeaddressPostCode1owner3.text,
        strHomeaddressLiveYear1owner3: strHomeaddressLiveYear1owner3.text,
        strHomeaddressLiveMonth1owner3: strHomeaddressLiveMonth1owner3.text,
        strHomeaddress3owner3: strHomeaddress3owner3.text,
        strHomeaddress4owner3: strHomeaddress4owner3.text,
        strHomeaddressCity2owner3: strHomeaddressCity2owner3.text,
        strHomeaddressPostCode2owner3: strHomeaddressPostCode2owner3.text,
        strHomeaddressPostLiveYear2owner3:
            strHomeaddressPostLiveYear2owner3.text,
        strHomeaddressPostLiveMonth2owner3:
            strHomeaddressPostLiveMonth2owner3.text,
        strHomeaddress5owner3: strHomeaddress5owner3.text,
        strHomeaddress6owner3: strHomeaddress6owner3.text,
        strHomeaddressCity3owner3: strHomeaddressCity3owner3.text,
        strHomeaddressPostCode3owner3: strHomeaddressPostCode3owner3.text,
        strHomeaddressLiveYear3owner3: strHomeaddressLiveYear3owner3.text,
        strHomeaddressLivemonth3owner3: strHomeaddressLivemonth3owner3.text,
        strHomeaddress7owner3: strHomeaddress7owner3.text,
        strHomeaddress8owner3: strHomeaddress8owner3.text,
        strHomeaddressCity4owner3: strHomeaddressCity4owner3.text,
        strHomeaddressPostCode4owner3: strHomeaddressPostCode4owner3.text,
        strHomeaddressLiveYear4owner3: strHomeaddressLiveYear4owner3.text,
        strHomeaddressLiveMonth4owner3: strHomeaddressLiveMonth4owner3.text,
        strHomeaddress9owner3: strHomeaddress9owner3.text,
        strHomeaddress10owner3: strHomeaddress10owner3.text,
        strHomeaddressCity5owner3: strHomeaddressCity5owner3.text,
        strHomeaddressPostCode5owner3: strHomeaddressPostCode5owner3.text,
        strHomeaddressLiveYear5owner3: strHomeaddressLiveYear5owner3.text,
        strHomeaddressLiveMonth5owner3: strHomeaddressLiveMonth5owner3.text,
        strTitleQwner4: strTitleQwner4.text,
        strFirstNameowner4: strFirstNameowner4.text,
        strLastNameowner4: strLastNameowner4.text,
        strstrDobOwner4: strstrDobOwner4.text,
        home_Addressowner4: home_Addressowner4.text,
        home_Address2owner4: home_Address2owner4.text,
        strHomeAdressCityowner4: strHomeAdressCityowner4.text,
        strHomeAdressPostCodeowner4: strHomeAdressPostCodeowner4.text,
        strHomeaddressLiveYearowner4: strHomeaddressLiveYearowner4.text,
        strHomeaddressLiveMonthowner4: strHomeaddressLiveMonthowner4.text,
        strHomeaddress1owner4: strHomeaddress1owner4.text,
        strHomeaddress2owner4: strHomeaddress2owner4.text,
        strHomeaddressCity1owner4: strHomeaddressCity1owner4.text,
        strHomeaddressPostCode1owner4: strHomeaddressPostCode1owner4.text,
        strHomeaddressLiveYear1owner4: strHomeaddressLiveYear1owner4.text,
        strHomeaddressLiveMonth1owner4: strHomeaddressLiveMonth1owner4.text,
        strHomeaddress3owner4: strHomeaddress3owner4.text,
        strHomeaddress4owner4: strHomeaddress4owner4.text,
        strHomeaddressCity2owner4: strHomeaddressCity2owner4.text,
        strHomeaddressPostCode2owner4: strHomeaddressPostCode2owner4.text,
        strHomeaddressPostLiveYear2owner4:
            strHomeaddressPostLiveYear2owner4.text,
        strHomeaddressPostLiveMonth2owner4:
            strHomeaddressPostLiveMonth2owner4.text,
        strHomeaddress5owner4: strHomeaddress5owner4.text,
        strHomeaddress6owner4: strHomeaddress6owner4.text,
        strHomeaddressCity3owner4: strHomeaddressCity3owner4.text,
        strHomeaddressPostCode3owner4: strHomeaddressPostCode3owner4.text,
        strHomeaddressLiveYear3owner4: strHomeaddressLiveYear3owner4.text,
        strHomeaddressLivemonth3owner4: strHomeaddressLivemonth3owner4.text,
        strHomeaddress7owner4: strHomeaddress7owner4.text,
        strHomeaddress8owner4: strHomeaddress8owner4.text,
        strHomeaddressCity4owner4: strHomeaddressCity4owner4.text,
        strHomeaddressPostCode4owner4: strHomeaddressPostCode4owner4.text,
        strHomeaddressLiveYear4owner4: strHomeaddressLiveYear4owner4.text,
        strHomeaddressLiveMonth4owner4: strHomeaddressLiveMonth4owner4.text,
        strHomeaddress9owner4: strHomeaddress9owner4.text,
        strHomeaddress10owner4: strHomeaddress10owner4.text,
        strHomeaddressCity5owner4: strHomeaddressCity5owner4.text,
        strHomeaddressPostCode5owner4: strHomeaddressPostCode5owner4.text,
        strHomeaddressLiveYear5owner4: strHomeaddressLiveYear5owner4.text,
        strHomeaddressLiveMonth5owner4: strHomeaddressLiveMonth5owner4.text,
      ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    partnershipAddressInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<EleBusAddProspectViewModel>(
            //onModelReady: (model) => model.initialData(),
            builder: (context, model, child) {
            return Container(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.022,
                    ),
                    getOwnerAddress(addOwner),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.062,
                        child: Center(
                          child: Text(
                            "Go to Next",
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
                        //  partnerShipAddressOnSaveAndNext();
                        globals.tabController1.animateTo(7);
                        /*  if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          partnerShipAddressOnSaveAndNext();
                          if (_formKey != null) {
                            globals.tabController1.animateTo(6);
                          }
                        } else {
                          setState(() {
                            autovalidation = true;
                          });
                        }*/
                      },
                    ),
                  ],
                ),
              ),
            );
          })
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

//   Widget owner1() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Text(
//               "Owner1",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .025,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//           ],
//         ),
//         Divider(
//           thickness: 4,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         Text(
//           "Title",
//           style: TextStyle(
//               fontSize: MediaQuery.of(context).size.height * .015,
//               color: Color.fromRGBO(31, 33, 29, 1)),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * .062,
//             child: dropdowntextfield(strTitleQwner1, false, autovalidation,
//                 TextInputType.text, "Select Title", (value) {
//               if (value.isEmpty) {
//                 return 'Please select title';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//             showDialog(
//                 context: context,
//                 child: Dialog(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.03,
//                       ),
//                       Text(
//                         "Select Title",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize:
//                                 MediaQuery.of(context).size.height * 0.03),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 1,
//                         color: Colors.grey.withOpacity(.2),
//                       ),
//                       Container(
//                         child: nameList1(),
//                       )
//                     ],
//                   ),
//                 ));
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'First Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(firstName, false, autovalidation,
//               TextInputType.text, "First name", (value) {
//             if (value.isEmpty) {
//               return 'Please enter first Name';
//             }
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'Last Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: '', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(
//               lastName, false, autovalidation, TextInputType.text, "Last name",
//               (value) {
//             /*  if (value.isEmpty) {
//                                       return 'Please enter electricity night fixed commission';
//                                     }*/
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         RichText(
//           text: TextSpan(
//             text: 'BOD',
//             style: TextStyle(
//                 fontSize: MediaQuery.of(context).size.height * .015,
//                 color: Color.fromRGBO(31, 33, 29, 1)),
//             children: <TextSpan>[
//               TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height * .062,
//             child: datetextfield(strDobOwner1, false, autovalidation,
//                 TextInputType.text, "Select date", (value) {
//               if (value.isEmpty) {
//                 return 'Please Select date';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             dobSelect1(context, "Contract Start Date");
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
// //Home Address
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: theme.innertextfieldbordercolor)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 /*  defaultAddress != null ?  Row(
//                               children: [
//                                 Text(
//                                   "Home Address",
//                                   style: TextStyle(
//                                       fontSize: MediaQuery.of(context).size.height * .025,
//                                       color: Color.fromRGBO(31, 33, 29, 1)),
//                                 ),
//                                 IconButton(icon: Icon(Icons.add),onPressed: (){
//                                   setState(() {
//                                    addAddress = addAddress+1;
//                                   });
//                                 },),
//                                 IconButton(icon: Icon(Icons.delete),onPressed: (){
//
//                                   setState(() {
//                                     addAddress = addAddress-1;
//                                   });
//                                 },)
//                               ],
//                             ):Container(),*/
//                 addAddress != null
//                     ? Container(
//                         child: getAddress(addAddress),
//                       )
//                     : defaultAddress()
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

  Widget owner1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Owner1",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .025,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            // addOwners(),
            // cancelOwner(),
          ],
        ),
        Divider(
          thickness: 3,
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
            height: MediaQuery.of(context).size.height * .062,
            child: dropdowntextfield(strTitleQwner2, false, autovalidation,
                TextInputType.text, "Select Title", (value) {
              /*  if (value.isEmpty) {
                return 'Please select title';
              }*/
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
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Select Title",
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
                        child: titleOwner2(),
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
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .062,
          child: Disableinnertextfield(strFirstNameowner, false, autovalidation,
              false, TextInputType.text, "First name", (value) {
            if (value.isEmpty) {
              return 'Please enter first name';
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
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: '', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .062,
          child: Disableinnertextfield(strLastNameowner, false, autovalidation,
              false, TextInputType.text, "Last name", (value) {
            /*  if (value.isEmpty) {
                                      return 'Please enter electricity night fixed commission';
                                    }*/
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
              TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        InkWell(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .062,
            child: datetextfield(strDobOwner2, false, autovalidation,
                TextInputType.text, "Select date", (value) {
              if (value.isEmpty) {
                return 'Please Select date';
              }
              return null;
            }, context),
          ),
          // onTap: () {
          //   dobSelect2(context, "Contract Start Date");
          // },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.022,
        ),
//Home Address
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: theme.innertextfieldbordercolor)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                addAddress != null
                    ? Container(
                        child: getAddressOwner1(addAddress),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget owner2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Owner2",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .025,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            addOwners(),
            //cancelOwner(),
          ],
        ),
        Divider(
          thickness: 3,
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
            height: MediaQuery.of(context).size.height * .062,
            child: dropdowntextfield(strTitleQwner3, false, autovalidation,
                TextInputType.text, "Select Title", (value) {
              if (value.isEmpty) {
                return 'Please select title';
              }
              return null;
            }, context),
          ),
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
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .062,
          child: Disableinnertextfield(strFirstNameowner3, false,
              autovalidation, false, TextInputType.text, "First name", (value) {
            if (value.isEmpty) {
              return 'Please enter first name';
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
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: '', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .062,
          child: Disableinnertextfield(strLastNameowner3, false, autovalidation,
              false, TextInputType.text, "Last name", (value) {
            /*  if (value.isEmpty) {
                                      return 'Please enter electricity night fixed commission';
                                    }*/
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
              TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        InkWell(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .062,
            child: datetextfield(strstrDobOwner3, false, autovalidation,
                TextInputType.text, "Select date", (value) {
              if (value.isEmpty) {
                return 'Please Select date';
              }
              return null;
            }, context),
          ),
          onTap: () {
            // dobSelect2ndOwner(context, "Contract Start Date");
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.022,
        ),
//Home Address
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: theme.innertextfieldbordercolor)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                addAddress != null
                    ? Container(
                        child: getAddressOwner2(addAddress),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget owner3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Owner3",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .025,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            addOwners(),
            cancelOwner(),
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
            height: MediaQuery.of(context).size.height * .062,
            child: dropdowntextfield(strTitleQwner4, false, autovalidation,
                TextInputType.text, "Select Title", (value) {
              if (value.isEmpty) {
                return 'Please select title';
              }
              return null;
            }, context),
          ),
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
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .062,
          child: Disableinnertextfield(strFirstNameowner4, false,
              autovalidation, false, TextInputType.text, "First name", (value) {
            if (value.isEmpty) {
              return 'Please enter first name';
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
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: '', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .062,
          child: Disableinnertextfield(strLastNameowner4, false, autovalidation,
              false, TextInputType.text, "Last name", (value) {
            /*  if (value.isEmpty) {
                                      return 'Please enter electricity night fixed commission';
                                    }*/
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
              TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        InkWell(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .062,
            child: datetextfield(strstrDobOwner4, false, autovalidation,
                TextInputType.text, "Select date", (value) {
              if (value.isEmpty) {
                return 'Please Select date';
              }
              return null;
            }, context),
          ),
          onTap: () {
            // dobSelect2ndOwner(context, "Contract Start Date");
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.022,
        ),
//Home Address
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: theme.innertextfieldbordercolor)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                addAddress != null
                    ? Container(
                        child: getAddressOwner3(addAddress),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ],
    );
  }

//   Widget owner4() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               "Owner4",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .025,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             addOwners(),
//             cancelOwner(),
//           ],
//         ),
//         Divider(
//           thickness: 3,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         Text(
//           "Title",
//           style: TextStyle(
//               fontSize: MediaQuery.of(context).size.height * .015,
//               color: Color.fromRGBO(31, 33, 29, 1)),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * .062,
//             child: dropdowntextfield(strTitleQwner5, false, autovalidation,
//                 TextInputType.text, "Select Title", (value) {
//               if (value.isEmpty) {
//                 return 'Please select title';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//             showDialog(
//                 context: context,
//                 child: Dialog(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.03,
//                       ),
//                       Text(
//                         "Select Title",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize:
//                                 MediaQuery.of(context).size.height * 0.03),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 1,
//                         color: Colors.grey.withOpacity(.2),
//                       ),
//                       Container(
//                         child: nameList4(),
//                       )
//                     ],
//                   ),
//                 ));
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'First Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(strFirstNameowner5, false, autovalidation,
//               TextInputType.text, "First name", (value) {
//             if (value.isEmpty) {
//               return 'Please enter first name';
//             }
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'Last Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: '', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(strLastNameowner5, false, autovalidation,
//               TextInputType.text, "Last name", (value) {
//             /*  if (value.isEmpty) {
//                                       return 'Please enter electricity night fixed commission';
//                                     }*/
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         RichText(
//           text: TextSpan(
//             text: 'BOD',
//             style: TextStyle(
//                 fontSize: MediaQuery.of(context).size.height * .015,
//                 color: Color.fromRGBO(31, 33, 29, 1)),
//             children: <TextSpan>[
//               TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height * .062,
//             child: datetextfield(strstrDobOwner5, false, autovalidation,
//                 TextInputType.text, "Select date", (value) {
//               if (value.isEmpty) {
//                 return 'Please Select date';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             dobSelect4(context, "Contract Start Date");
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
// //Home Address
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: theme.innertextfieldbordercolor)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 addAddress != null
//                     ? Container(
//                   child: getAddressOwner4(addAddress),
//                 )
//                     : Container()
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget owner5() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               "Owner5",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .025,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             addOwners(),
//             cancelOwner(),
//           ],
//         ),
//         Divider(
//           thickness: 3,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         Text(
//           "Title",
//           style: TextStyle(
//               fontSize: MediaQuery.of(context).size.height * .015,
//               color: Color.fromRGBO(31, 33, 29, 1)),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * .062,
//             child: dropdowntextfield(strTitleQwner6, false, autovalidation,
//                 TextInputType.text, "Select Title", (value) {
//               if (value.isEmpty) {
//                 return 'Please select title';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//             showDialog(
//                 context: context,
//                 child: Dialog(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.03,
//                       ),
//                       Text(
//                         "Select Title",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize:
//                                 MediaQuery.of(context).size.height * 0.03),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 1,
//                         color: Colors.grey.withOpacity(.2),
//                       ),
//                       Container(
//                         child: nameList5(),
//                       )
//                     ],
//                   ),
//                 ));
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'First Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(strFirstNameowner6, false, autovalidation,
//               TextInputType.text, "First name", (value) {
//             if (value.isEmpty) {
//               return 'Please enter first name';
//             }
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'Last Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: '', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(strLastNameowner6, false, autovalidation,
//               TextInputType.text, "Last name", (value) {
//             /*  if (value.isEmpty) {
//                                       return 'Please enter electricity night fixed commission';
//                                     }*/
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         RichText(
//           text: TextSpan(
//             text: 'BOD',
//             style: TextStyle(
//                 fontSize: MediaQuery.of(context).size.height * .015,
//                 color: Color.fromRGBO(31, 33, 29, 1)),
//             children: <TextSpan>[
//               TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height * .062,
//             child: datetextfield(strstrDobOwner6, false, autovalidation,
//                 TextInputType.text, "Select date", (value) {
//               if (value.isEmpty) {
//                 return 'Please Select date';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             dobSelect5(context, "Contract Start Date");
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
// //Home Address
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: theme.innertextfieldbordercolor)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 addAddress != null
//                     ? Container(
//                         child: getAddressOwner5(addAddress),
//                       )
//                     : Container()
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
  ///Owner6 to 9
//   Widget owner6() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               "Owner6",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .025,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             addOwners(),
//             cancelOwner(),
//           ],
//         ),
//         Divider(
//           thickness: 3,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         Text(
//           "Title",
//           style: TextStyle(
//               fontSize: MediaQuery.of(context).size.height * .015,
//               color: Color.fromRGBO(31, 33, 29, 1)),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * .062,
//             child: dropdowntextfield(strTitleQwner7, false, autovalidation,
//                 TextInputType.text, "Select Title", (value) {
//               if (value.isEmpty) {
//                 return 'Please select title';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//             showDialog(
//                 context: context,
//                 child: Dialog(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.03,
//                       ),
//                       Text(
//                         "Select Title",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize:
//                                 MediaQuery.of(context).size.height * 0.03),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 1,
//                         color: Colors.grey.withOpacity(.2),
//                       ),
//                       Container(
//                         child: nameList6(),
//                       )
//                     ],
//                   ),
//                 ));
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'First Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(strFirstNameowner7, false, autovalidation,
//               TextInputType.text, "First name", (value) {
//             if (value.isEmpty) {
//               return 'Please enter first name';
//             }
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'Last Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: '', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(strLastNameowner7, false, autovalidation,
//               TextInputType.text, "Last name", (value) {
//             /*  if (value.isEmpty) {
//                                       return 'Please enter electricity night fixed commission';
//                                     }*/
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         RichText(
//           text: TextSpan(
//             text: 'BOD',
//             style: TextStyle(
//                 fontSize: MediaQuery.of(context).size.height * .015,
//                 color: Color.fromRGBO(31, 33, 29, 1)),
//             children: <TextSpan>[
//               TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height * .062,
//             child: datetextfield(strstrDobOwner7, false, autovalidation,
//                 TextInputType.text, "Select date", (value) {
//               if (value.isEmpty) {
//                 return 'Please Select date';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             dobSelect6(context, "Contract Start Date");
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
// //Home Address
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: theme.innertextfieldbordercolor)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 addAddress != null
//                     ? Container(
//                         child: getAddress(addAddress),
//                       )
//                     : Container()
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget owner7() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               "Owner7",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .025,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             addOwners(),
//             cancelOwner(),
//           ],
//         ),
//         Divider(
//           thickness: 3,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         Text(
//           "Title",
//           style: TextStyle(
//               fontSize: MediaQuery.of(context).size.height * .015,
//               color: Color.fromRGBO(31, 33, 29, 1)),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * .062,
//             child: dropdowntextfield(strTitleQwner8, false, autovalidation,
//                 TextInputType.text, "Select Title", (value) {
//               if (value.isEmpty) {
//                 return 'Please select title';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//             showDialog(
//                 context: context,
//                 child: Dialog(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.03,
//                       ),
//                       Text(
//                         "Select Title",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize:
//                                 MediaQuery.of(context).size.height * 0.03),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 1,
//                         color: Colors.grey.withOpacity(.2),
//                       ),
//                       Container(
//                         child: nameList7(),
//                       )
//                     ],
//                   ),
//                 ));
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'First Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(strFirstNameowner8, false, autovalidation,
//               TextInputType.text, "First name", (value) {
//             if (value.isEmpty) {
//               return 'Please enter first name';
//             }
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'Last Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: '', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(strLastNameowner8, false, autovalidation,
//               TextInputType.text, "Last name", (value) {
//             /*  if (value.isEmpty) {
//                                       return 'Please enter electricity night fixed commission';
//                                     }*/
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         RichText(
//           text: TextSpan(
//             text: 'BOD',
//             style: TextStyle(
//                 fontSize: MediaQuery.of(context).size.height * .015,
//                 color: Color.fromRGBO(31, 33, 29, 1)),
//             children: <TextSpan>[
//               TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height * .062,
//             child: datetextfield(strstrDobOwner8, false, autovalidation,
//                 TextInputType.text, "Select date", (value) {
//               if (value.isEmpty) {
//                 return 'Please Select date';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             dobSelect7(context, "Contract Start Date");
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
// //Home Address
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: theme.innertextfieldbordercolor)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 addAddress != null
//                     ? Container(
//                   child: getAddress(addAddress),
//                 )
//                     : Container()
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget owner8() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               "Owner8",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .025,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             addOwners(),
//             cancelOwner(),
//           ],
//         ),
//         Divider(
//           thickness: 3,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         Text(
//           "Title",
//           style: TextStyle(
//               fontSize: MediaQuery.of(context).size.height * .015,
//               color: Color.fromRGBO(31, 33, 29, 1)),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * .062,
//             child: dropdowntextfield(strTitleQwner9, false, autovalidation,
//                 TextInputType.text, "Select Title", (value) {
//               if (value.isEmpty) {
//                 return 'Please select title';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//             showDialog(
//                 context: context,
//                 child: Dialog(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.03,
//                       ),
//                       Text(
//                         "Select Title",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize:
//                                 MediaQuery.of(context).size.height * 0.03),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 1,
//                         color: Colors.grey.withOpacity(.2),
//                       ),
//                       Container(
//                         child: nameList8(),
//                       )
//                     ],
//                   ),
//                 ));
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'First Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(strFirstNameowner9, false, autovalidation,
//               TextInputType.text, "First name", (value) {
//             if (value.isEmpty) {
//               return 'Please enter first name';
//             }
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'Last Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: '', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(strLastNameowner9, false, autovalidation,
//               TextInputType.text, "Last name", (value) {
//             /*  if (value.isEmpty) {
//                                       return 'Please enter electricity night fixed commission';
//                                     }*/
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         RichText(
//           text: TextSpan(
//             text: 'BOD',
//             style: TextStyle(
//                 fontSize: MediaQuery.of(context).size.height * .015,
//                 color: Color.fromRGBO(31, 33, 29, 1)),
//             children: <TextSpan>[
//               TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height * .062,
//             child: datetextfield(strstrDobOwner9, false, autovalidation,
//                 TextInputType.text, "Select date", (value) {
//               if (value.isEmpty) {
//                 return 'Please Select date';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             dobSelect8(context, "Contract Start Date");
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
// //Home Address
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: theme.innertextfieldbordercolor)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 addAddress != null
//                     ? Container(
//                   child: getAddress(addAddress),
//                 )
//                     : Container()
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget owner9() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               "Owner9",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .025,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             addOwners(),
//             cancelOwner(),
//           ],
//         ),
//         Divider(
//           thickness: 3,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         Text(
//           "Title",
//           style: TextStyle(
//               fontSize: MediaQuery.of(context).size.height * .015,
//               color: Color.fromRGBO(31, 33, 29, 1)),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * .062,
//             child: dropdowntextfield(strTitleQwner10, false, autovalidation,
//                 TextInputType.text, "Select Title", (value) {
//               if (value.isEmpty) {
//                 return 'Please select title';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//             showDialog(
//                 context: context,
//                 child: Dialog(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.03,
//                       ),
//                       Text(
//                         "Select Title",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize:
//                                 MediaQuery.of(context).size.height * 0.03),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 1,
//                         color: Colors.grey.withOpacity(.2),
//                       ),
//                       Container(
//                         child: nameList9(),
//                       )
//                     ],
//                   ),
//                 ));
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'First Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(strFirstNameowner10, false, autovalidation,
//               TextInputType.text, "First name", (value) {
//             if (value.isEmpty) {
//               return 'Please enter first name';
//             }
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             RichText(
//               text: TextSpan(
//                 text: 'Last Name',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: '', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .062,
//           child: innertextfield(strLastNameowner10, false, autovalidation,
//               TextInputType.text, "Last name", (value) {
//             /*  if (value.isEmpty) {
//                                       return 'Please enter electricity night fixed commission';
//                                     }*/
//             return null;
//           }, context),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
//         RichText(
//           text: TextSpan(
//             text: 'BOD',
//             style: TextStyle(
//                 fontSize: MediaQuery.of(context).size.height * .015,
//                 color: Color.fromRGBO(31, 33, 29, 1)),
//             children: <TextSpan>[
//               TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height * .062,
//             child: datetextfield(strstrDobOwner10, false, autovalidation,
//                 TextInputType.text, "Select date", (value) {
//               if (value.isEmpty) {
//                 return 'Please Select date';
//               }
//               return null;
//             }, context),
//           ),
//           onTap: () {
//             dobSelect9(context, "Contract Start Date");
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.022,
//         ),
// //Home Address
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: theme.innertextfieldbordercolor)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 addAddress != null
//                     ? Container(
//                   child: getAddress(addAddress),
//                 )
//                     : Container()
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
  ///1st owner
  Widget ownerAddress() {
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
              child: DisableinnerLongtextfield(
                  5,
                  home_Addressowner,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home Address 1", (value) {
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
              child: Disableinnertextfield(
                  strHomeAdressCityowner,
                  false,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home City", (value) {
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
              child: DisableinnerLongtextfield(
                  5,
                  home_Address2owner,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home Address 2", (value) {
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
              height: MediaQuery.of(context).size.height * .062,
              child: Disableinnertextfield(
                  strHomeAdressPostCodeowner,
                  false,
                  autovalidation,
                  false,
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
                        strHomeaddressLiveYear1owner,
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
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveMonth1owner,
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

  Widget ownerFirstAddress() {
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
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: DisableinnerLongtextfield(
                  5,
                  strHomeaddress1owner,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home Address 1", (value) {
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
              child: Disableinnertextfield(
                  strHomeaddressCity1owner,
                  false,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home City", (value) {
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
              child: DisableinnerLongtextfield(
                  5,
                  strHomeaddress2owner,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home Address 2", (value) {
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
              height: MediaQuery.of(context).size.height * .062,
              child: Disableinnertextfield(
                  strHomeaddressPostCode1owner,
                  false,
                  autovalidation,
                  false,
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
                        strHomeaddressPostLiveYear2owner,
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
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressPostLiveMonth2owner,
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

  ///2nd owner
  Widget secondOwnerAddress() {
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
              child: DisableinnerLongtextfield(
                  5,
                  home_Addressowner3,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home Address 1", (value) {
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
              child: Disableinnertextfield(
                  strHomeAdressCityowner3,
                  false,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home City", (value) {
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
              child: DisableinnerLongtextfield(
                  5,
                  home_Address2owner3,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home Address 2", (value) {
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
              height: MediaQuery.of(context).size.height * .062,
              child: Disableinnertextfield(
                  strHomeAdressPostCodeowner3,
                  false,
                  autovalidation,
                  false,
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
                        strHomeaddressLiveYearowner3,
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
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveMonthowner3,
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

  Widget secondOwnerFirstAddress() {
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
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: DisableinnerLongtextfield(
                  5,
                  strHomeaddress1owner3,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home Address 1", (value) {
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
              child: Disableinnertextfield(
                  strHomeaddressCity1owner3,
                  false,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home City", (value) {
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
              child: DisableinnerLongtextfield(
                  5,
                  strHomeaddress2owner3,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home Address 2", (value) {
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
              height: MediaQuery.of(context).size.height * .062,
              child: Disableinnertextfield(
                  strHomeaddressPostCode1owner3,
                  false,
                  autovalidation,
                  false,
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
                        strHomeaddressLiveYear1owner3,
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
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveMonth1owner3,
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

  ///3rd owner
  Widget thirdOwnerAddress() {
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
              child: DisableinnerLongtextfield(
                  5,
                  home_Addressowner4,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home Address 1", (value) {
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
              child: Disableinnertextfield(
                  strHomeAdressCityowner4,
                  false,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home City", (value) {
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
              child: DisableinnerLongtextfield(
                  5,
                  home_Address2owner4,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home Address 2", (value) {
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
              height: MediaQuery.of(context).size.height * .062,
              child: Disableinnertextfield(
                  strHomeAdressPostCodeowner4,
                  false,
                  autovalidation,
                  false,
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
                        strHomeaddressLiveYearowner4,
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
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveMonthowner4,
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

  Widget thirdOwnerFirstAddress() {
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
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: DisableinnerLongtextfield(
                  5,
                  strHomeaddress1owner4,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home Address 1", (value) {
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
              child: Disableinnertextfield(
                  strHomeaddressCity1owner4,
                  false,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home City", (value) {
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
              child: DisableinnerLongtextfield(
                  5,
                  strHomeaddress2owner4,
                  autovalidation,
                  false,
                  TextInputType.text,
                  "Home Address 2", (value) {
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
              height: MediaQuery.of(context).size.height * .062,
              child: Disableinnertextfield(
                  strHomeaddressPostCode1owner4,
                  false,
                  autovalidation,
                  false,
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
                        strHomeaddressLiveYear1owner4,
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
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .40,
                    //  height: MediaQuery.of(context).size.height * .062,
                    child: dropdowntextfield(
                        strHomeaddressLiveMonth1owner4,
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

  Widget titleListOwner1() {
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
              // onTap: () {
              //   setState(() {
              //     strTitleQwner1.text = nameTitle[index];
              //   });
              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  Widget titleOwner2() {
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
              // onTap: () {
              //   setState(() {
              //     strTitleQwner2.text = nameTitle[index];
              //   });
              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  Widget titleList3rdOwner() {
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
              // onTap: () {
              //   setState(() {
              //     strTitleQwner3.text = nameTitle[index];
              //   });
              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  Widget nameList4() {
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
              // onTap: () {
              //   setState(() {
              //     strTitleQwner4.text = nameTitle[index];
              //   });
              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  // Widget nameList5() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: nameTitle.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               nameTitle[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strTitleQwner5.text = nameTitle[index];
  //               });
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget nameList6() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: nameTitle.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               nameTitle[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strTitleQwner6.text = nameTitle[index];
  //               });
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget nameList7() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: nameTitle.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               nameTitle[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strTitleQwner7.text = nameTitle[index];
  //               });
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget nameList8() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: nameTitle.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               nameTitle[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strTitleQwner8.text = nameTitle[index];
  //               });
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget nameList9() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: nameTitle.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               nameTitle[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strTitleQwner9.text = nameTitle[index];
  //               });
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget nameList10() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: nameTitle.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               nameTitle[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strTitleQwner10.text = nameTitle[index];
  //               });
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }

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
              // onTap: () {
              //   setState(() {
              //     strHomeaddressLiveYearowner.text = year[index];
              //   });

              //   Navigator.pop(context);
              // },
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
              // onTap: () {
              //   setState(() {
              //     strHomeaddressLiveMonthowner.text = month[index];
              //   });

              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  Widget yearListOwner1address1() {
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
              // onTap: () {
              //   setState(() {
              //     strHomeaddressLiveYear1owner.text = year[index];
              //   });

              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  Widget monthListOwner1address1() {
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
              // onTap: () {
              //   setState(() {
              //     strHomeaddressLiveMonth1owner.text = month[index];
              //   });

              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  Widget yearListOwner1Address2() {
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
              // onTap: () {
              //   setState(() {
              //     strHomeaddressPostLiveYear2owner.text = year[index];
              //   });

              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  Widget monthListOwner1Address2() {
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
              // onTap: () {
              //   setState(() {
              //     strHomeaddressPostLiveMonth2owner.text = month[index];
              //   });

              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  Widget yearListOwner2address1() {
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
              // onTap: () {
              //   setState(() {
              //     strHomeaddressLiveYearowner3.text = year[index];
              //   });

              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  Widget monthListOwner2Address1() {
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
              // onTap: () {
              //   setState(() {
              //     strHomeaddressLiveMonthowner3.text = month[index];
              //   });

              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  Widget yearListOwner2Address2() {
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
              // onTap: () {
              //   setState(() {
              //     strHomeaddressLiveYearowner4.text = year[index];
              //   });

              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  Widget monthListOwner2Address2() {
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
              // onTap: () {
              //   setState(() {
              //     strHomeaddressLiveMonthowner4.text = month[index];
              //   });

              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  Widget yearListOwner3address2() {
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
              // onTap: () {
              //   setState(() {
              //     strHomeaddressLiveYear1owner4.text = year[index];
              //   });

              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  Widget monthListOwner3Address2() {
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
              // onTap: () {
              //   setState(() {
              //     strHomeaddressLiveMonth1owner4.text = month[index];
              //   });

              //   Navigator.pop(context);
              // },
            ),
          );
        });
  }

  // Widget yearList6() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: year.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               year[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strHomeaddressLiveYear1owner6.text = year[index];
  //               });
  //
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget monthList6() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: month.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               month[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strHomeaddressLiveMonth1owner6.text = month[index];
  //               });
  //
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget yearList7() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: year.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               year[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strHomeaddressLiveYear1owner7.text = year[index];
  //               });
  //
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget monthList7() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: month.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               month[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strHomeaddressLiveMonth1owner7.text = month[index];
  //               });
  //
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget yearList8() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: year.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               year[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strHomeaddressLiveYear1owner8.text = year[index];
  //               });
  //
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget monthList8() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: month.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               month[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strHomeaddressLiveMonth1owner8.text = month[index];
  //               });
  //
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget yearList9() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: year.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               year[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strHomeaddressLiveYear1owner9.text = year[index];
  //               });
  //
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget monthList9() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: month.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               month[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strHomeaddressLiveMonth1owner9.text = month[index];
  //               });
  //
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget yearList10() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: year.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               year[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strHomeaddressLiveYear1owner10.text = year[index];
  //               });
  //
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
  //
  // Widget monthList10() {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: month.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           child: ListTile(
  //             title: Text(
  //               month[index],
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             onTap: () {
  //               setState(() {
  //                 strHomeaddressLiveMonth1owner10.text = month[index];
  //               });
  //
  //               Navigator.pop(context);
  //             },
  //           ),
  //         );
  //       });
  // }
}

///1st other addresses
//   Widget firstAddress() {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Home Address1",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .022,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Address 1',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress1, autovalidation,
//                   TextInputType.text, "Home Address 1", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter Home Address 1';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'City',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(strHomeaddressCity1, false, autovalidation,
//                   TextInputType.text, "Home City", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter City';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             Text(
//               "Address 2",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .015,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress2, autovalidation,
//                   TextInputType.text, "Home Address 2", (value) {
//                     /*if (value.isEmpty) {
//                               return 'Please enter Site Address 2';
//                             }*/
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'PostCode',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(
//                   strHomeaddressPostCode1,
//                   false,
//                   autovalidation,
//                   TextInputType.text,
//                   "Billing Post Code", (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter PostCode';
//                 }
//                 return null;
//               }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Time at address',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //   height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLiveYear1,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select Year", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select Year';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Year--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: yearList1(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //  height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLiveMonth1,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select month", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select month';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Month--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: monthList1(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget secondAddress() {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Home Address2",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .022,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Address 1',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress3, autovalidation,
//                   TextInputType.text, "Home Address 1", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter Home Address 1';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'City',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(strHomeaddressCity2, false, autovalidation,
//                   TextInputType.text, "Home City 2", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter City 2';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             Text(
//               "Address 2",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .015,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress4, autovalidation,
//                   TextInputType.text, "Home Address 2", (value) {
//                     /*if (value.isEmpty) {
//                               return 'Please enter Site Address 2';
//                             }*/
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'PostCode',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(
//                   strHomeaddressPostCode2,
//                   false,
//                   autovalidation,
//                   TextInputType.text,
//                   "Home Post Code 3", (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter PostCode 3';
//                 }
//                 return null;
//               }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Time at address',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //   height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressPostLiveYear2,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select Year", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select Year';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Year--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: yearList3(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //  height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressPostLiveMonth2,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select month", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select month';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Month--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: monthList3(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget thirdAddress() {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Home Address2",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .022,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Address 1',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress5, autovalidation,
//                   TextInputType.text, "Home Address 1", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter Home Address 1';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'City',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(strHomeaddressCity3, false, autovalidation,
//                   TextInputType.text, "Home City 1", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter City 1';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             Text(
//               "Address 2",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .015,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress6, autovalidation,
//                   TextInputType.text, "Home Address 2", (value) {
//                     /*if (value.isEmpty) {
//                               return 'Please enter Site Address 2';
//                             }*/
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'PostCode',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(
//                   strHomeaddressPostCode3,
//                   false,
//                   autovalidation,
//                   TextInputType.text,
//                   "Home Post Code 2", (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter PostCode 2';
//                 }
//                 return null;
//               }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Time at address',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //   height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLiveYear3,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select Year", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select Year';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Year--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: yearList2(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //  height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLiveYear3,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select month", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select month';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Month--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: monthList2(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget forthAddress() {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Home Address4",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .022,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Address 4',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress7, autovalidation,
//                   TextInputType.text, "Home Address 1", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter Home Address 1';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'City',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(strHomeaddressCity4, false, autovalidation,
//                   TextInputType.text, "Home City 4", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter City 4';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             Text(
//               "Address 2",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .015,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress8, autovalidation,
//                   TextInputType.text, "Home Address 2", (value) {
//                     /*if (value.isEmpty) {
//                               return 'Please enter Site Address 2';
//                             }*/
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'PostCode',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(
//                   strHomeaddressPostCode4,
//                   false,
//                   autovalidation,
//                   TextInputType.text,
//                   "Home Post Code 4", (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter PostCode 4';
//                 }
//                 return null;
//               }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Time at address',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //   height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLiveYear4,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select Year", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select Year';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Year--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: yearList4(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //  height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLiveMonth4,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select month", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select month';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Month--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: monthList4(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget fifthAddress() {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Home Address5",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .022,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Address 5',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress9, autovalidation,
//                   TextInputType.text, "Home Address 1", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter Home Address 1';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'City',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(strHomeaddressCity5, false, autovalidation,
//                   TextInputType.text, "Home City 5", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter City 5';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             Text(
//               "Address 2",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .015,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress10, autovalidation,
//                   TextInputType.text, "Home Address 2", (value) {
//                     /*if (value.isEmpty) {
//                               return 'Please enter Site Address 2';
//                             }*/
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'PostCode',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(
//                   strHomeaddressPostCode5,
//                   false,
//                   autovalidation,
//                   TextInputType.text,
//                   "Home Post Code 3", (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter PostCode 3';
//                 }
//                 return null;
//               }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Time at address',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //   height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLiveYear5,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select Year", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select Year';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Year--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: yearList5(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //  height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLiveMonth5owner,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select month", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select month';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Month--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: monthList5(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget sixthAddress() {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Home Address6",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .022,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Address 1',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress3, autovalidation,
//                   TextInputType.text, "Home Address 1", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter Home Address 1';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'City',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(strHomeaddressCity3, false, autovalidation,
//                   TextInputType.text, "Home City 1", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter City 1';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             Text(
//               "Address 2",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .015,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(
//                   5,
//                   strHomeaddress2owner5,
//                   autovalidation,
//                   TextInputType.text,
//                   "Home Address 2", (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter Site Address 2';
//                 }
//
//                 return null;
//               }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'PostCode',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(
//                   strHomeaddressPostCode2owner5,
//                   false,
//                   autovalidation,
//                   TextInputType.text,
//                   "Home Post Code 3", (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter PostCode 3';
//                 }
//                 return null;
//               }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Time at address',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //   height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressPostLiveYear2owner5,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select Year", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select Year';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Year--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: yearList6(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //  height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressPostLiveMonth2owner5,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select month", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select month';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Month--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: monthList6(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget ownerSecondAddress() {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Home Address3",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .022,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Address 1',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress3owner, autovalidation,
//                   TextInputType.text, "Home Address 1", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter Home Address 1';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'City',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(strHomeaddressCity2owner, false, autovalidation,
//                   TextInputType.text, "Home City", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter City';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             Text(
//               "Address 2",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .015,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress4owner, autovalidation,
//                   TextInputType.text, "Home Address 2", (value) {
//                     /*if (value.isEmpty) {
//                               return 'Please enter Site Address 2';
//                             }*/
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'PostCode',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(
//                   strHomeaddressPostCode2owner,
//                   false,
//                   autovalidation,
//                   TextInputType.text,
//                   "Billing Post Code", (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter PostCode';
//                 }
//                 return null;
//               }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Time at address',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //   height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressPostLiveYear2owner,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select Year", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select Year';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Year--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: yearList2(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //  height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressPostLiveMonth2owner,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select month", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select month';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Month--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: monthList2(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget ownerThirdAddress() {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Home Address3",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .022,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Address 1',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress5owner, autovalidation,
//                   TextInputType.text, "Home Address 1", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter Home Address 1';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'City',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(strHomeaddressCity3owner, false, autovalidation,
//                   TextInputType.text, "Home City", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter City';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             Text(
//               "Address 2",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .015,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress6owner, autovalidation,
//                   TextInputType.text, "Home Address 2", (value) {
//                     /*if (value.isEmpty) {
//                               return 'Please enter Site Address 2';
//                             }*/
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'PostCode',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(
//                   strHomeaddressPostCode3owner,
//                   false,
//                   autovalidation,
//                   TextInputType.text,
//                   "Billing Post Code", (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter PostCode';
//                 }
//                 return null;
//               }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Time at address',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //   height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLiveYear3owner,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select Year", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select Year';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Year--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: yearList3(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //  height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLivemonth3owner,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select month", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select month';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Month--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: monthList3(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget ownerForthAddress() {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Home Address4",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .022,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Address 1',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress7owner, autovalidation,
//                   TextInputType.text, "Home Address 1", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter Home Address 1';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'City',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(strHomeaddressCity4owner, false, autovalidation,
//                   TextInputType.text, "Home City", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter City';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             Text(
//               "Address 2",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .015,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress8owner, autovalidation,
//                   TextInputType.text, "Home Address 2", (value) {
//                     /*if (value.isEmpty) {
//                               return 'Please enter Site Address 2';
//                             }*/
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'PostCode',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(
//                   strHomeaddressPostCode4owner,
//                   false,
//                   autovalidation,
//                   TextInputType.text,
//                   "Billing Post Code", (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter PostCode';
//                 }
//                 return null;
//               }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Time at address',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //   height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLiveYear4owner,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select Year", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select Year';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Year--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: yearList4(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //  height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLiveMonth4owner,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select month", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select month';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Month--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: monthList4(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget ownerFifthAddress() {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Home Address5",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .022,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Address 1',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress9owner, autovalidation,
//                   TextInputType.text, "Home Address 1", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter Home Address 1';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'City',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(strHomeaddressCity5owner, false, autovalidation,
//                   TextInputType.text, "Home City", (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter City';
//                     }
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             Text(
//               "Address 2",
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * .015,
//                   color: Color.fromRGBO(31, 33, 29, 1)),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
// //              height: MediaQuery.of(context).size.height*.062,
//               child: innerLongtextfield(5, strHomeaddress10owner, autovalidation,
//                   TextInputType.text, "Home Address 2", (value) {
//                     /*if (value.isEmpty) {
//                               return 'Please enter Site Address 2';
//                             }*/
//                     return null;
//                   }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'PostCode',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * .062,
//               child: innertextfield(
//                   strHomeaddressPostCode5owner,
//                   false,
//                   autovalidation,
//                   TextInputType.text,
//                   "Billing Post Code", (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter PostCode';
//                 }
//                 return null;
//               }, context),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.022,
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'Time at address',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.height * .015,
//                     color: Color.fromRGBO(31, 33, 29, 1)),
//                 children: <TextSpan>[
//                   TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //   height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLiveYear5owner,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select Year", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select Year';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Year--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: yearList5(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//                 InkWell(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .40,
//                     //  height: MediaQuery.of(context).size.height * .062,
//                     child: dropdowntextfield(
//                         strHomeaddressLiveMonth5owner,
//                         false,
//                         autovalidation,
//                         TextInputType.text,
//                         "Select month", (value) {
//                       if (value.isEmpty) {
//                         return 'Please Select month';
//                       }
//                       return null;
//                     }, context),
//                   ),
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showDialog(
//                         context: context,
//                         child: Dialog(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.03,
//                               ),
//                               Text(
//                                 "--Month--",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize:
//                                     MediaQuery.of(context).size.height *
//                                         0.03),
//                               ),
//                               SizedBox(
//                                 height:
//                                 MediaQuery.of(context).size.height * 0.02,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 1,
//                                 color: Colors.grey.withOpacity(.2),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   child: monthList5(),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ));
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// Widget getOwnerByAddress(int ownerId){
//     if(ownerId == 1){
//       ownerAddress();
//       ownerFirstAddress();
//       /*ownerSecondAddress();
//       ownerThirdAddress();
//       ownerForthAddress();
//       ownerFifthAddress();*/
//     }
//     if(ownerId == 2){
//       ownerAddress();
//       ownerFirstAddress();
//       /*ownerSecondAddress();
//       ownerThirdAddress();
//       ownerForthAddress();
//       ownerFifthAddress();*/
//     }
//
// }
