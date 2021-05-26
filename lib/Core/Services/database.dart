import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/apiPath.dart';

import 'package:pozitive/Core/Model/Api/Download-Contract-Credential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/ElectricityAddProspectFullCredential.dart';
import 'package:pozitive/Core/Model/Api/ExportTenderPriceCredential.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/GasInsertAddProspectCredential.dart';
import 'package:pozitive/Core/Model/Api/GetDailyCommissionCredential.dart';
import 'package:pozitive/Core/Model/Api/Group-Quotation/TemplateGroupQuoteCredential.dart';
import 'package:pozitive/Core/Model/Api/GroupAddPartnerAddQuickLeadCredential.dart';
import 'package:pozitive/Core/Model/Api/InsertAddProspect/ProspectGetAddPartnerCredetial.dart';
import 'package:pozitive/Core/Model/apiError.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';
import 'package:pozitive/Core/Model/Api/Refresh-RequestQuoteCredential.dart';

import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/ElectricityCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/GasCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/newInsertAddProspCredential.dart';

import 'package:pozitive/Core/Model/Api/UploadHHFileCredential.dart';
import 'package:pozitive/Core/Model/Api/account_credential.dart';
import 'package:pozitive/Core/Model/Api/add_daily_commission_details_credentials.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential..dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential.dart';
import 'package:pozitive/Core/Model/Api/broker_common_bill_credentials.dart';
import 'package:pozitive/Core/Model/Api/dashBoadDetailCredential.dart';
import 'package:pozitive/Core/Model/Api/downloadall_credential.dart';
import 'package:pozitive/Core/Model/Api/generateIndividualContractCredential.dart';
import 'package:pozitive/Core/Model/Api/groupQuoteNoteCredential.dart';
import 'package:pozitive/Core/Model/Api/move_group_quote_credenitials.dart';
import 'package:pozitive/Core/Model/Api/move_quote_credentials.dart';
import 'package:pozitive/Core/Model/Api/profileIdModel.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/save_button_credentials.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/sendTenderPriceCredentials.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/supply_point_credentials.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/update_button_credentials.dart';
import 'package:pozitive/Core/Model/Api/quoteNoteCredential.dart';
import 'package:pozitive/Core/Model/Api/Group-Refresh-Req-Requote.dart';
import 'package:pozitive/Core/Model/ApiResponse/Ask_for_ReQuote.dart';
import 'package:pozitive/Core/Model/ApiResponse/GroupRefreshReqQuoteModel.dart';
import 'package:pozitive/Core/Model/Api/PartnerSavePriceWithUpliftCredential.dart';
import 'package:pozitive/Core/Model/Api/view_group_button_credentials.dart';
import 'package:pozitive/Core/Model/ApiResponse/add_quote_response.dart';
import 'package:pozitive/Core/Model/ApiResponse/RefreshReqQuoteModel.dart';
import 'package:pozitive/Core/Model/ApiResponse/save_button_response.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/ApiResponse/send_email_tender_response.dart';
import 'package:pozitive/Core/Model/DashBoardModel.dart';
import 'package:pozitive/Core/Model/Download-contract-groupApi.dart';
import 'package:pozitive/Core/Model/GetDailyCommissonDetailModel.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBusinessCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/InsertAddProspectCredential.dart';
import 'package:pozitive/Core/Model/GroupQuotation/ContractCustomerDetailsModel.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/GetAddProspectModel.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/insert-Add-prospect.dart';
import 'package:pozitive/Core/Model/TemplateGroupQuoteSaveandGenerateContractModel.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractAddMethodModel.dart';
import 'package:pozitive/Core/Model/broker_commission_details.dart';
import 'package:pozitive/Core/Model/broker_commission_model.dart';
import 'package:pozitive/Core/Model/commission_statement_details.dart';
import 'package:pozitive/Core/Model/dashBoardDetailsDataModel.dart';
import 'package:pozitive/Core/Model/download_all.dart';
import 'package:pozitive/Core/Model/download_invoice_model.dart';
import 'package:pozitive/Core/Model/export-tender-priceModel.dart';
import 'package:pozitive/Core/Model/quote_list_item_details.dart';
import 'package:pozitive/Core/Model/renewal_download_details.dart';
import 'package:pozitive/Core/Model/renewal_download_invoice_model.dart';
import 'package:pozitive/Core/Model/response_model.dart';
import 'package:pozitive/Core/Model/status_commission_report_model.dart';
import 'package:pozitive/Core/Services/database_services.dart';
import 'package:pozitive/Core/Model/Api/email_tender_price_credential.dart';
import 'package:pozitive/Core/Model/email_tender_price_model.dart';
import 'package:pozitive/Core/Model/Api/request_quote_history_credential.dart';
import 'package:pozitive/Core/Model/request_quote_history_model.dart';
import 'package:pozitive/Core/Model/Api/request_quote_history_button_credential.dart';
import 'package:pozitive/Core/Model/request_quote_history_button_model.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/ask_for_requote_group_model.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_group_credential.dart';
import 'package:pozitive/Core/Model/email_tender_price_group_model.dart';
import 'package:pozitive/Core/Model/Api/email_tender_price_group_credential.dart';
import 'package:pozitive/Core/Model/Api/export_tender_price_group_credential.dart';
import 'package:pozitive/Core/Model/export_tender_price_group_model.dart';
import 'package:pozitive/Core/Model/request_quote_history_group_model.dart';
import 'package:pozitive/Core/Model/Api/request_quote_history_group_credential.dart';
import 'package:pozitive/Core/Model/Api/quote_history_dropdown_group_credential.dart';
import 'package:pozitive/Core/Model/quote_history_dropdown_group_model.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelGroupCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleEleCredentials.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBusCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleSiteAddressCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBillAddCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleEAMCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/ElePaymentCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/ElePartnerCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleGroupCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelPartnerCredential.dart';
import 'package:pozitive/Core/Model/Api/Group-Quotation/ContractCustomerDetailCredential.dart';
import 'package:pozitive/Core/Model/IndividualAddQuote-AddPartnerAddQuickLeadModel.dart';
import 'package:pozitive/Core/Model/Api/AskForQuoteIndividualCredential.dart';
import 'package:pozitive/Core/Model/Api/SaveAndGenerateContractIndividualCredential.dart';
import 'package:pozitive/Core/Model/Api/SaveAndGenerateContractAddMethodCredential.dart';
import 'package:pozitive/Core/Model/Api/QuoteHistoryDropDownIndividualCredential.dart';
import 'package:pozitive/Core/Model/QuoteHistoryDropDownIndividualModel.dart';
import 'package:pozitive/Core/Model/Api/Group-Quotation/GroupAddPartnerAddQuickLeadNewCredential.dart';
import 'package:pozitive/Core/Model/GroupQuotation/GroupAddPartnerAddQuickLeadNewModel.dart';
import 'package:pozitive/Core/Model/get_company_name_list_model.dart';
import 'package:pozitive/Core/Model/get_max_count_for_site_model.dart';
import 'package:pozitive/Core/Model/get_company_reg_no_model.dart';
import 'package:pozitive/Core/Model/Api/Group-Quotation/group_detail_tab_credential.dart';
import 'package:pozitive/Core/Model/group_details_tab_model.dart';
import 'package:pozitive/Core/Model/get_partner_quote_group_price_model.dart';
import 'package:pozitive/Core/Model/Api/get_partner_quote_group_price_credentials.dart';
import 'package:pozitive/Core/Model/Api/get_group_volume_data_credentials.dart';
import 'package:pozitive/Core/Model/get_group_volume_data_model.dart';

