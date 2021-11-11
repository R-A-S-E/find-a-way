import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_list/src/shared/utils/dates.dart';

class UserModel {
  final String? uuid;
  final String cpf;
  final String name;
  final String phone;
  final List? specialty;
  final DateTime? createAt;
  final DateTime? updateAt;

  UserModel({
    this.uuid,
    required this.cpf,
    required this.name,
    required this.phone,
    this.specialty,
    this.createAt,
    this.updateAt,
  });

  UserModel copyWith({
    String? uuid,
    String? cpf,
    String? name,
    String? phone,
    List? specialty,
    DateTime? createAt,
    DateTime? updateAt,
  }) {
    return UserModel(
      uuid: uuid ?? this.uuid,
      cpf: cpf ?? this.cpf,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      specialty: specialty ?? this.specialty,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'cpf': cpf,
      'name': name,
      'phone': phone,
      'specialty': specialty,
      'createAt': createAt?.millisecondsSinceEpoch,
      'updateAt': updateAt?.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uuid: map['uuid'],
      cpf: map['cpf'],
      name: map['name'],
      phone: map['phone'],
      specialty: map['specialty'],
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt']),
      updateAt: DateTime.fromMillisecondsSinceEpoch(map['updateAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  factory UserModel.fromFirestore(DocumentSnapshot? doc) {
    Map map = (doc == null) ? {} : doc.data() as Map<String, dynamic>;

    return UserModel(
      uuid: map['uuid'] ?? '',
      cpf: map['cpf'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      specialty: map['specialty'] ?? [],
      createAt: Dates.parseTimestampDateTime(map['createAt']),
      updateAt: Dates.parseTimestampDateTime(map['updateAt']),
    );
  }

  @override
  String toString() {
    return 'UserModel(uuid: $uuid, cpf: $cpf, name: $name, phone: $phone, specialty: $specialty,   createAt: $createAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.uuid == uuid &&
        other.cpf == cpf &&
        other.name == name &&
        other.phone == phone &&
        other.specialty == specialty &&
        other.createAt == createAt &&
        other.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        cpf.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        specialty.hashCode ^
        createAt.hashCode ^
        updateAt.hashCode;
  }
}
