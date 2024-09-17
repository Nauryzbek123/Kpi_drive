// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indicatorModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndicatorModel _$IndicatorModelFromJson(Map<String, dynamic> json) =>
    IndicatorModel(
      messages: Messages.fromJson(json['MESSAGES'] as Map<String, dynamic>),
      data: Data.fromJson(json['DATA'] as Map<String, dynamic>),
      status: json['STATUS'] as String,
    );

Map<String, dynamic> _$IndicatorModelToJson(IndicatorModel instance) =>
    <String, dynamic>{
      'MESSAGES': instance.messages,
      'DATA': instance.data,
      'STATUS': instance.status,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      page: (json['page'] as num).toInt(),
      pagesCount: (json['pages_count'] as num).toInt(),
      rowsCount: (json['rows_count'] as num).toInt(),
      rows: (json['rows'] as List<dynamic>)
          .map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'page': instance.page,
      'pages_count': instance.pagesCount,
      'rows_count': instance.rowsCount,
      'rows': instance.rows,
    };

Row _$RowFromJson(Map<String, dynamic> json) => Row(
      name: json['name'] as String,
      indicatorToMoId: (json['indicator_to_mo_id'] as num).toInt(),
      parentId: (json['parent_id'] as num).toInt(),
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$RowToJson(Row instance) => <String, dynamic>{
      'name': instance.name,
      'indicator_to_mo_id': instance.indicatorToMoId,
      'parent_id': instance.parentId,
      'order': instance.order,
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
