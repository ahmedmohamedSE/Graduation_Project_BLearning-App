class AdminModel{
  String? admin_id;
  String? admin_name;
  String? admin_email;
  String? admin_password;

  // UserModel(this.admin_id,this.admin_name,this.admin_email,this.admin_password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'admin_id': admin_id,
      'admin_name': admin_name,
      'admin_email': admin_email,
      'admin_password': admin_password
    };
    return map;
  }

  AdminModel.fromMap(Map<String, dynamic> map) {
    admin_id = map['admin_id'];
    admin_name = map['admin_name'];
    admin_email = map['admin_email'];
    admin_password = map['password'];
  }
}