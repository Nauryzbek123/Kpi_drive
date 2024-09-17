// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_indicator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostIndicatorModel _$PostIndicatorModelFromJson(Map<String, dynamic> json) =>
    PostIndicatorModel(
      messages: Messages.fromJson(json['MESSAGES'] as Map<String, dynamic>),
      data: json['DATA'],
      status: json['STATUS'] as String,
    );

Map<String, dynamic> _$PostIndicatorModelToJson(PostIndicatorModel instance) =>
    <String, dynamic>{
      'MESSAGES': instance.messages,
      'DATA': instance.data,
      'STATUS': instance.status,
    };

Messages _$MessagesFromJson(Map<String, dynamic> json) => Messages(
      error: json['error'],
      warning: json['warning'],
      info: json['info'],
    );

Map<String, dynamic> _$MessagesToJson(Messages instance) => <String, dynamic>{
      'error': instance.error,
      'warning': instance.warning,
      'info': instance.info,
    };
