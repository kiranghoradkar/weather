import 'package:weather/core/usecase_base/usecase_base.dart';
import 'package:weather/domain/entity/forecast_weather.dart';
import 'package:weather/domain/repository/weather_repository.dart';

class ForeCastWeatherUseCase extends UseCase<ForeCastWeather, Params> {
  final WeatherRepository weatherRepository;

  ForeCastWeatherUseCase(this.weatherRepository);

  @override
  Future<dynamic> call(Params params) {
    return weatherRepository.getForeCastWeather(params);
  }
}