abstract class Database {
  Future getDownLoadAllUrl(DownloadAllCredentials credentials);

  Future getDownloadInvoiceUrl(DownloadAllCredentials credentials);

  Future getRenewalDownloadUrl(DownloadAllCredentials credentials);

  Future getRenewalDownloadInvoiceUrl(DownloadAllCredentials credentials);

  Future addDailyCommissionDetails(
      AddDailyCommissionDetailCredentials credentials);

  Future getRenewalCommissionList(AccountCredential credential);

  Future getPartnerCommissionList(AccountCredential credential);

  Future getDownloadCommonDetailsUrl(DownloadAllCredentials credentials);

  Future getStatusCommissionReportList(BrokerCommonBillCredentials credentials);

  Future getDailyCommissionDetailList(GetDailyCommissionCredential credentials);

  Future getDashBoardDetails(ProfileId profileId);

  Future addQuote(ProfileId profileId);

  Future getDashBoardDetailsList(
      DashBoardDetailsCredential dashBoardDetailsCredential);

  Future moveQuote(MoveQuoteCredentials credentials);

  Future uploadHHFileAttachment(UploadHHFileCredential uploadHHFileCredential);

  Future getIndividiualGroupQuoteNoteList(
      QuoteNoteCredential quoteNoteCredential);

  Future getgroupQuoteNoteList(GroupQuoteNoteCredential quoteNoteCredential);

  Future getPartnerPriceandUpLift(
      PartnerSavePriceWithUpliftCredential
          partnerSavePriceWithUpliftCredential);

  Future onSelectDownloadTender(
      ExportTenderPriceCredential exportTenderPriceCredential);

  Future askForReQuote(AskForReQuoteCrential askForReQuoteCrential);

  Future refreshReQuote(RefreshReQuoteCrential refreshReQuoteCrential);

  Future generateIndividualContractService(
      GenerateIndividualContractCredential contractCredential);

  Future dualFuelInsertAddProspectService(
      DualFuelInsertAddProspectCredential dualFuelInsertAddProspectCredential);

  Future onSelectEmailTender(
      EmailTenderPriceCredential emailTenderPriceCredential);

  Future getRequestQuoteHistoryDetails(
      RequestQuoteHistoryCredential requestQuoteHistoryCredential);

  Future getRequestQuoteHistoryButtonDetails(
      RequestQuoteHistoryButtonCredential requestQuoteHistoryButtonCredential);

