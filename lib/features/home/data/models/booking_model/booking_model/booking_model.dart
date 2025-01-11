import 'package:airbnb_clone_app/features/home/data/models/user_model/user_model.dart';

import 'property.dart';

class BookingModel {
  int? id;
  int? userId;
  int? propertyId;
  String? startDate;
  String? endDate;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserModel? user;
  Property? property;

  BookingModel({
    this.id,
    this.userId,
    this.propertyId,
    this.startDate,
    this.endDate,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.property,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        propertyId: json['property_id'] as int?,
        startDate: json['start_date'] as String?,
        endDate: json['end_date'] as String?,
        status: json['status'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        user: json['user'] == null
            ? null
            : UserModel.fromJson(json['user'] as Map<String, dynamic>),
        property: json['property'] == null
            ? null
            : Property.fromJson(json['property'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'property_id': propertyId,
        'start_date': startDate,
        'end_date': endDate,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
        'property': property?.toJson(),
      };
}
