import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'post_indicator_model.g.dart';

PostIndicatorModel postIndicatorModelFromJson(String str) => PostIndicatorModel.fromJson(json.decode(str));

String postIndicatorModelToJson(PostIndicatorModel data) => json.encode(data.toJson());

@JsonSerializable()
class PostIndicatorModel {
    @JsonKey(name: "MESSAGES")
    Messages messages;
    @JsonKey(name: "DATA")
    dynamic data;
    @JsonKey(name: "STATUS")
    String status;

    PostIndicatorModel({
        required this.messages,
        required this.data,
        required this.status,
    });

    factory PostIndicatorModel.fromJson(Map<String, dynamic> json) => _$PostIndicatorModelFromJson(json);

    Map<String, dynamic> toJson() => _$PostIndicatorModelToJson(this);
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