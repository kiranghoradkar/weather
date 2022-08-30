import 'package:dio/dio.dart';
import 'package:weather/core/error/failures_error.dart';
import 'package:weather/core/network/network_info.dart';
import 'package:weather/core/usecase_base/usecase_base.dart';
import 'package:weather/core/utils/constants.dart';
import 'package:weather/domain/entity/forecast_weather.dart';
import 'package:weather/domain/entity/location.dart';
import 'package:weather/domain/repository/weather_repository.dart';

/// In this class we are overriding method which are present in repository and implementing methods
/// which are present in WeatherRepository class
class WeatherRepositoryImplementation implements WeatherRepository {
  final NetworkInfo networkInfo;
  final Dio dio;

  WeatherRepositoryImplementation(this.networkInfo, this.dio);

  @override
  Future<dynamic> getForeCastWeather(Params params) async {
    if (await networkInfo.isConnected) {
      final response = await dio.get(StringConstant.forecast, queryParameters: {
        'q': params.location,
        'days': params.days,
        'aqi': params.aqi,
        'alerts': params.alerts,
        'key': StringConstant.apiKey
      });

      if (response.statusCode == 200) {
        return ForeCastWeather.fromJson(response.data);
      } else {
        throw ServerFailure(message: 'Server Error');
      }
    } else {
      throw NoInternet(message: 'No Internet Connection');
    }
  }

  @override
  Future<dynamic> searchLocation(Params params) async {
    if (await networkInfo.isConnected) {
      final response = await dio.get(StringConstant.search, queryParameters: {
        'q': params.location,
        'key': StringConstant.apiKey
      });

      if (response.statusCode == 200) {
        var list = response.data as List;
        return list.map((e) => Location.fromJson(e)).toList();
      } else {
        throw ServerFailure(message: 'Server Error');
      }
    } else {
      throw NoInternet(message: 'No Internet Connection');
    }
  }
}
