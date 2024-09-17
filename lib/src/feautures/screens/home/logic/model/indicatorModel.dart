import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'indicator.model.g.dart';

IndicatorModel indicatorModelFromJson(String str) => IndicatorModel.fromJson(json.decode(str));

String indicatorModelToJson(IndicatorModel data) => json.encode(data.toJson());

@JsonSerializable()
class IndicatorModel {
    @JsonKey(name: "MESSAGES")
    Messages messages;
    @JsonKey(name: "DATA")
    Data data;
    @JsonKey(name: "STATUS")
    String status;

    IndicatorModel({
        required this.messages,
        required this.data,
        required this.status,
    });

    factory IndicatorModel.fromJson(Map<String, dynamic> json) => _$IndicatorModelFromJson(json);

    Map<String, dynamic> toJson() => _$IndicatorModelToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "page")
    int page;
    @JsonKey(name: "pages_count")
    int pagesCount;
    @JsonKey(name: "rows_count")
    int rowsCount;
    @JsonKey(name: "rows")
    List<Row> rows;

    Data({
        required this.page,
        required this.pagesCount,
        required this.rowsCount,
        required this.rows,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Row {
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "indicator_to_mo_id")
    int indicatorToMoId;
    @JsonKey(name: "parent_id")
    int parentId;
    @JsonKey(name: "order")
    int order;

    Row({
        required this.name,
        required this.indicatorToMoId,
        required this.parentId,
        required this.order,
    });

    factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);

    Map<String, dynamic> toJson() => _$RowToJson(this);
}

@JsonSerializable()
class Messages {
    @JsonKey(name: "error")
    dynamic error;
    @JsonKey(name: "warning")
    dynamic warning;
    @JsonKey(name: "info")
    dynamic info;

    Messages({
        required this.error,
        required this.warning,
        required this.info,
    });

    factory Messages.fromJson(Map<String, dynamic> json) => _$MessagesFromJson(json);

    Map<String, dynamic> toJson() => _$MessagesToJson(this);
}