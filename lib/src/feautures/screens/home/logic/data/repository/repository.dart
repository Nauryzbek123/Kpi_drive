import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kpi_drive/src/feautures/screens/home/logic/data/datasource/datasource.dart';
import 'package:kpi_drive/src/feautures/screens/home/logic/model/post_indicator_model.dart';

import '../../model/indicatorModel.dart';

abstract class HomeRepository {
  Future<List<IndicatorModel>> getIndicatorRequest();
  Future<PostIndicatorModel> postIndicatorRequest(
      String indicatorToMoId, String fieldName, String fieldValue);
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl(this.homeDataSource);

  @override
  Future<List<IndicatorModel>> getIndicatorRequest() async {
    print('fdfdfd');
    Response response = await homeDataSource.getIndicators();
    final Map<String, dynamic> responseData = response.data;
    final IndicatorModel indicator = IndicatorModel.fromJson(responseData);

    return [indicator];
  }

  @override
  Future<PostIndicatorModel> postIndicatorRequest(
      String indicatorToMoId, String fieldName, String fieldValue) async {
    Response response = await homeDataSource.postIndicators(
        indicatorToMoId, fieldName, fieldValue);
    final Map<String, dynamic> data = response.data;
    final PostIndicatorModel postIndicatorModel = PostIndicatorModel.fromJson(data);
    return postIndicatorModel;
  }
}
