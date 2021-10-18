import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CoursesModel {
  final String category;
  final String subcategory;
  final String specialty;

  CoursesModel({
    required this.category,
    required this.subcategory,
    required this.specialty,
  });

  CoursesModel copyWith({
    String? category,
    String? subcategory,
    String? specialty,
  }) {
    return CoursesModel(
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

  factory CoursesModel.fromMap(Map<String, dynamic> map) {
    return CoursesModel(
      category: map['category'],
      subcategory: map['subcategory'],
      specialty: map['specialty'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CoursesModel.fromJson(String source) =>
      CoursesModel.fromMap(json.decode(source));

  factory CoursesModel.fromFirestore(DocumentSnapshot? doc) {
    Map map = (doc == null) ? {} : doc.data() as Map<String, dynamic>;

    return CoursesModel(
      category: map['category'] ?? '',
      subcategory: map['subcategory'] ?? '',
      specialty: map['specialty'] ?? '',
    );
  }

  @override
  String toString() {
    return 'CoursesModel(category: $category, subcategory: $subcategory, specialty: $specialty)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoursesModel &&
        other.category == category &&
        other.subcategory == subcategory &&
        other.specialty == specialty;
  }

  @override
  int get hashCode {
    return category.hashCode ^ subcategory.hashCode ^ specialty.hashCode;
  }
}