  Future getRequestQuoteViewButtonDetails(
      RequestQuoteViewButtonCredential requestQuoteViewButtonCredential);

  Future addQuoteGroup(ProfileId profileId);

  Future groupRefreshReQuote(
      GroupRefreshReQuoteCrential groupRefreshReQuoteCrential);

  Future groupAddPartnerAddQuickLead(
      GroupAddPartnerAddQuickLeadCrential groupAddPartnerAddQuickLeadCrential);

  Future groupAddPartnerAddQuickLeadNew(
      GroupAddPartnerAddQuickLeadNewCredential
          groupAddPartnerAddQuickLeadNewCredential);

  Future getDownloadContractGroup(
      DownloadContractGroupCredentials downloadContractGroupCredentials);

  Future moveGroupQuote(MoveGroupQuoteCredentials credentials);

  Future getGroupQuoteLstItemDetail(ViewGroupButtonCredentials credentials);

  Future getHHSampleFileAttachment(ProfileId profileId);

  Future getAskForRequoteGroupDetails(
      AskForRequoteGroupCredential askForRequoteGroupCredential);

  Future onSelectEmailGroupTender(
      EmailTenderPriceGroupCredential emailTenderPriceGroupCredential);

  Future onSelectDownloadTenderGroup(
      ExportTenderPriceGroupCredential exportTenderPriceGroupCredential);

  Future getRequestQuoteHistoryGroupDetails(
      RequestQuoteHistoryGroupCredential requestQuoteHistoryGroupCredential);

  Future getQuoteHistoryDropDownGroupDetails(
      QuoteHistoryDropDownGroupCredential quoteHistoryDropDownGroupCredential);

  Future getTemplateGroupQuotation(TemplateGroupQuoteCredential credential);

  Future getQuoteHistoryDropDownIndividualDetails(
      QuoteHistoryDropDownIndividualCredential
          quoteHistoryDropDownIndividualCredential);

  Future saveRequestQuoteIndividual(SaveButtonCredentials credentials);

  Future updateRequestQuoteIndividual(UpdateButtonCredentials credentials);

  Future submitSupplyPointDetails(SupplyPointCredentials credentials);

  Future getIndividulHHSampleFileAttachmentUrl(AccountCredential credential);

  Future sendEmailTenderIndividual(SendTenderPriceCredentials credentials);

  Future eleEleInsertAddProspectService(EleEleCredentials eleEleCredentials);

  Future eleBusInsertAddProspectService(EleBusCredential eleBusCredentials);

  Future eleSiteAddressInsertAddProspectService(
      EleSiteAddressCredential eleSiteAddressCredential);

  Future eleBillingAddressInsertAddProspectService(
      EleBillAddCredential eleBillAddressCredential);

  Future eleEAMInsertAddProspectService(EleEAMCredential eleEAMCredential);

  Future elePaymentInsertAddProspectService(
      ElePaymentCredential elePaymentCredential);

  Future elePartnerInsertAddProspectService(
      ElePartnerCredential elePartnerCredential);

  Future eleGroupInsertAddProspectService(
      EleGroupCredential eleGroupCredential);

  Future passElectricityAddProspectServices(
      ELEInsertAddProspectCredentials credentials);

  Future passdualFuelAddProspectServices(
      DualFuelInsertAddProspectCredentials credential);

  Future getDualFuelGroupServices(DualFuelGroupCredential credential);

  Future getDualFuelPartnerServices(DualFuelPartnerCredential credential);

  Future passGassAddProspectServices(
      GasInsertAddProspectCredentials credential);

  Future getAddProspectService(ProspectGetAddCredential credential);

  Future askForQuoteIndividual(AskForQuoteIndividualCredential credential);

  Future saveAndGenerateContactIndividual(
      SaveAndGenerateContractIndivualCredential credential);
  Future saveAndDownloadContractIndividual(
      SaveAndGenerateContractAddMethodCredential credential);

  Future getCompanyNameList();
  Future getMaxCountForAddSite();
  Future getCompanyRegNo({@required String companyName});
  Future getGroupDetails(GroupDetailsTabCredential credential);
  Future getGroupVolumeData(GetGroupVolumeDataCredentials credential);
  Future getPartnerGroupQuotePrice(
      GetPartnerQuoteGroupPriceCredentials credentials);
}

class DatabaseImplementation extends Database {
  DatabaseService _databaseService = DatabaseService();
  @override
  Future getPartnerGroupQuotePrice(
      GetPartnerQuoteGroupPriceCredentials credentials) {
    return _databaseService.postRequest(
      ApiPath.getPartnerQuoteGroupPrice,
      (r) {
        AppConstant.printWrapped(r.body);
        var res = jsonDecode(r.body);
        return GetPartnerQuoteGroupPriceModel.fromJson(res);
      },
      credentials.toJson(),
    );
  }

