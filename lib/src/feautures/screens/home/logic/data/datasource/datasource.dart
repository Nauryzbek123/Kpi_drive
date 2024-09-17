import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:kpi_drive/src/core/resources/bearer_token.dart';

abstract class HomeDataSource {
  Future<Response> getIndicators();
  Future<Response> postIndicators(String indicatorToMoId,String fieldName,String fieldValue);
}

class HomeDataSourceImpl implements HomeDataSource {
  Dio dio = Dio();
  final token = BEARER_TOKEN;

  @override
  Future<Response> getIndicators() async {
    final response = await dio.get(
        'https://development.kpi-drive.ru/_api/indicators/get_mo_indicators',
        options: Options(headers: {
          'Authorization': 'Bearer ${token}',
        }),
        queryParameters: {
          'period_start': '2024-06-01',
          'period_end': '2024-06-30',
          'period_key': 'month',
          'requested_mo_id': '478',
          'behaviour_key': 'task,kpi_task',
          'with_result': 'false',
          'response_fields': 'name,indicator_to_mo_id,parent_id,order',
          'auth_user_id': '2'
        });
    return response;
  }

  @override
  Future<Response> postIndicators(String indicatorToMoId, String fieldName,String fieldValue) async {
    final response = await dio.post(
        'https://development.kpi-drive.ru/_api/indicators/save_indicator_instance_field',
        options: Options(headers: {
          'Authorization': 'Bearer ${token}',
        }),
        queryParameters: {
          'period_start': '2024-07-01',
          'period_end': '2024-07-31',
          'period_key': 'month',
          'indicator_to_mo_id':indicatorToMoId,
          'field_name': fieldName,
          'field_value':fieldValue,
          'auth_user_id': '2'
        });
    return response;
  }
}
