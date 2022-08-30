import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/usecase_base/usecase_base.dart';
import 'package:weather/domain/entity/location.dart';
import 'package:weather/presentation/pages/add_location_page.dart';
import 'package:weather/presentation/viewmodel/weather_viewmodel.dart';
import 'package:weather/presentation/widgets/pageview_item_widget.dart';

/// This class is for to show the added locations
class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    WeatherViewModel weatherViewModel = context.read<WeatherViewModel>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Weather Reports",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  navigateToAddLocation(weatherViewModel);
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ))
          ],
        ),
        body: Consumer<WeatherViewModel>(
          builder: (BuildContext context, weatherViewModel, Widget? child) {
            if (weatherViewModel.locationList.isEmpty) {
              return const Center(
                child: Text("No location found please add location"),
              );
            }
            return PageView.builder(
                itemCount: weatherViewModel.locationList.length,
                itemBuilder: (context, index) {
                  return PageViewItemWidget(
                    foreCastWeather:
                        weatherViewModel.locationList[index].foreCast,
                  );
                });
          },
        ));
  }

  void navigateToAddLocation(weatherViewModel) async {
    Location? selected = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<WeatherViewModel>.value(
              value: weatherViewModel, child: const AddLocationPage())),
    );
    if (selected != null) {
      if (!weatherViewModel.locationList
          .any((element) => element.name == selected.name)) {
        weatherViewModel.locationList.add(selected);

      }
      weatherViewModel.getForeCastWeather(
          Params(selected.name!, days: 7, alerts: 'no', aqi: 'no'));
    }
  }
}
