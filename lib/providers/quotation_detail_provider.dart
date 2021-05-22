import 'package:flutter/cupertino.dart';
import 'package:pozitive/Core/Model/quotation_details_data_model.dart';

class GroupQuotaionDetailsProvider extends ChangeNotifier {
  QuotationDetailsDataModel _quotationDetailsDataProvider;

  QuotationDetailsDataModel get groupQuotaionDetailsProvider =>
      _quotationDetailsDataProvider;

  set groupQuotaionDetailsProvider(QuotationDetailsDataModel value) {
    _quotationDetailsDataProvider = value;
    notifyListeners();
  }
}
