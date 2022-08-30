import 'package:flutter/material.dart';
import 'package:weather/core/error/failures_error.dart';
import 'package:weather/core/usecase_base/usecase_base.dart';
import 'package:weather/domain/entity/forecast_weather.dart';
import 'package:weather/domain/entity/location.dart';
import 'package:weather/domain/usecases/current_weather_usecase.dart';
import 'package:weather/domain/usecases/search_location_usecase.dart';

class WeatherViewModel extends ChangeNotifier {
  // Location list
  List<Location> locationList = [];
  List<Location> searchedLocationList = [];

  // Use cases
  final ForeCastWeatherUseCase weatherUseCase;
  final SearchLocationUseCase searchLocationUseCase;

  WeatherViewModel(
      {required this.searchLocationUseCase, required this.weatherUseCase});

  void getForeCastWeather(Params params) async {
    try {
      ForeCastWeather foreCastWeather = await weatherUseCase(params);
      // get index of location
      int indexOfLocation =
          locationList.indexWhere((element) => element.name == params.location);
      // set weather data to selected/added location
      locationList[indexOfLocation].foreCast = foreCastWeather;
    } on ServerFailure catch (error) {
      debugPrint(error.toString());
    } on NoInternet catch (error) {
      debugPrint(error.toString());
    } catch (error) {
      debugPrint(error.toString());
    }
    notifyListeners();
  }

  void getLocation(Params params) async {
    try {
      searchedLocationList = await searchLocationUseCase(params);
    } on ServerFailure catch (error) {
      debugPrint(error.toString());
    } on NoInternet catch (error) {
      debugPrint(error.toString());
    } catch (error) {
      debugPrint(error.toString());
    }
    notifyListeners();
  }
}
