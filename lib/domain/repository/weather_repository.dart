import 'package:weather/core/usecase_base/usecase_base.dart';

/// This class contains all use case
abstract class WeatherRepository {
  Future<dynamic> getForeCastWeather(Params params);
  Future<dynamic> searchLocation(Params params);
}