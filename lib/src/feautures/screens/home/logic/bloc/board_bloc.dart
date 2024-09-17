import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:kpi_drive/src/feautures/screens/home/logic/data/repository/repository.dart';
import 'package:meta/meta.dart';

import '../model/indicatorModel.dart';

part 'board_event.dart';
part 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  final HomeRepository homeRepository;
  BoardBloc(this.homeRepository) : super(BoardInitialState()) {
    on<BoardEvent>((event, emit) async {
      emit(IndicatorLoading());
      try {
        final indicatorData = await homeRepository.getIndicatorRequest();
        emit(IndicatorSuccess(indicatorData: indicatorData));
      } catch (e) {
        emit(IndicatorFail(message: e.toString()));
      }
    });

    on<PostIndicatorData>((event, emit) async {
      emit(PostIndicatorLoading());
      try {
        final response = await homeRepository.postIndicatorRequest(
            event.indicatorToMoId, event.fieldName, event.fieldValue);
        if (response.status == 'OK') {
          emit(PostIndicatorSuccess());
        }
      } catch (e) {
        print(e);
        emit(IndicatorFail(message: e.toString()));
      }
    });
  }
}
