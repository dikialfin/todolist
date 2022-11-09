class UserModel {
  String uid, name, email;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
  });

  @override
  List<Object> get props => [name, email, uid];
}
