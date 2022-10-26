class User {
  final String user_id;
  final String user_fullname;
  final String user_email;
  final String? user_phone_number;
  final String? user_address;
  final String? user_bank_account_number;
  final String? user_bank_name;
  final String? user_token;

  User(
      this.user_id,
      this.user_fullname,
      this.user_email,
      this.user_phone_number,
      this.user_address,
      this.user_bank_account_number,
      this.user_bank_name,
      this.user_token);
  User.fromJson(Map<String, dynamic> json)
      : user_id = json['user_id'],
        user_fullname = json['user_fullname'],
        user_email = json['user_email'],
        user_phone_number = json['user_phone_number'],
        user_address = json['user_address'],
        user_bank_account_number = json['user_bank_account_number'],
        user_bank_name = json['user_bank_name'],
        user_token = json['user_token'];
  Map<String, dynamic> toJson() => {
        'user_id': user_id,
        'user_fullname': user_fullname,
        'user_email': user_email,
        'user_phone_number': user_phone_number,
        'user_address': user_address,
        'user_bank_account_number': user_bank_account_number,
        'user_bank_name': user_bank_name,
        'user_token': user_token,
      };
}
