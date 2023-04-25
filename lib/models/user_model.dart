class UserModel{
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String image;
  UserModel(
      {required this.id,
      required this.firstName,
        required this.lastName,
        required this.email,
        required this.username,
        required this.image});

  factory UserModel.fromJson(Map<String, dynamic>json){
    return UserModel(
        id:json['id'],
        firstName:json['firstName'],
        lastName:json['lastName'], username:json['username'],email:json ['email'], image:json ['image']??'https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=740' );
  }
}
