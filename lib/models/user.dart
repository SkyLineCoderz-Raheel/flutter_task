class User{
  String id,name,email,password,birthGender,phoneNumber,imageUrl,notificationToken;
  int dob,timeStamp;

//<editor-fold desc="Data Methods">
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.birthGender,
    required this.phoneNumber,
    required this.imageUrl,
    required this.notificationToken,
    required this.dob,
    required this.timeStamp,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          password == other.password &&
          birthGender == other.birthGender &&
          phoneNumber == other.phoneNumber &&
          imageUrl == other.imageUrl &&
          notificationToken == other.notificationToken &&
          dob == other.dob &&
          timeStamp == other.timeStamp);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      birthGender.hashCode ^
      phoneNumber.hashCode ^
      imageUrl.hashCode ^
      notificationToken.hashCode ^
      dob.hashCode ^
      timeStamp.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' id: $id,' +
        ' name: $name,' +
        ' email: $email,' +
        ' password: $password,' +
        ' birthGender: $birthGender,' +
        ' phoneNumber: $phoneNumber,' +
        ' imageUrl: $imageUrl,' +
        ' notificationToken: $notificationToken,' +
        ' dob: $dob,' +
        ' timeStamp: $timeStamp,' +
        '}';
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? birthGender,
    String? phoneNumber,
    String? imageUrl,
    String? notificationToken,
    int? dob,
    int? timeStamp,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      birthGender: birthGender ?? this.birthGender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imageUrl: imageUrl ?? this.imageUrl,
      notificationToken: notificationToken ?? this.notificationToken,
      dob: dob ?? this.dob,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'password': this.password,
      'birthGender': this.birthGender,
      'phoneNumber': this.phoneNumber,
      'imageUrl': this.imageUrl,
      'notificationToken': this.notificationToken,
      'dob': this.dob,
      'timeStamp': this.timeStamp,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      birthGender: map['birthGender'] as String,
      phoneNumber: map['phoneNumber'] as String,
      imageUrl: map['imageUrl'] as String,
      notificationToken: map['notificationToken'] as String,
      dob: map['dob'] as int,
      timeStamp: map['timeStamp'] as int,
    );
  }

//</editor-fold>
}