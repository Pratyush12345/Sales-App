import 'package:pozitive/Core/Model/sendable.dart';

class GetGroupVolumeDataCredentials extends Sendable {
  String accountId;
  String groupId;
  String type;

  GetGroupVolumeDataCredentials({
    this.accountId,
    this.groupId,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['GroupId'] = this.groupId;
    data['type'] = this.type;
    return data;
  }
}
