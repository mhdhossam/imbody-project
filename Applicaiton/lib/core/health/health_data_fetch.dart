import 'dart:convert';
import 'package:fitgenie/core/health/health_data_model_steps.dart';
import 'package:http/http.dart' as http;

import 'health_data_model_calories.dart';
import 'health_data_model_heart_rate.dart';

//https://v1.nocodeapi.com/eslam301/fit/SVQNlnCWypkvPBKO/aggregatesDatasets?dataTypeName=steps_count&timePeriod=today
class HealthApiConstants {
  static const String baseUrl = 'v1.nocodeapi.com';
  static const String user = 'eslam301';
  static const String dataType = 'fit';
  static const String apiKey = 'SVQNlnCWypkvPBKO';
  static const String endpoint = 'aggregatesDatasets';
}

class HealthDataFetch {
  static Future<HealthDataModelSteps> fetchHealthDataSteps({
    required String timePeriod,
    required String dataTypeName,
  }) async {
    final Map<String, String> queryParameters = {
      'dataTypeName': dataTypeName,
      'timePeriod': timePeriod,
    };

    final Uri uri = Uri.https(
        HealthApiConstants.baseUrl,
        '${HealthApiConstants.user}/${HealthApiConstants.dataType}/${HealthApiConstants.apiKey}/${HealthApiConstants.endpoint}',
        queryParameters);
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return HealthDataModelSteps.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }

//https://v1.nocodeapi.com/eslam301/fit/SVQNlnCWypkvPBKO/aggregatesDatasets?dataTypeName=calories_expended&timePeriod=today
  static Future<HealthDataModelCalories> fetchHealthDataCalories({
    required String timePeriod,
    required String dataTypeName,
  }) async {
    final Map<String, String> queryParameters = {
      'dataTypeName': dataTypeName,
      'timePeriod': timePeriod,
    };

    final Uri uri = Uri.https(
        HealthApiConstants.baseUrl,
        '${HealthApiConstants.user}/${HealthApiConstants.dataType}/${HealthApiConstants.apiKey}/${HealthApiConstants.endpoint}',
        queryParameters);

    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return HealthDataModelCalories.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }

  //https://v1.nocodeapi.com/eslam301/fit/SVQNlnCWypkvPBKO/aggregatesDatasets?dataTypeName=heart_minutes&timePeriod=30days
  static Future<HealthDataModelHeartRate> fetchHealthDataHeartRate({
    required String timePeriod,
  }) async {
    final Map<String, String> queryParameters = {
      'dataTypeName': 'heart_minutes',
      'timePeriod': timePeriod,
    };

    final Uri uri = Uri.https(
      HealthApiConstants.baseUrl,
      '${HealthApiConstants.user}/${HealthApiConstants.dataType}/${HealthApiConstants.apiKey}/${HealthApiConstants.endpoint}',
      queryParameters,
    );
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return HealthDataModelHeartRate.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }
}