  @override
  Future getGroupVolumeData(GetGroupVolumeDataCredentials credentials) {
    return _databaseService.postRequest(
      ApiPath.getGroupVolumeData,
      (r) {
        //AppConstant.printWrapped(r.body);
        var res = jsonDecode(r.body);
        return GetGroupVolumeDataModel.fromJson(res);
      },
      credentials.toJson(),
    );
  }

  @override
  Future getGroupDetails(GroupDetailsTabCredential credential) {
    return _databaseService.postRequest(
      ApiPath.groupDetailsTab,
      (r) {
        AppConstant.printWrapped(r.body);
        var res = jsonDecode(r.body);
        return GroupDetailsTabModel.fromJson(res);
      },
      credential.toJson(),
    );
  }

  @override
  Future getCompanyRegNo({@required String companyName}) {
    return _databaseService.getRequest(
        ApiPath.getCompanyRegNoFromCompanySelection + companyName, (r) {
      var res = jsonDecode(r.body);
      return GetCompanyRegNoModel.fromJson(res);
    });
  }

  @override
  Future getMaxCountForAddSite() {
    return _databaseService.getRequest(ApiPath.getMaxCountForAddSite, (r) {
      var res = jsonDecode(r.body);
      return GetMaxCountForAddSiteModel.fromJson(res);
    });
  }

