import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CursosModel {
  final String course;
  final String subcategoria;
  final String especialidade;

  CursosModel({
    required this.course,
    required this.subcategoria,
    required this.especialidade,
  });

  CursosModel copyWith({
    String? course,
    String? subcategoria,
    String? especialidade,
  }) {
    return CursosModel(
      course: course ?? this.course,
      subcategoria: subcategoria ?? this.subcategoria,
      especialidade: especialidade ?? this.especialidade,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'course': course,
      'subcategoria': subcategoria,
      'especialidade': especialidade
    };
  }

  factory CursosModel.fromMap(Map<String, dynamic> map) {
    return CursosModel(
      course: map['course'],
      subcategoria: map['subcategoria'],
      especialidade: map['especialidade'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CursosModel.fromJson(String source) =>
      CursosModel.fromMap(json.decode(source));

  factory CursosModel.fromFirestore(DocumentSnapshot? doc) {
    Map map = (doc == null) ? {} : doc.data() as Map<String, dynamic>;

    return CursosModel(
      course: map['course'] ?? '',
      subcategoria: map['subcategoria'] ?? '',
      especialidade: map['especialidade'] ?? '',
    );
  }

  @override
  String toString() {
    return 'CursosModel(course: $course, subcategoria: $subcategoria, especialidade: $especialidade)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CursosModel &&
        other.course == course &&
        other.subcategoria == subcategoria &&
        other.especialidade == especialidade;
  }

  @override
  int get hashCode {
    return course.hashCode ^ subcategoria.hashCode ^ especialidade.hashCode;
  }
}
