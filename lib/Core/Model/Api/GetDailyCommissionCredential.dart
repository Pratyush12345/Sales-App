
import 'package:pozitive/Core/Model/sendable.dart';

class GetDailyCommissionCredential extends Sendable {
  String accountId;

  GetDailyCommissionCredential({
    this.accountId,
  });

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    return data;
  }
}