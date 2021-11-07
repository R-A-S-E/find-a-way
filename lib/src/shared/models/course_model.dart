import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_list/src/shared/utils/converters.dart';
import 'package:curso_list/src/shared/utils/dates.dart';

class CourseModel {
  final double hours;
  final String url;
  final double price;
  final String title;
  final DateTime? subscription;
  final String specialty;

  CourseModel({
    required this.hours,
    required this.url,
    required this.price,
    required this.title,
    this.subscription,
    required this.specialty,
  });

  CourseModel copyWith({
    double? hours,
    String? url,
    double? price,
    String? title,
    DateTime? subscription,
    String? specialty,
  }) {
    return CourseModel(
      hours: hours ?? this.hours,
      url: url ?? this.url,
      price: price ?? this.price,
      title: title ?? this.title,
      subscription: subscription ?? this.subscription,
      specialty: specialty ?? this.specialty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hours': Converters.parseDoubleToIntWithDecimals(hours),
      'url': url,
      'price': Converters.parseDoubleToIntWithDecimals(price),
      'title': title,
      'subscription':subscription,
      'specialty': specialty
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      hours: map['hours'],
      url: map['url'],
      price: map['price'],
      title: map['title'],
      subscription: DateTime(map['subscription']),
      specialty: map['specialty'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source));

  factory CourseModel.fromFirestore(DocumentSnapshot? doc) {
    Map map = (doc == null) ? {} : doc.data() as Map<String, dynamic>;

    return CourseModel(
      hours: Converters.parseMoneyFromFirebase(map['hours']),
      url: map['url'] ?? '',
      price: Converters.parseMoneyFromFirebase(map['price']),
      title: map['title'] ?? '',
      subscription: Dates.parseTimestampDateTime(map['subscription']),
      specialty: map['specialty'] ?? ''
    );
  }

  @override
  String toString() {
    return 'SpecialtyModel(hours: $hours, url: $url, price: $price, title: $title, subscription: $subscription,specialty: $specialty)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseModel &&
        other.hours == hours &&
        other.url == url &&
        other.price == price &&
        other.title == title &&
        other.subscription == subscription &&
        other.specialty == specialty;
  }

  @override
  int get hashCode {
    return hours.hashCode ^ url.hashCode ^ price.hashCode ^ title.hashCode ^ subscription.hashCode ^  specialty.hashCode;
  }
  }

