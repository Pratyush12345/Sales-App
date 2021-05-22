
import 'package:pozitive/Core/Model/sendable.dart';

class ProfileEmailId extends Sendable {
  String emailId;

  ProfileEmailId({
    this.emailId,

  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmailId'] = this.emailId;
    return data;
  }
}