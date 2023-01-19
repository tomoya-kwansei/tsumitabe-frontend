import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    int? id,
    String? email,
    DateTime? joined_date,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
