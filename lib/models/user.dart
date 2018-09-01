class UserModel {
  String username;
  String firstname;
  String lastname;

  UserModel(this.username, this.firstname, this.lastname);

  static UserModel testModel() {
    return UserModel('username', 'First', 'Last');
  }

  String getName() {
    return this.firstname + " " + this.lastname;
  }
}