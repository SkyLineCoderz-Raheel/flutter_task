class FamilyMember{
  String id,userId,name,relation,phoneNumber,birthGender,imageUrl;
  int timeStamp,dob;

//<editor-fold desc="Data Methods">
  FamilyMember({
    required this.id,
    required this.userId,
    required this.name,
    required this.relation,
    required this.phoneNumber,
    required this.birthGender,
    required this.imageUrl,
    required this.timeStamp,
    required this.dob,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FamilyMember &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          name == other.name &&
          relation == other.relation &&
          phoneNumber == other.phoneNumber &&
          birthGender == other.birthGender &&
          imageUrl == other.imageUrl &&
          timeStamp == other.timeStamp &&
          dob == other.dob);

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      name.hashCode ^
      relation.hashCode ^
      phoneNumber.hashCode ^
      birthGender.hashCode ^
      imageUrl.hashCode ^
      timeStamp.hashCode ^
      dob.hashCode;

  @override
  String toString() {
    return 'FamilyMember{' +
        ' id: $id,' +
        ' userId: $userId,' +
        ' name: $name,' +
        ' relation: $relation,' +
        ' phoneNumber: $phoneNumber,' +
        ' birthGender: $birthGender,' +
        ' imageUrl: $imageUrl,' +
        ' timeStamp: $timeStamp,' +
        ' dob: $dob,' +
        '}';
  }

  FamilyMember copyWith({
    String? id,
    String? userId,
    String? name,
    String? relation,
    String? phoneNumber,
    String? birthGender,
    String? imageUrl,
    int? timeStamp,
    int? dob,
  }) {
    return FamilyMember(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      relation: relation ?? this.relation,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthGender: birthGender ?? this.birthGender,
      imageUrl: imageUrl ?? this.imageUrl,
      timeStamp: timeStamp ?? this.timeStamp,
      dob: dob ?? this.dob,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'userId': this.userId,
      'name': this.name,
      'relation': this.relation,
      'phoneNumber': this.phoneNumber,
      'birthGender': this.birthGender,
      'imageUrl': this.imageUrl,
      'timeStamp': this.timeStamp,
      'dob': this.dob,
    };
  }

  factory FamilyMember.fromMap(Map<String, dynamic> map) {
    return FamilyMember(
      id: map['id'] as String,
      userId: map['userId'] as String,
      name: map['name'] as String,
      relation: map['relation'] as String,
      phoneNumber: map['phoneNumber'] as String,
      birthGender: map['birthGender'] as String,
      imageUrl: map['imageUrl'] as String,
      timeStamp: map['timeStamp'] as int,
      dob: map['dob'] as int,
    );
  }

//</editor-fold>
}