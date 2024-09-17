part of 'board_bloc.dart';

class BoardState {}

class BoardInitialState extends BoardState {}

//Get indicator
class IndicatorLoading extends BoardState {}

class IndicatorSuccess extends BoardState {
  final List<IndicatorModel> indicatorData;

  IndicatorSuccess({required this.indicatorData});
}

class IndicatorFail extends BoardState {
  final String message;
  IndicatorFail({required this.message});
}

//Post indicator
class PostIndicatorLoading extends BoardState {}

class PostIndicatorSuccess extends BoardState {}

class PostIndicatorFail extends BoardState {
  String message;

  PostIndicatorFail({required this.message});
}
