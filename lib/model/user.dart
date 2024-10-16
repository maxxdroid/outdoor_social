class LocalUser {
  String fullName;
  String? email;
  String? imageUrl;
  String? biography;
  String? username;
  String role;
  String userID;
  bool verified;
  String? dob;
  String? status;
  String? phoneNumber;

  LocalUser(
      {required this.fullName,
        required this.role,
        this.biography,
        this.imageUrl,
        this.username,
        this.dob,
        this.phoneNumber,
        this.status,
        required this.verified,
        required this.userID,
        this.email});

  factory LocalUser.fromJson(Map<String, dynamic> json) {
    return LocalUser(
        fullName: json['fullName'],
        email: json['email'],
        verified: json['verified'],
        username: json['username'],
        imageUrl: json['imageUrl'],
        phoneNumber: json['phoneNumber'],
        status: json['status'],
        dob: json['dob'],
        biography: json['biography'],
        userID: json['userID'],
        role: json['role']);
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'role': role,
      'username' : username,
      'biography': biography,
      'phoneNumber' : phoneNumber,
      'status' : status,
      'verified' : verified,
      'dob' : dob,
      'imageUrl': imageUrl,
      'userID' : userID
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocalUser &&
        other.fullName == fullName &&
        other.email == email &&
        other.imageUrl == imageUrl &&
        other.verified == verified &&
        other.username == username &&
        other.status == status &&
        other.phoneNumber == phoneNumber &&
        other.role == role &&
        other.dob == dob &&
        other.biography == biography &&
        other.userID == userID;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
    email.hashCode ^
    imageUrl.hashCode ^
    role.hashCode ^
    dob.hashCode ^
    status.hashCode ^
    phoneNumber.hashCode ^
    username.hashCode ^
    verified.hashCode ^
    biography.hashCode ^
    userID.hashCode;
  }
}
