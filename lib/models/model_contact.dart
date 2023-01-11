class ContactModel {
  String? name;
  String? email;
  String? msg;

  ContactModel({this.name, this.msg, this.email});

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      name: json['name'] as String,
      email: json['email'] as String,
      msg: json['msg'] as String,
    );
  }
}
