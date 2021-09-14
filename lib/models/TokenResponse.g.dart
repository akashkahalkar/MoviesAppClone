// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TokenResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) {
  return TokenResponse(
    json['status'] as String,
    json['code'] as int,
    json['message'],
    TokenResponseData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

TokenResponseData _$TokenResponseDataFromJson(Map<String, dynamic> json) {
  return TokenResponseData(
    json['base_url'] as String,
    json['status'] as int,
    json['is_alternate'] as int,
    json['is_alternate_back'] as int,
    json['splash_image'] as String,
  );
}

Map<String, dynamic> _$TokenResponseDataToJson(TokenResponseData instance) =>
    <String, dynamic>{
      'base_url': instance.baseUrl,
      'status': instance.status,
      'is_alternate': instance.isAlternate,
      'is_alternate_back': instance.isAlternateBack,
      'splash_image': instance.splashImage,
    };
