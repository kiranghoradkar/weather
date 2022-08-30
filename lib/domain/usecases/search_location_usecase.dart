import 'package:weather/core/usecase_base/usecase_base.dart';
import 'package:weather/domain/entity/forecast_weather.dart';
import 'package:weather/domain/repository/weather_repository.dart';

class SearchLocationUseCase extends UseCase<ForeCastWeather, Params> {
  final WeatherRepository weatherRepository;

  SearchLocationUseCase(this.weatherRepository);

  @override
  Future<dynamic> call(Params params) {
    return weatherRepository.searchLocation(params);
  }
}
