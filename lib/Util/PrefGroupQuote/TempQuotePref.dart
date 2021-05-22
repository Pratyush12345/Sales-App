

import 'package:pozitive/Core/Model/Api/Group-Quotation/SaveAndGenerateTemplateQuotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TempPref{


  /// set Template Quote
  static void setTempGroupQuote(
      TemplateQuoteSaveAndGenerateCredential templateQuoteSaveAndGenerateCredential) async {
    print(templateQuoteSaveAndGenerateCredential.toJson());
    print(templateQuoteSaveAndGenerateCredential.AccountId);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (templateQuoteSaveAndGenerateCredential.strBusinessnames != null) {
      sharedPreferences.setString(
          "BusinessName", templateQuoteSaveAndGenerateCredential.strBusinessnames);
    }

  }

///Template Quote Detials(Add Prospect) getMethod
  static Future<TemplateQuoteSaveAndGenerateCredential> getTempGroupQuote() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String businessName = preferences.getString("BusinessName");


    print('#####TemplateQuote....$businessName');
    if (businessName != null) {
      return new TemplateQuoteSaveAndGenerateCredential(
        strBusinessnames: businessName,
      );
    } else {
      return null;
    }
  }
}