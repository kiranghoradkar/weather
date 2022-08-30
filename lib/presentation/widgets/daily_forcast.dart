import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/utils/utilities.dart';
import 'package:weather/domain/entity/forecast_weather.dart';

class DailyForecast extends StatelessWidget {
  final ForeCastWeather foreCastWeather;
  final String forecastHeading;

  const DailyForecast(
      {Key? key, required this.foreCastWeather, required this.forecastHeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('DAILY FORECAST'),
        SizedBox(
          height: 120,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 2),
              scrollDirection: Axis.horizontal,
              itemCount: foreCastWeather.forecast?.foreCastDay?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Utility.formatDate(
                          '${foreCastWeather.forecast?.foreCastDay?[index].date}',
                          'yyyy-MM-dd',
                          'MMM dd')),
                      CachedNetworkImage(
                        height: 38,
                        imageUrl:
                            'https:${foreCastWeather.forecast?.foreCastDay?[index].day?.condition?.icon}',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => const Center(
                          child: Icon(Icons.image),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      SizedBox(
                        width:70,
                        child: Text(
                            '${foreCastWeather.forecast?.foreCastDay?[0].day?.condition?.text}'),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