  @override
  Future getAddProspectService(ProspectGetAddCredential credential) {
    return _databaseService.postRequest(ApiPath.getAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      print('hii generate contracts..... $res');
      print(res['strfileElepath']);
      return ProspectGetAddPartnerModel.fromJson(res['data']);
    }, credential.toJson());
  }

  @override
  Future getCompanyNameList() {
    return _databaseService.getRequest(
      ApiPath.getCompanyNameList,
      (r) {
        var res = jsonDecode(r.body);
        return CompanyListModel.fromJson(res);
      },
    );
  }

  @override
  Future addQuoteGroup(ProfileId profileId) {
    return _databaseService.postRequest(ApiPath.addQuoteGroupDashboard, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return AddQuoteResponse.fromJson(res);
    }, profileId.toJson());
  }

  @override
  Future saveAndDownloadContractIndividual(
      SaveAndGenerateContractAddMethodCredential credential) {
    print('reaching to databse');
    print(credential.toJson());
    return _databaseService.postRequest(
      ApiPath.saveAndDownloadContract,
      (r) {
        var res = jsonDecode(r.body);
        print(res);
        print('hi$res');
        print(res['msg']);
        //  return SaveAndGenerateContractAddMethodModel.fromJson(res['data']);
        return SaveAndGenerateContractAddMethodModel.fromJson(res);
      },
      credential.toJson(),
    );
  }

  @override
  Future saveAndGenerateContactIndividual(
      SaveAndGenerateContractIndivualCredential credential) {
    print(credential.toJson());
    return _databaseService.postRequest(
      ApiPath.saveAndGenerateContract,
      (r) {
        var res = jsonDecode(r.body);
        print(res);
        return SaveAndGenerateContractIndividualModel.fromJson(res['data']);
      },
      credential.toJson(),
    );
  }

  @override
  Future getContractCustomerDownloadAndGenerate(
      ContractCustomerDetailsCredential credential) {
    print(credential.toJson());

    return _databaseService.postRequest(ApiPath.contractCustomerSaveAndGenerate,
        (r) {
      var res = jsonDecode(r.body);
      print('-----Save and Generate Api Call-------');
      print(res);

      return ContractCustomerDetailModel.fromJson(res);
    }, credential.toJson());
  }

  @override
  Future getDualFuelPartnerServices(DualFuelPartnerCredential credentials) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return DuelFuelInsertAddProspectModel.fromJson(res['data']);
      } else {
        return null;
      }
    }, credentials.toJson());
  }

  @override
  Future getDualFuelGroupServices(DualFuelGroupCredential credentials) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return DuelFuelInsertAddProspectModel.fromJson(res['data']);
      } else {
        return null;
      }
    }, credentials.toJson());
  }

  @override
  Future passElectricityAddProspectServices(
      ELEInsertAddProspectCredentials credential) {
    print(credential.toJson());

    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);

      var res = jsonDecode(r.body);
      print('-----Elec Api Call-------');

      print('hii..... $res');
      print(res['strfileElepath']);
      return ELEInsertAddProspectModel.fromJson(res);
    }, credential.toJson());
  }

  @override
  Future passdualFuelAddProspectServices(
      DualFuelInsertAddProspectCredentials credential) {
    print(credential.toJson());

    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      var res = jsonDecode(r.body);
      print('hii DF contracts..... $res');
      print(res['DownloadZipPath']);

      // return (res['msg']);
      return DuelFuelInsertAddProspectModel.fromJson(res);
    }, credential.toJson());
  }

  @override
  Future passGassAddProspectServices(
      GasInsertAddProspectCredentials credential) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      var res = jsonDecode(r.body);
      print('-----gas Api Call-------');

      print('hii..... $res');

      return DuelFuelInsertAddProspectModel.fromJson(res);
    }, credential.toJson());
  }

  @override
  Future eleGroupInsertAddProspectService(
      EleGroupCredential eleGroupCredential) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return DuelFuelInsertAddProspectModel.fromJson(res);
      } else {
        return null;
      }
    }, eleGroupCredential.toJson());
  }

  @override
  Future elePartnerInsertAddProspectService(
      ElePartnerCredential elePartnerCredential) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return DuelFuelInsertAddProspectModel.fromJson(res);
      } else {
        return null;
      }
    }, elePartnerCredential.toJson());
  }

  @override
  Future elePaymentInsertAddProspectService(
      ElePaymentCredential elePaymentCredential) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return DuelFuelInsertAddProspectModel.fromJson(res);
      } else {
        return null;
      }
    }, elePaymentCredential.toJson());
  }

  @override
  Future eleEAMInsertAddProspectService(EleEAMCredential eleEAMCredential) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return DuelFuelInsertAddProspectModel.fromJson(res);
      } else {
        return null;
      }
    }, eleEAMCredential.toJson());
  }

  @override
  Future eleBillingAddressInsertAddProspectService(
      EleBillAddCredential eleBillAddressCredential) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return DuelFuelInsertAddProspectModel.fromJson(res);
      } else {
        return null;
      }
    }, eleBillAddressCredential.toJson());
  }

  @override
  Future eleSiteAddressInsertAddProspectService(
      EleSiteAddressCredential eleSiteAddressCredential) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return DuelFuelInsertAddProspectModel.fromJson(res);
      } else {
        return null;
      }
    }, eleSiteAddressCredential.toJson());
  }

  @override
  Future eleBusInsertAddProspectService(EleBusCredential eleBusCredential) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return DuelFuelInsertAddProspectModel.fromJson(res);
      } else {
        return null;
      }
    }, eleBusCredential.toJson());
  }

  @override
  Future dualFuelInsertAddProspectService(
      DualFuelInsertAddProspectCredential dualFuelInsertAddProspectCredential) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return DuelFuelInsertAddProspectModel.fromJson(res);
      } else {
        return null;
      }
    }, dualFuelInsertAddProspectCredential.toJson());
  }

  //Method for ele ele add prospect
  Future eleEleInsertAddProspectService(EleEleCredentials eleEleCredentials) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return DuelFuelInsertAddProspectModel.fromJson(res);
      } else {
        return null;
      }
    }, eleEleCredentials.toJson());
  }

  @override
  Future getQuoteHistoryDropDownIndividualDetails(
      QuoteHistoryDropDownIndividualCredential credential) {
    return _databaseService.postRequest(ApiPath.quoteHistoryDropDownIndividual,
        (r) {
      print(r.body);

      var res = jsonDecode(r.body);
      print(res);
      if (res['status'] == '1') {
        return QuoteHistoryDropDownIndividualModel.fromJson(res['data']);
      } else {
        return null;
      }
    }, credential.toJson());
  }

  @override
  Future getQuoteHistoryDropDownGroupDetails(
      QuoteHistoryDropDownGroupCredential quoteHistoryDropDownGroupCredential) {
    return _databaseService.postRequest(ApiPath.quoteHistoryDropDownGroup, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      print(res);
      return QuoteHistoryDropDownGroupModel.fromJson(res['data']);
    }, quoteHistoryDropDownGroupCredential.toJson());
  }

  @override
  Future getRequestQuoteHistoryGroupDetails(
      RequestQuoteHistoryGroupCredential requestQuoteHistoryGroupCredential) {
    return _databaseService.postRequest(ApiPath.requestQuoteHistoryGroup, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return RequestQuoteHistoryGroupModel.fromJson(res['data']);
    }, requestQuoteHistoryGroupCredential.toJson());
  }

  @override
  Future onSelectDownloadTenderGroup(
      ExportTenderPriceGroupCredential exportTenderPriceGroupCredential) {
    return _databaseService
        .postRequest(ApiPath.onSelectDownloadExportTenderPriceGroup, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return ExportTenderPriceGroupModel.fromJson(res['data']);
    }, exportTenderPriceGroupCredential.toJson());
  }

  @override
  Future getAskForRequoteGroupDetails(
      AskForRequoteGroupCredential askForRequoteGroupCredential) {
    return _databaseService.postRequest(ApiPath.askForRequoteGroup, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return AskForRequoteGroupModel.fromJson(res);
    }, askForRequoteGroupCredential.toJson());
  }

  @override
  Future groupRefreshReQuote(
      GroupRefreshReQuoteCrential groupRefreshReQuoteCrential) {
    return _databaseService.postRequest(ApiPath.groupRefreshReqQuote, (r) {
      var res = jsonDecode(r.body);
      print("Group Refresh" + res);

      return GroupRefreshModel.fromJson(res);
    }, groupRefreshReQuoteCrential.toJson());
  }

  @override
  Future groupAddPartnerAddQuickLead(
      GroupAddPartnerAddQuickLeadCrential groupAddPartnerAddQuickLeadCrential) {
    return _databaseService.postRequest(ApiPath.askForQuoteGroup, (r) {
      print(r.body);
      var res = jsonDecode(r.body);

      return ResponseMessage(
          status: num.tryParse(res['status']), msg: res['msg']);
    }, groupAddPartnerAddQuickLeadCrential.toJson());
  }

  @override
  Future getHHSampleFileAttachment(ProfileId profileId) {
    return _databaseService.postRequest(ApiPath.getPartnerGroupAddQuote, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      print(res['data']['HHSampleFileAttachment']);
      if (res['status'] == '1') {
        return res['data']['HHSampleFileAttachment'];
      } else {
        return null;
      }
    }, profileId.toJson());
  }

  @override
  Future moveGroupQuote(MoveGroupQuoteCredentials credentials) {
    return _databaseService.postRequest(ApiPath.groupMoveToQuoted, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return ResponseMessage(status: 1, msg: res['msg']);
      } else {
        return ResponseMessage(status: 2, msg: res['msg']);
      }
    }, credentials.toJson());
  }

  @override
  Future getDownloadContractGroup(
      DownloadContractGroupCredentials downloadContractGroupCredentials) {
    return _databaseService.postRequest(ApiPath.downloadContractGroup, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return DownloadContractGroupApi.fromJson(res['data']);
    }, downloadContractGroupCredentials.toJson());
  }

  @override
  Future onSelectEmailGroupTender(
      EmailTenderPriceGroupCredential emailTenderPriceGroupCredential) {
    return _databaseService
        .postRequest(ApiPath.onSelectDownloadExportTenderPriceGroup, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return EmailTenderPriceGroupModel.fromJson(res['data']);
    }, emailTenderPriceGroupCredential.toJson());
  }

  @override
  Future getTemplateGroupQuotation(TemplateGroupQuoteCredential credential) {
    print(credential.toJson());

    return _databaseService.postRequest(ApiPath.saveandGenerateContractGroup,
        (r) {
      var res = jsonDecode(r.body);
      print(r.body);

      return SaveAndGenerateGroup.fromJson(res);
    }, credential.toJson());
  }

  @override
  Future getGroupQuoteLstItemDetail(ViewGroupButtonCredentials credentials) {
    return _databaseService
        .postRequest(ApiPath.getPartnerAddQuickLeadQuoteGroup, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return QuoteListItemDetails.fromJson(res['data']);
      } else {
        return null;
      }
    }, credentials.toJson());
  }

  @override
  Future getRequestQuoteViewButtonDetails(
      RequestQuoteViewButtonCredential requestQuoteViewButtonCredential) {
    return _databaseService.postRequest(ApiPath.requestQuoteViewButton, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return RequestQuoteViewButtonModel.fromJson(res['data']);
    }, requestQuoteViewButtonCredential.toJson());
  }

  @override
  Future getRequestQuoteHistoryButtonDetails(
      RequestQuoteHistoryButtonCredential requestQuoteHistoryButtonCredential) {
    return _databaseService.postRequest(ApiPath.requestQuoteButtonHistory, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return RequestQuoteHistoryButtonModel.fromJson(res['data']);
    }, requestQuoteHistoryButtonCredential.toJson());
  }

  @override
  Future getRequestQuoteHistoryDetails(
      RequestQuoteHistoryCredential requestQuoteHistoryCredential) {
    return _databaseService.postRequest(ApiPath.requestQuoteHistory, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return RequestQuoteHistoryModel.fromJson(res['data']);
      } else {
        return null;
      }
      // return RequestQuoteHistoryModel.fromJson(res['data']);
    }, requestQuoteHistoryCredential.toJson());
  }

  @override
  Future onSelectDownloadTender(
      ExportTenderPriceCredential exportTenderPriceCredential) {
    return _databaseService
        .postRequest(ApiPath.onSelectDownloadExportTenderPrice, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return ExportTenderPriceModel.fromJson(res['data']);
    }, exportTenderPriceCredential.toJson());
  }

  @override
  Future onSelectEmailTender(
      EmailTenderPriceCredential emailTenderPriceCredential) {
    return _databaseService.postRequest(ApiPath.onSelectEmailTenderPrice, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return EmailTenderPriceModel.fromJson(res['data']);
    }, emailTenderPriceCredential.toJson());
  }

  @override
  Future getDownLoadAllUrl(DownloadAllCredentials credentials) {
    return _databaseService.postRequest(ApiPath.downloadAllDetails, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return DownloadAllClass.fromJson(res['data']);
    }, credentials.toJson());
  }

  @override
  Future getDownloadInvoiceUrl(DownloadAllCredentials credentials) {
    return _databaseService.postRequest(ApiPath.downloadInvoice, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return DownloadInvoice.fromJson(res['data']);
    }, credentials.toJson());
  }

  @override
  Future getRenewalDownloadUrl(DownloadAllCredentials credentials) {
    return _databaseService.postRequest(ApiPath.renewalDownloadAllDetail, (r) {
      print(r.body);

      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return RenewalDownloadDetails.fromJson(res['data']);
      } else {
        return null;
      }
    }, credentials.toJson());
  }

  @override
  Future getRenewalDownloadInvoiceUrl(DownloadAllCredentials credentials) {
    return _databaseService.postRequest(ApiPath.renewalDownloadInvoice, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return RenewalDownloadInvoiceDetails.fromJson(res['data']);
    }, credentials.toJson());
  }

  @override
  Future addDailyCommissionDetails(
      AddDailyCommissionDetailCredentials credentials) {
    return _databaseService.postRequest(ApiPath.addDailyCommissionDetail, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return ResponseMessage(status: 1, msg: res['msg']);
      } else {
        return ResponseMessage(status: 0, msg: res['msg']);
      }
    }, credentials.toJson());
  }

  @override
  Future getRenewalCommissionList(AccountCredential credential) {
    return _databaseService.postRequest(ApiPath.renewalCommissionList, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return CommissionStatementDetails.fromJson(res['data']);

//      final parsed = res['data']['BrokerCommissionList'].cast<Map<String, dynamic>>();
//      return parsed.map<BrokerCommission>((json) => BrokerCommission.fromJson(json)).toList();
    }, credential.toJson());
  }

  @override
  Future getPartnerCommissionList(AccountCredential credential) {
    return _databaseService.postRequest(ApiPath.partnerCommissionList, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['data']['SaleCommissionList'] != null) {
        final parsed =
            res['data']['SaleCommissionList'].cast<Map<String, dynamic>>();
        return parsed
            .map<BrokerCommission>((json) => BrokerCommission.fromJson(json))
            .toList();
      } else {
        List<BrokerCommission> _list = [];
        return _list;
      }
    }, credential.toJson());
  }

  @override
  Future getDownloadCommonDetailsUrl(DownloadAllCredentials credentials) {
    return _databaseService.postRequest(ApiPath.brokerCommissionDetail, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return BrokerCommissionDetails.fromJson(res['data']);
    }, credentials.toJson());
  }

  @override
  Future getStatusCommissionReportList(
      BrokerCommonBillCredentials credentials) {
    return _databaseService.postRequest(ApiPath.partnerCommissionList, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['data']['StatusCommissionReportList'] != null) {
        final parsed = res['data']['StatusCommissionReportList']
            .cast<Map<String, dynamic>>();
        return parsed
            .map<StatusCommissionReport>(
                (json) => StatusCommissionReport.fromJson(json))
            .toList();
      } else {
        List<StatusCommissionReport> _list = [];
        return _list;
      }
    }, credentials.toJson());
  }

  @override
  Future getDailyCommissionDetailList(GetDailyCommissionCredential credential) {
    return _databaseService.postRequest(ApiPath.getDailyCommissionDetail, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return LstGetDailycommission.fromJson(res['data']);

//      final parsed = res['data']['BrokerCommissionList'].cast<Map<String, dynamic>>();
//      return parsed.map<BrokerCommission>((json) => BrokerCommission.fromJson(json)).toList();
    }, credential.toJson());
  }

  @override
  Future getDashBoardDetails(ProfileId profileId) {
    return _databaseService.postRequest(ApiPath.quickLeadQuoteDashboard, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return DashBoardModel.fromJson(res['data']);
    }, profileId.toJson());
  }

  @override
  Future addQuote(ProfileId profileId) {
    return _databaseService.postRequest(ApiPath.quickLeadQuoteDashboard, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return AddQuoteResponse.fromJson(res);
    }, profileId.toJson());
  }

  @override
  Future getDashBoardDetailsList(
      DashBoardDetailsCredential dashBoardDetailsCredential) {
    return _databaseService.postRequest(ApiPath.quickLeadQuoteDashboardDetail,
        (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return DashBoardDetailDataModel.fromJson(res['data']);
    }, dashBoardDetailsCredential.toJson());
  }

  @override
  Future moveQuote(MoveQuoteCredentials credentials) {
    return _databaseService.postRequest(ApiPath.individualMoveToQuoted, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return ResponseMessage(status: 1, msg: res['msg']);
      } else {
        return null;
      }
    }, credentials.toJson());
  }

  @override
  Future getIndividiualGroupQuoteNoteList(
      QuoteNoteCredential quoteNoteCredential) {
    // TODO: implement getIndividiualGroupQuoteNoteList
    throw UnimplementedError();
  }

  @override
  Future getgroupQuoteNoteList(GroupQuoteNoteCredential quoteNoteCredential) {
    // TODO: implement getgroupQuoteNoteList
    throw UnimplementedError();
  }

  @override
  Future uploadHHFileAttachment(UploadHHFileCredential uploadHHFileCredential) {
    return _databaseService.postRequest(ApiPath.UploadHHFileCredential, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return ResponseMessage(status: 1, msg: res['msg']);
      } else {
        return null;
      }
    }, uploadHHFileCredential.toJson());
  }

  @override
  Future getPartnerPriceandUpLift(
      PartnerSavePriceWithUpliftCredential
          partnerSavePriceWithUpliftCredential) {
    return _databaseService.postRequest(ApiPath.partnerSavePriceWithUplift,
        (r) {
      var res = jsonDecode(r.body);
      if (res['status'] == '1' || res['status'] == '2') {
        return ResponseMessage(status: 1, msg: res['msg']);
      } else {
        return ResponseMessage(status: 0, msg: res['msg']);
      }
    }, partnerSavePriceWithUpliftCredential.toJson());
  }

  @override
  Future askForReQuote(AskForReQuoteCrential askForReQuoteCrential) {
    return _databaseService.postRequest(ApiPath.askForRequote, (r) {
      var res = jsonDecode(r.body);
      print(res);

      return AskForRequote.fromJson(res);
    }, askForReQuoteCrential.toJson());
  }

  @override
  Future refreshReQuote(RefreshReQuoteCrential refreshReQuoteCrential) {
    return _databaseService.postRequest(ApiPath.refreshReqQuote, (r) {
      var res = jsonDecode(r.body);

      return RefreshReqQuoteModel.fromJson(res);
    }, refreshReQuoteCrential.toJson());
  }

  @override
  Future generateIndividualContractService(
      GenerateIndividualContractCredential contractCredential) {
    return _databaseService.postRequest(ApiPath.generateIndividualContract,
        (r) {
      var res = jsonDecode(r.body);
      print(res);

      return RefreshReqQuoteModel.fromJson(res);
    }, contractCredential.toJson());
  }

  @override
  Future saveRequestQuoteIndividual(SaveButtonCredentials credentials) {
    return _databaseService.postRequest(ApiPath.saveButtonIndividual, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      print('${credentials}sssssssssssssaaaaaaaaaaaa');
      print(res);

      return SaveButtonResponse.fromJson(res);
    }, credentials.toJson());
  }

  @override
  Future updateRequestQuoteIndividual(UpdateButtonCredentials credentials) {
    return _databaseService.postRequest(ApiPath.updatePartnerAddQuickLeadQuote,
        (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '2') {
        return SaveButtonResponse.fromJson(res);
      } else {
        return null;
      }
    }, credentials.toJson());
  }

  @override
  Future askForQuoteIndividual(AskForQuoteIndividualCredential credentials) {
    return _databaseService.postRequest(ApiPath.askForQuoteIndividual, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return IndividualAddQuoteModel.fromJson(res);
    }, credentials.toJson());
  }

  @override
  Future submitSupplyPointDetails(SupplyPointCredentials credentials) {
    print(credentials.toJson());
    return _databaseService.postRequest(ApiPath.getSupplypointdetail, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return ResponseMessage(status: 1, msg: res['msg']);
      } else {
        return ResponseMessage(status: 0, msg: res['msg']);
      }
    }, credentials.toJson());
  }

  @override
  Future getIndividulHHSampleFileAttachmentUrl(AccountCredential credential) {
    return _databaseService.postRequest(ApiPath.getHHSampleFileAttachment, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      if (res['status'] == '1') {
        return res['data']['HHSampleFileAttachment'];
      } else {
        return null;
      }
    }, credential.toJson());
  }

  @override
  Future sendEmailTenderIndividual(SendTenderPriceCredentials credentials) {
    return _databaseService.postRequest(ApiPath.sendEmailTenderPrice, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return SendEmailTenderResponse.fromJson(res);
    }, credentials.toJson());
  }

  @override
  Future senddualFuelAddProspectService(
      DualFuelInsertAddProspectCredential credential) {
    print(credential.toJson());
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      var res = jsonDecode(r.body);

      print(r.body);

      return DuelFuelInsertAddProspectModel.fromJson(res);
    }, credential.toJson());
  }

  @override
  Future dualFuelELEInsertAddProspectService(
      DualFuelELECTRICITYCredential dualFuelInsertAddProspectCredential) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return DuelFuelInsertAddProspectModel.fromJson(res);
    }, dualFuelInsertAddProspectCredential.toJson());
  }

  @override
  Future dualFuelGASInsertAddProspectService(
      DualFuelGasCredential gasCredential) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return DuelFuelInsertAddProspectModel.fromJson(res);
    }, gasCredential.toJson());
  }

  @override
  Future dualFuelBusinessInsertAddProspectService(
      DualFuelBusinessCredential gasCredential) {
    return _databaseService.postRequest(ApiPath.insertAddProspect, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return DuelFuelInsertAddProspectModel.fromJson(res);
    }, gasCredential.toJson());
  }

  @override
  Future groupAddPartnerAddQuickLeadNew(
      GroupAddPartnerAddQuickLeadNewCredential
          groupAddPartnerAddQuickLeadNewCredential) {
    return _databaseService.postRequest(ApiPath.askForQuoteGroupNewFinal, (r) {
      AppConstant.printWrapped(r.body);
      var res = jsonDecode(r.body);
      return GroupAddPartnerAddQuickLeadNewModel.fromJson(res);
    }, groupAddPartnerAddQuickLeadNewCredential.toJson());
  }
}
