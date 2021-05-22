
import 'dart:convert';

import 'package:pozitive/Core/AppConstact/apiPath.dart';
import 'package:pozitive/Core/Model/Api/add_quotation_QuickLeadCredential.dart';
import 'package:pozitive/Core/Model/add_quotation_QuickLeadModel.dart';

import 'package:pozitive/Core/Services/baseApi.dart';

class AddQuickQuoteLeadService extends BaseApi {


  Future<dynamic>getQuickQuoteLeadIndividual(AddQuoteQuickLeadCredential addQuotationButtonCredential){
    return postRequest(ApiPath.addQuotedQuickLeadIndividual, (r) {
      print(r.body);
      var res= jsonDecode(r.body);
      return AddQuickLeadQuoteModel.fromJson(res['data']);
    },addQuotationButtonCredential);
  }
}