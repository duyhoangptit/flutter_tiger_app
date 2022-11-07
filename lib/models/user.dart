class User {
  String userId = "";
  String username = "";
  String email = "";
  String accessToken = "";
  String refreshToken = "";
  Null photo;
  Null isActive;

  User(String userId, String username, String email,
      String accessToken, String refreshToken, Null photo, Null isActive) {
    this.userId = userId;
    this.username = username;
    this.email = email;
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
    this.photo = photo;
    this.isActive = isActive;
  }

  User.fromJson(Map<String, dynamic> json) :
        userId = json['user_id'],
        accessToken = json['access_token'],
        refreshToken = json['refresh_token'],
        photo = json['photo'],
        isActive = json['is_active'];
}