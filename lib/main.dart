import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/network/network_info.dart';
import 'package:weather/data/repository/weather_repository_implementation.dart';
import 'package:weather/domain/usecases/current_weather_usecase.dart';
import 'package:weather/domain/usecases/search_location_usecase.dart';
import 'package:weather/presentation/pages/add_location_page.dart';
import 'package:weather/presentation/pages/weather_page.dart';
import 'package:weather/presentation/viewmodel/weather_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (BuildContext context) {
            var weatherRepository = WeatherRepositoryImplementation(
                NetworkInfoImpl(connectivity: Connectivity()), Dio());

            return WeatherViewModel(
                weatherUseCase: ForeCastWeatherUseCase(weatherRepository),
                searchLocationUseCase:
                    SearchLocationUseCase(weatherRepository));
          },
          child: const WeatherPage()),
    );
  }
}
