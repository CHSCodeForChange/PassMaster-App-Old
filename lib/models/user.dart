class UserModel {
  String username;
  String firstname;
  String lastname;
  String email;
  String token;
  String type;

  UserModel(this.username, this.firstname, this.lastname);

  static UserModel testModel() {
    return UserModel('username', 'First', 'Last');
  }

  String getName() {
    return this.firstname + " " + this.lastname;
  }

  UserModel.fromJson(Map<String, dynamic> json): 
    username = json['username'],
    firstname = json['first_name'], 
    lastname = json['last_name'],
    email = json['email'],
    token = "Token " + json['token'],
    type = json['type'];
}