class User {
  String userId = "";
  String username = "";
  String email = "";
  String accessToken = "";
  String refreshToken = "";
  Null photo;
  bool isActive = false;

  User.fromJson(Map<String, dynamic> json) :
        userId = json['user_id'],
        accessToken = json['access_token'],
        refreshToken = json['refresh_token'],
        photo = json['photo'],
        isActive = json['is_active'];
}