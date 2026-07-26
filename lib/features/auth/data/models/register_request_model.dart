class RegisterRequestModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
  };

  RegisterRequestModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return RegisterRequestModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
