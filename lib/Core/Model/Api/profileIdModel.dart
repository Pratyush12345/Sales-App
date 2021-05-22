
import 'package:pozitive/Core/Model/sendable.dart';

class ProfileId extends Sendable {
  String accountId;

  ProfileId({
    this.accountId,

  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    return data;
  }
}