import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  final double hours;
  final String description;
  final double price;
  final String title;
  final String specialty;

  //TODO falta data

  CourseModel({
    required this.hours,
    required this.description,
    required this.price,
    required this.title,
    required this.specialty,
  });

  CourseModel copyWith({
    double? hours,
    String? description,
    double? price,
    String? title,
    String? specialty,
  }) {
    return CourseModel(
      hours: hours ?? this.hours,
      description: description ?? this.description,
      price: price ?? this.price,
      title: title ?? this.title,
      specialty: specialty ?? this.specialty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hours': hours,
      'description': description,
      'price': price,
      'title': title,
      'specialty': specialty
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      hours: map['hours'],
      description: map['description'],
      price: map['price'],
      title: map['title'],
      specialty: map['specialty'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source));

  factory CourseModel.fromFirestore(DocumentSnapshot? doc) {
    Map map = (doc == null) ? {} : doc.data() as Map<String, dynamic>;

    return CourseModel(
      hours: map['hours'] ?? 0.0,
      description: map['description'] ?? '',
      price: map['price'] ?? 0.0,
      title: map['title'] ?? '',
      specialty: map['specialty'] ?? ''
    );
  }

  @override
  String toString() {
    return 'SpecialtyModel(hours: $hours, description: $description, price: $price, title: $title, specialty: $specialty)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseModel &&
        other.hours == hours &&
        other.description == description &&
        other.price == price &&
        other.title == title &&
        other.specialty == specialty;
  }

  @override
  int get hashCode {
    return hours.hashCode ^ description.hashCode ^ price.hashCode ^ title.hashCode ^ specialty.hashCode;
  }
  }

