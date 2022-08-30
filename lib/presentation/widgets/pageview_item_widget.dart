import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather/domain/entity/forecast_weather.dart';
import 'package:weather/presentation/widgets/daily_forcast.dart';
import 'package:weather/presentation/widgets/hourly_forcast.dart';

/// This class is for single Page view where we are showing single added location
class PageViewItemWidget extends StatelessWidget {
  final ForeCastWeather? foreCastWeather;

  const PageViewItemWidget(
      {Key? key, this.foreCastWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foreCastWeather?.location?.name ?? '',
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
              ),
              Text(
                foreCastWeather?.location?.country ?? '',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${foreCastWeather?.current?.tempC?.ceil()}°',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 90, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          '${foreCastWeather?.current?.condition?.text}',
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        'https:${foreCastWeather?.current?.condition?.icon ?? ""}',
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        const Center(
                      child: Icon(Icons.image),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              HourlyForeCast(
                foreCastWeather: foreCastWeather!,
                forecastHeading: 'HOURLY FORECAST',
              ),
              const SizedBox(
                height: 40,
              ),
              DailyForecast(
                forecastHeading: 'DAILY FORECAST',
                foreCastWeather: foreCastWeather!,
              ),
            ]),
      ),
    );
  }
}
