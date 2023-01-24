import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'authorization_token.freezed.dart';
part 'authorization_token.g.dart';

@freezed
class AuthorizationToken with _$AuthorizationToken {
  factory AuthorizationToken({
    @Default("") @JsonKey(name: 'token') String token,
  }) = _AuthorizationToken;

  factory AuthorizationToken.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationTokenFromJson(json);
}
