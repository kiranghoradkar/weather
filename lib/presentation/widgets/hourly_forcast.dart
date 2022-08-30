import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/utils/utilities.dart';
import 'package:weather/domain/entity/forecast_weather.dart';

class HourlyForeCast extends StatelessWidget {
  final ForeCastWeather foreCastWeather;
  final String forecastHeading;

  const HourlyForeCast(
      {Key? key, required this.foreCastWeather, required this.forecastHeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(forecastHeading),
        SizedBox(
          height: 120,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 4),
              scrollDirection: Axis.horizontal,
              itemCount:
                  foreCastWeather.forecast?.foreCastDay?[0].hour?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(Utility.formatDate(
                              '${foreCastWeather.forecast?.foreCastDay?[0].hour?[index].time}',
                              'yyyy-MM-dd HH:mm',
                              'hh aa')
                          .toLowerCase()),
                      CachedNetworkImage(
                        height: 38,
                        imageUrl:
                            'https:${foreCastWeather.forecast?.foreCastDay?[0].hour?[index].condition?.icon}',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => const Center(
                          child: Icon(Icons.image),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      Text(
                          '${foreCastWeather.forecast?.foreCastDay?[0].hour?[index].tempC?.ceil()}°'),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
