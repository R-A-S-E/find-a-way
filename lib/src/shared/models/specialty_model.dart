import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SpecialtyModel {
  final String category;
  final String subcategory;
  final String specialty;

  SpecialtyModel({
    required this.category,
    required this.subcategory,
    required this.specialty,
  });

  SpecialtyModel copyWith({
    String? category,
    String? subcategory,
    String? specialty,
  }) {
    return SpecialtyModel(
      category: category ?? this.category,
      subcategory: subcategory ?? this.subcategory,
      specialty: specialty ?? this.specialty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'subcategory': subcategory,
      'specialty': specialty
    };
  }

  factory SpecialtyModel.fromMap(Map<String, dynamic> map) {
    return SpecialtyModel(
      category: map['category'],
      subcategory: map['subcategory'],
      specialty: map['specialty'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialtyModel.fromJson(String source) =>
      SpecialtyModel.fromMap(json.decode(source));

  factory SpecialtyModel.fromFirestore(DocumentSnapshot? doc) {
    Map map = (doc == null) ? {} : doc.data() as Map<String, dynamic>;

    return SpecialtyModel(
      category: map['category'] ?? '',
      subcategory: map['subcategory'] ?? '',
      specialty: map['specialty'] ?? '',
    );
  }

  @override
  String toString() {
    return 'SpecialtyModel(category: $category, subcategory: $subcategory, specialty: $specialty)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpecialtyModel &&
        other.category == category &&
        other.subcategory == subcategory &&
        other.specialty == specialty;
  }

  @override
  int get hashCode {
    return category.hashCode ^ subcategory.hashCode ^ specialty.hashCode;
  }
}
