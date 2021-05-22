
import 'package:pozitive/Core/Model/sendable.dart';

class UploadHHFileCredential extends Sendable {
  String accountId;
  String groupid;
  String imageFile;

  UploadHHFileCredential({
    this.accountId,
    this.groupid,
    this.imageFile
  });

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['GroupId'] = this.groupid;
    data['Image64GroupFile']=this.imageFile;
    return data;
  }
}