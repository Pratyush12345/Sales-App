class GasGroupCredential {
  String groupName;

  GasGroupCredential({
    this.groupName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['groupName'] = this.groupName ?? "";
    return data;
  }
}
