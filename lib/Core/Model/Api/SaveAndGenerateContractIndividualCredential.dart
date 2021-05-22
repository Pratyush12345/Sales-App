import 'package:pozitive/Core/Model/sendable.dart';

class SaveAndGenerateContractIndivualCredential extends Sendable {
  String accountId;
  String type;
  String intCustomerId;
  String intGroupId;

  SaveAndGenerateContractIndivualCredential({
    this.accountId,
    this.type,
    this.intCustomerId,
    this.intGroupId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountId'] = this.accountId;
    data['type'] = this.type;
    data['intCustomerId'] = this.intCustomerId;
    data['intGroupId'] = this.intGroupId;
    return data;
  }
}
