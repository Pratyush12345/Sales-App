import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/view_group_details_viewmodel.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/get_group_volume_data_credentials.dart';
import 'package:pozitive/Core/Model/get_group_volume_data_model.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_price_electricity_gas_model.dart';

GetIt getIt = GetIt.instance;

class ViewPriceElectricityGasViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  bool autovalidation = false;
  TextEditingController elecCommonUnit = TextEditingController();
  TextEditingController elecCommonSc = TextEditingController();
  TextEditingController elecAffiliateUnit = TextEditingController();
  TextEditingController elecAffiliateSc = TextEditingController();
  TextEditingController gasCommonUnit = TextEditingController();
  TextEditingController gasCommonSc = TextEditingController();
  TextEditingController gasAffiliateUnit = TextEditingController();
  TextEditingController gasAffiliateSc = TextEditingController();
  GetGroupVolumeDataModel getGroupVolumeDataModel;
  List<LstGroupVolumeData> lstVolumeGroupData = [];

  void initializeData({BuildContext context, String groupId}) async {
    setState(ViewState.BUSY);
    if (groupId != null) {
      await onApiCall(context: context, groupId: groupId);
    }
    // final data = await Prefs.getGroupQuotationGasElectricityDetails();
    // if (data != null) {
    //   elecCommonUnit.text = data.elecCommonUnit ?? '0';
    //   elecCommonSc.text = data.elecCommonSc ?? '0';
    //   elecAffiliateUnit.text = data.elecAffiliateUnit ?? '0';
    //   elecAffiliateSc.text = data.elecAffiliateSc ?? '0';
    //   gasCommonUnit.text = data.gasCommonUnit ?? '0';
    //   gasCommonSc.text = data.gasCommonSc ?? '0';
    //   gasAffiliateUnit.text = data.gasAffiliateUnit ?? '0';
    //   gasAffiliateSc.text = data.gasAffiliateSc ?? '0';
    //
    // }

    setState(ViewState.IDLE);
    setState(ViewState.IDLE);
  }

  Future<void> onApiCall({BuildContext context, String groupId}) async {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();

    if (groupId != null) {
      getGroupVolumeDataModel = await database.getGroupVolumeData(
        GetGroupVolumeDataCredentials(
          accountId: _user.accountId,
          groupId: groupId,
          type: 'group',
        ),
      );
    }
    if (getGroupVolumeDataModel.status == '1') {
      lstVolumeGroupData.clear();

      lstVolumeGroupData = getGroupVolumeDataModel.data.lstGroupVolumeData;
    }

    setState(ViewState.IDLE);
  }

  void onSaveAndNext() async {
    setState(ViewState.BUSY);
    //

   if(oneYear != null){
     for(int i=0;i<oneYear.length;i++){
       oneYear[i].requiredUpliftDay =  elecCommonUnit.text;
       oneYear[i].requiredUpliftNight =  elecCommonUnit.text;
       oneYear[i].requiredUpliftEWE =  elecCommonUnit.text;
       oneYear[i].requiredUpliftSc =  elecCommonSc.text;

       oneYear[i].requiredUpliftDayGas =  gasCommonUnit.text;
       oneYear[i].requiredUpliftScGas =  gasCommonSc.text;

       if(gasCommonUnit.text != ""){
         if (double.parse(gasCommonUnit.text) >= 0 &&
             double.parse(gasCommonUnit.text) <= 1.5) {
           oneYear[i].upliftPreminumDayGas = "0";
         }

       }

      if(gasCommonSc.text != "")
        {
          if (double.parse(gasCommonSc.text) == 0) {
            oneYear[i].upliftPreminumScGas = "0";
          } else if (double.parse(gasCommonSc.text) > 0 &&
              double.parse(gasCommonSc.text) <= 10) {
            oneYear[i].upliftPreminumScGas= "1";
          } else if (double.parse(gasCommonSc.text) > 10 &&
              double.parse(gasCommonSc.text) <= 20) {
            oneYear[i].upliftPreminumScGas = "2";
          } else if (double.parse(gasCommonSc.text) > 20 &&
              double.parse(gasCommonSc.text) <= 30) {
            oneYear[i].upliftPreminumScGas= "3";
          } else if (double.parse(gasCommonSc.text) > 30 &&
              double.parse(gasCommonSc.text) <= 40) {
            oneYear[i].upliftPreminumScGas = "4";
          } else {
            oneYear[i].upliftPreminumScGas= "5";
          }

        }
       if(elecCommonUnit.text != "") {
         if (double.parse(elecCommonUnit.text) >= 0 &&
             double.parse(elecCommonUnit.text) <= 1.5) {
           oneYear[i].upliftPreminumDay = "0";
         } else if (double.parse(elecCommonUnit.text) > 1.5 &&
             double.parse(elecCommonUnit.text) <= 2) {
           oneYear[i].upliftPreminumDay  = "0.1";
         } else if (double.parse(elecCommonUnit.text) > 2 &&
             double.parse(elecCommonUnit.text) <= 2.5) {
           oneYear[i].upliftPreminumDay  = "0.2";
         } else {
           oneYear[i].upliftPreminumDay  = "0.3";
         }

         if (double.parse(elecCommonUnit.text) >= 0 &&
             double.parse(elecCommonUnit.text) <= 1.5) {
           oneYear[i].upliftPreminumNight  = "0";
         } else if (double.parse(elecCommonUnit.text) > 1.5 &&
             double.parse(elecCommonUnit.text) <= 2) {
           oneYear[i].upliftPreminumNight= "0.1";
         } else if (double.parse(elecCommonUnit.text) > 2 &&
             double.parse(elecCommonUnit.text) <= 2.5) {
           oneYear[i].upliftPreminumNight = "0.2";
         } else {
           oneYear[i].upliftPreminumNight= "0.3";
         }

         if (double.parse(elecCommonUnit.text) >= 0 &&
             double.parse(elecCommonUnit.text) <= 1.5) {
           oneYear[i].upliftPreminumEWE = "0";
         } else if (double.parse(elecCommonUnit.text) > 1.5 &&
             double.parse(elecCommonUnit.text) <= 2) {
           oneYear[i].upliftPreminumEWE= "0.1";
         } else if (double.parse(elecCommonUnit.text) > 2 &&
             double.parse(elecCommonUnit.text) <= 2.5) {
           oneYear[i].upliftPreminumEWE = "0.2";
         } else {
           oneYear[i].upliftPreminumEWE= "0.3";
         }
       }


      if(elecCommonSc.text != ""){
        if (double.parse(elecCommonSc.text) == 0) {
          oneYear[i].upliftPreminumSc = "0";
        } else if (double.parse(elecCommonSc.text) > 0 &&
            double.parse(elecCommonSc.text) <= 10) {
          oneYear[i].upliftPreminumSc= "1";
        } else if (double.parse(elecCommonSc.text) > 10 &&
            double.parse(elecCommonSc.text) <= 20) {
          oneYear[i].upliftPreminumSc = "2";
        } else if (double.parse(elecCommonSc.text) > 20 &&
            double.parse(elecCommonSc.text) <= 30) {
          oneYear[i].upliftPreminumSc= "3";
        } else if (double.parse(elecCommonSc.text) > 30 &&
            double.parse(elecCommonSc.text) <= 40) {
          oneYear[i].upliftPreminumSc = "4";
        } else {
          oneYear[i].upliftPreminumSc= "5";
        }
      }


     }
   }
    if(twoYear != null){
      for(int i=0;i<twoYear.length;i++){
        twoYear[i].requiredUpliftDay =  elecCommonUnit.text;
        twoYear[i].requiredUpliftNight =  elecCommonUnit.text;
        twoYear[i].requiredUpliftEWE =  elecCommonUnit.text;
        twoYear[i].requiredUpliftSc =  elecCommonSc.text;

        twoYear[i].requiredUpliftDayGas =  gasCommonUnit.text;
        twoYear[i].requiredUpliftScGas =  gasCommonSc.text;

        if(gasCommonUnit.text != ""){
          if (double.parse(gasCommonUnit.text) >= 0 &&
              double.parse(gasCommonUnit.text) <= 1.5) {
            twoYear[i].upliftPreminumDayGas = "0";
          }

        }
        if(gasCommonSc.text != ""){
          if (double.parse(gasCommonSc.text) == 0) {
            twoYear[i].upliftPreminumScGas = "0";
          } else if (double.parse(gasCommonSc.text) > 0 &&
              double.parse(gasCommonSc.text) <= 10) {
            twoYear[i].upliftPreminumScGas= "1";
          } else if (double.parse(gasCommonSc.text) > 10 &&
              double.parse(gasCommonSc.text) <= 20) {
            twoYear[i].upliftPreminumScGas = "2";
          } else if (double.parse(gasCommonSc.text) > 20 &&
              double.parse(gasCommonSc.text) <= 30) {
            twoYear[i].upliftPreminumScGas= "3";
          } else if (double.parse(gasCommonSc.text) > 30 &&
              double.parse(gasCommonSc.text) <= 40) {
            twoYear[i].upliftPreminumScGas = "4";
          } else {
            twoYear[i].upliftPreminumScGas= "5";
          }
        }



        if(elecCommonUnit.text != ""){
          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            twoYear[i].upliftPreminumDay = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            twoYear[i].upliftPreminumDay  = "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            twoYear[i].upliftPreminumDay  = "0.2";
          } else {
            twoYear[i].upliftPreminumDay  = "0.3";
          }

          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            twoYear[i].upliftPreminumNight  = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            twoYear[i].upliftPreminumNight= "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            twoYear[i].upliftPreminumNight = "0.2";
          } else {
            twoYear[i].upliftPreminumNight= "0.3";
          }

          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            oneYear[i].upliftPreminumEWE = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            oneYear[i].upliftPreminumEWE= "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            oneYear[i].upliftPreminumEWE = "0.2";
          } else {
            oneYear[i].upliftPreminumEWE= "0.3";
          }
        }
        if(elecCommonSc.text != ""){

          if (double.parse(elecCommonSc.text) == 0) {
            twoYear[i].upliftPreminumSc = "0";
          } else if (double.parse(elecCommonSc.text) > 0 &&
              double.parse(elecCommonSc.text) <= 10) {
            twoYear[i].upliftPreminumSc= "1";
          } else if (double.parse(elecCommonSc.text) > 10 &&
              double.parse(elecCommonSc.text) <= 20) {
            twoYear[i].upliftPreminumSc = "2";
          } else if (double.parse(elecCommonSc.text) > 20 &&
              double.parse(elecCommonSc.text) <= 30) {
            twoYear[i].upliftPreminumSc= "3";
          } else if (double.parse(elecCommonSc.text) > 30 &&
              double.parse(elecCommonSc.text) <= 40) {
            twoYear[i].upliftPreminumSc = "4";
          } else {
            twoYear[i].upliftPreminumSc= "5";
          }
        }



      }
    }
    if(threeYear != null){
      for(int i=0;i<threeYear.length;i++){
        threeYear[i].requiredUpliftDay =  elecCommonUnit.text;
        threeYear[i].requiredUpliftNight =  elecCommonUnit.text;
        threeYear[i].requiredUpliftEWE =  elecCommonUnit.text;
        threeYear[i].requiredUpliftSc =  elecCommonSc.text;

        threeYear[i].requiredUpliftDayGas =  gasCommonUnit.text;
        threeYear[i].requiredUpliftScGas =  gasCommonSc.text;

        if(gasCommonUnit.text != ""){
          if (double.parse(gasCommonUnit.text) >= 0 &&
              double.parse(gasCommonUnit.text) <= 1.5) {
            threeYear[i].upliftPreminumDayGas = "0";
          }
        }
        if(gasCommonSc.text != ""){

          if (double.parse(gasCommonSc.text) == 0) {
            threeYear[i].upliftPreminumScGas = "0";
          } else if (double.parse(gasCommonSc.text) > 0 &&
              double.parse(gasCommonSc.text) <= 10) {
            threeYear[i].upliftPreminumScGas= "1";
          } else if (double.parse(gasCommonSc.text) > 10 &&
              double.parse(gasCommonSc.text) <= 20) {
            threeYear[i].upliftPreminumScGas = "2";
          } else if (double.parse(gasCommonSc.text) > 20 &&
              double.parse(gasCommonSc.text) <= 30) {
            threeYear[i].upliftPreminumScGas= "3";
          } else if (double.parse(gasCommonSc.text) > 30 &&
              double.parse(gasCommonSc.text) <= 40) {
            threeYear[i].upliftPreminumScGas = "4";
          } else {
            threeYear[i].upliftPreminumScGas= "5";
          }
        }



        if(elecCommonUnit.text != ""){
          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            threeYear[i].upliftPreminumDay = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            threeYear[i].upliftPreminumDay  = "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            threeYear[i].upliftPreminumDay  = "0.2";
          } else {
            threeYear[i].upliftPreminumDay  = "0.3";
          }

          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            threeYear[i].upliftPreminumNight  = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            threeYear[i].upliftPreminumNight= "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            threeYear[i].upliftPreminumNight = "0.2";
          } else {
            threeYear[i].upliftPreminumNight= "0.3";
          }

          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            threeYear[i].upliftPreminumEWE = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            threeYear[i].upliftPreminumEWE= "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            threeYear[i].upliftPreminumEWE = "0.2";
          } else {
            threeYear[i].upliftPreminumEWE= "0.3";
          }
        }
        if(elecCommonSc.text != ""){

          if (double.parse(elecCommonSc.text) == 0) {
            threeYear[i].upliftPreminumSc = "0";
          } else if (double.parse(elecCommonSc.text) > 0 &&
              double.parse(elecCommonSc.text) <= 10) {
            threeYear[i].upliftPreminumSc= "1";
          } else if (double.parse(elecCommonSc.text) > 10 &&
              double.parse(elecCommonSc.text) <= 20) {
            threeYear[i].upliftPreminumSc = "2";
          } else if (double.parse(elecCommonSc.text) > 20 &&
              double.parse(elecCommonSc.text) <= 30) {
            threeYear[i].upliftPreminumSc= "3";
          } else if (double.parse(elecCommonSc.text) > 30 &&
              double.parse(elecCommonSc.text) <= 40) {
            threeYear[i].upliftPreminumSc = "4";
          } else {
            threeYear[i].upliftPreminumSc= "5";
          }
        }




      }
    }
    if(fourYear != null){
      for(int i=0;i<fourYear.length;i++){
        fourYear[i].requiredUpliftDay =  elecCommonUnit.text;
        fourYear[i].requiredUpliftNight =  elecCommonUnit.text;
        fourYear[i].requiredUpliftEWE =  elecCommonUnit.text;
        fourYear[i].requiredUpliftSc =  elecCommonSc.text;

        fourYear[i].requiredUpliftDayGas =  gasCommonUnit.text;
        fourYear[i].requiredUpliftScGas =  gasCommonSc.text;

        if(gasCommonUnit.text != ""){
          if (double.parse(gasCommonUnit.text) >= 0 &&
              double.parse(gasCommonUnit.text) <= 1.5) {
            fourYear[i].upliftPreminumDayGas = "0";
          }
        }

        if(gasCommonSc.text != ""){
          if (double.parse(gasCommonSc.text) == 0) {
            fourYear[i].upliftPreminumScGas = "0";
          } else if (double.parse(gasCommonSc.text) > 0 &&
              double.parse(gasCommonSc.text) <= 10) {
            fourYear[i].upliftPreminumScGas= "1";
          } else if (double.parse(gasCommonSc.text) > 10 &&
              double.parse(gasCommonSc.text) <= 20) {
            fourYear[i].upliftPreminumScGas = "2";
          } else if (double.parse(gasCommonSc.text) > 20 &&
              double.parse(gasCommonSc.text) <= 30) {
            fourYear[i].upliftPreminumScGas= "3";
          } else if (double.parse(gasCommonSc.text) > 30 &&
              double.parse(gasCommonSc.text) <= 40) {
            fourYear[i].upliftPreminumScGas = "4";
          } else {
            fourYear[i].upliftPreminumScGas= "5";
          }


        }





        if(elecCommonUnit.text != ""){
          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            fourYear[i].upliftPreminumDay = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            fourYear[i].upliftPreminumDay  = "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            fourYear[i].upliftPreminumDay  = "0.2";
          } else {
            fourYear[i].upliftPreminumDay  = "0.3";
          }

          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            fourYear[i].upliftPreminumNight  = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            fourYear[i].upliftPreminumNight= "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            fourYear[i].upliftPreminumNight = "0.2";
          } else {
            fourYear[i].upliftPreminumNight= "0.3";
          }

          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            fourYear[i].upliftPreminumEWE = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            fourYear[i].upliftPreminumEWE= "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            fourYear[i].upliftPreminumEWE = "0.2";
          } else {
            fourYear[i].upliftPreminumEWE= "0.3";
          }
        }

        if(elecCommonSc.text != ""){
          if (double.parse(elecCommonSc.text) == 0) {
            fourYear[i].upliftPreminumSc = "0";
          } else if (double.parse(elecCommonSc.text) > 0 &&
              double.parse(elecCommonSc.text) <= 10) {
            fourYear[i].upliftPreminumSc= "1";
          } else if (double.parse(elecCommonSc.text) > 10 &&
              double.parse(elecCommonSc.text) <= 20) {
            fourYear[i].upliftPreminumSc = "2";
          } else if (double.parse(elecCommonSc.text) > 20 &&
              double.parse(elecCommonSc.text) <= 30) {
            fourYear[i].upliftPreminumSc= "3";
          } else if (double.parse(elecCommonSc.text) > 30 &&
              double.parse(elecCommonSc.text) <= 40) {
            fourYear[i].upliftPreminumSc = "4";
          } else {
            fourYear[i].upliftPreminumSc= "5";
          }
        }





      }
    }

    if(fiveYear != null){
      for(int i=0;i<fiveYear.length;i++){
        fiveYear[i].requiredUpliftDay =  elecCommonUnit.text;
        fiveYear[i].requiredUpliftNight =  elecCommonUnit.text;
        fiveYear[i].requiredUpliftEWE =  elecCommonUnit.text;
        fiveYear[i].requiredUpliftSc =  elecCommonSc.text;

        fiveYear[i].requiredUpliftDayGas =  gasCommonUnit.text;
        fiveYear[i].requiredUpliftScGas =  gasCommonSc.text;

        if(gasCommonUnit.text != ""){
          if (double.parse(gasCommonUnit.text) >= 0 &&
              double.parse(gasCommonUnit.text) <= 1.5) {
            fiveYear[i].upliftPreminumDayGas = "0";
          }
        }

        if(gasCommonSc.text != ""){
          if (double.parse(gasCommonSc.text) == 0) {
            fiveYear[i].upliftPreminumScGas = "0";
          } else if (double.parse(gasCommonSc.text) > 0 &&
              double.parse(gasCommonSc.text) <= 10) {
            fiveYear[i].upliftPreminumScGas= "1";
          } else if (double.parse(gasCommonSc.text) > 10 &&
              double.parse(gasCommonSc.text) <= 20) {
            fiveYear[i].upliftPreminumScGas = "2";
          } else if (double.parse(gasCommonSc.text) > 20 &&
              double.parse(gasCommonSc.text) <= 30) {
            fiveYear[i].upliftPreminumScGas= "3";
          } else if (double.parse(gasCommonSc.text) > 30 &&
              double.parse(gasCommonSc.text) <= 40) {
            fiveYear[i].upliftPreminumScGas = "4";
          } else {
            fiveYear[i].upliftPreminumScGas= "5";
          }


        }





        if(elecCommonUnit.text != ""){
          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            fiveYear[i].upliftPreminumDay = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            fiveYear[i].upliftPreminumDay  = "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            fiveYear[i].upliftPreminumDay  = "0.2";
          } else {
            fiveYear[i].upliftPreminumDay  = "0.3";
          }

          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            fiveYear[i].upliftPreminumNight  = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            fiveYear[i].upliftPreminumNight= "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            fiveYear[i].upliftPreminumNight = "0.2";
          } else {
            fiveYear[i].upliftPreminumNight= "0.3";
          }

          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            fiveYear[i].upliftPreminumEWE = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            fiveYear[i].upliftPreminumEWE= "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            fiveYear[i].upliftPreminumEWE = "0.2";
          } else {
            fiveYear[i].upliftPreminumEWE= "0.3";
          }
        }

        if(elecCommonSc.text != ""){
          if (double.parse(elecCommonSc.text) == 0) {
            fiveYear[i].upliftPreminumSc = "0";
          } else if (double.parse(elecCommonSc.text) > 0 &&
              double.parse(elecCommonSc.text) <= 10) {
            fiveYear[i].upliftPreminumSc= "1";
          } else if (double.parse(elecCommonSc.text) > 10 &&
              double.parse(elecCommonSc.text) <= 20) {
            fiveYear[i].upliftPreminumSc = "2";
          } else if (double.parse(elecCommonSc.text) > 20 &&
              double.parse(elecCommonSc.text) <= 30) {
            fiveYear[i].upliftPreminumSc= "3";
          } else if (double.parse(elecCommonSc.text) > 30 &&
              double.parse(elecCommonSc.text) <= 40) {
            fiveYear[i].upliftPreminumSc = "4";
          } else {
            fiveYear[i].upliftPreminumSc= "5";
          }
        }





      }
    }

    if(otherYear != null){
      for(int i=0;i<otherYear.length;i++){
        otherYear[i].requiredUpliftDay =  elecCommonUnit.text;
        otherYear[i].requiredUpliftNight =  elecCommonUnit.text;
        otherYear[i].requiredUpliftEWE =  elecCommonUnit.text;
        otherYear[i].requiredUpliftSc =  elecCommonSc.text;

        otherYear[i].requiredUpliftDayGas =  gasCommonUnit.text;
        otherYear[i].requiredUpliftScGas =  gasCommonSc.text;

        if(gasCommonUnit.text != ""){
          if (double.parse(gasCommonUnit.text) >= 0 &&
              double.parse(gasCommonUnit.text) <= 1.5) {
            otherYear[i].upliftPreminumDayGas = "0";
          }
        }

        if(gasCommonSc.text != ""){
          if (double.parse(gasCommonSc.text) == 0) {
            otherYear[i].upliftPreminumScGas = "0";
          } else if (double.parse(gasCommonSc.text) > 0 &&
              double.parse(gasCommonSc.text) <= 10) {
            otherYear[i].upliftPreminumScGas= "1";
          } else if (double.parse(gasCommonSc.text) > 10 &&
              double.parse(gasCommonSc.text) <= 20) {
            otherYear[i].upliftPreminumScGas = "2";
          } else if (double.parse(gasCommonSc.text) > 20 &&
              double.parse(gasCommonSc.text) <= 30) {
            otherYear[i].upliftPreminumScGas= "3";
          } else if (double.parse(gasCommonSc.text) > 30 &&
              double.parse(gasCommonSc.text) <= 40) {
            otherYear[i].upliftPreminumScGas = "4";
          } else {
            otherYear[i].upliftPreminumScGas= "5";
          }


        }





        if(elecCommonUnit.text != ""){
          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            otherYear[i].upliftPreminumDay = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            otherYear[i].upliftPreminumDay  = "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            otherYear[i].upliftPreminumDay  = "0.2";
          } else {
            otherYear[i].upliftPreminumDay  = "0.3";
          }

          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            otherYear[i].upliftPreminumNight  = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            otherYear[i].upliftPreminumNight= "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            otherYear[i].upliftPreminumNight = "0.2";
          } else {
            otherYear[i].upliftPreminumNight= "0.3";
          }

          if (double.parse(elecCommonUnit.text) >= 0 &&
              double.parse(elecCommonUnit.text) <= 1.5) {
            otherYear[i].upliftPreminumEWE = "0";
          } else if (double.parse(elecCommonUnit.text) > 1.5 &&
              double.parse(elecCommonUnit.text) <= 2) {
            otherYear[i].upliftPreminumEWE= "0.1";
          } else if (double.parse(elecCommonUnit.text) > 2 &&
              double.parse(elecCommonUnit.text) <= 2.5) {
            otherYear[i].upliftPreminumEWE = "0.2";
          } else {
            otherYear[i].upliftPreminumEWE= "0.3";
          }
        }

        if(elecCommonSc.text != ""){
          if (double.parse(elecCommonSc.text) == 0) {
            otherYear[i].upliftPreminumSc = "0";
          } else if (double.parse(elecCommonSc.text) > 0 &&
              double.parse(elecCommonSc.text) <= 10) {
            otherYear[i].upliftPreminumSc= "1";
          } else if (double.parse(elecCommonSc.text) > 10 &&
              double.parse(elecCommonSc.text) <= 20) {
            otherYear[i].upliftPreminumSc = "2";
          } else if (double.parse(elecCommonSc.text) > 20 &&
              double.parse(elecCommonSc.text) <= 30) {
            otherYear[i].upliftPreminumSc= "3";
          } else if (double.parse(elecCommonSc.text) > 30 &&
              double.parse(elecCommonSc.text) <= 40) {
            otherYear[i].upliftPreminumSc = "4";
          } else {
            otherYear[i].upliftPreminumSc= "5";
          }
        }





      }
    }
    for(int i=0;i<oneYear.length;i++){
      print(oneYear[i].requiredUpliftDay);
    }
    Prefs.setGroupQuotationGasElectricityDetails(GroupQuotationPriceElectricityGasModel(
        elecCommonUnit: elecCommonUnit.text ?? '0',
        elecCommonSc: elecCommonSc.text ?? '0',
        elecAffiliateUnit: elecAffiliateUnit.text ?? '0',
        elecAffiliateSc: elecAffiliateSc.text ?? '0',
        gasCommonUnit: gasCommonUnit.text ?? '0',
        gasCommonSc: gasCommonSc.text ?? '0',
        gasAffiliateUnit: gasAffiliateUnit.text ?? '0',
        gasAffiliateSc: gasAffiliateSc.text ?? '0',
        getGroupVolumeDataModel: getGroupVolumeDataModel,));
    setState(ViewState.IDLE);
  }
}
