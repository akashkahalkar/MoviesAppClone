import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
part 'TokenResponse.g.dart';

@JsonSerializable()
class TokenResponse {
  String status;
  int code;
  dynamic message;
  TokenResponseData data;

  TokenResponse(this.status, this.code, this.message, this.data);

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}

@JsonSerializable()
class TokenResponseData {
  @JsonKey(name: 'base_url')
  String baseUrl;
  int status;
  @JsonKey(name: 'is_alternate')
  int isAlternate;
  @JsonKey(name: 'is_alternate_back')
  int isAlternateBack;
  @JsonKey(name: 'splash_image')
  String splashImage;

  TokenResponseData(this.baseUrl, this.status, this.isAlternate,
      this.isAlternateBack, this.splashImage);

  factory TokenResponseData.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$TokenResponseDataToJson(this);
}
