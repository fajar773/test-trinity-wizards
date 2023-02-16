class ContactsModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;

  ContactsModel({this.id, this.firstName, this.lastName, this.email, this.dob});

  ContactsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['dob'] = this.dob;
    return data;
  }
}
