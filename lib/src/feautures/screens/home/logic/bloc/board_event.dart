part of 'board_bloc.dart';

class BoardEvent {}

//get indicator
class IndicatorData extends BoardEvent {}

class PostIndicatorData extends BoardEvent {
  String indicatorToMoId;
  String fieldName;
  String fieldValue;

  PostIndicatorData(
      {required this.indicatorToMoId,
      required this.fieldName,
      required this.fieldValue});
}
