class ProfileData {
  final String username;
  final String email;
  final String password;

  ProfileData({
    required this.username,
    required this.email,
    required this.password,
  });
}

List<ProfileData> registeredUsers = [
  ProfileData(username: 'admin', email: 'admin@example.com', password: 'password'),
];

bool isAccountRegistered(String username, String password) {
  for (var user in registeredUsers) {
    if (user.username == username && user.password == password) {
      return true;
    }
  }
  return false;
}
