class LocalUser {
  String name;
  String? email;
  String? imageUrl;
  String? biography;
  String role;
  String userID;
  bool verified;
  String? dob;
  String? status;

  LocalUser(
      {required this.name,
        required this.role,
        this.biography,
        this.imageUrl,
        this.dob,
        this.status,
        required this.verified,
        required this.userID,
        this.email});

  factory LocalUser.fromJson(Map<String, dynamic> json) {
    return LocalUser(
        name: json['name'],
        email: json['email'],
        verified: json['verified'],
        imageUrl: json['imageUrl'],
        dob: json['dob'],
        biography: json['biography'],
        userID: json['userID'],
        role: json['role']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'biography': biography,
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
        other.name == name &&
        other.email == email &&
        other.imageUrl == imageUrl &&
        other.verified == verified &&
        other.role == role &&
        other.dob == dob &&
        other.biography == biography &&
        other.userID == userID;
  }

  @override
  int get hashCode {
    return name.hashCode ^
    email.hashCode ^
    imageUrl.hashCode ^
    role.hashCode ^
    dob.hashCode ^
    verified.hashCode ^
    biography.hashCode ^
    userID.hashCode;
  }
}
