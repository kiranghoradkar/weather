import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/usecase_base/usecase_base.dart';
import 'package:weather/presentation/viewmodel/weather_viewmodel.dart';

class AddLocationPage extends StatelessWidget {
  const AddLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherViewModel>(
      builder: (BuildContext context, weatherViewModel, Widget? child) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size(
                400,
                100,
              ),
              child: SafeArea(
                child: TextFormField(
                  onChanged: (String value) {
                    weatherViewModel.getLocation(Params(value));
                  },
                  decoration: InputDecoration(
                      hintText: 'Search location',
                      prefixIcon: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      )),
                ),
              )),
          body: ListView.builder(
              itemCount: weatherViewModel.searchedLocationList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      weatherViewModel.searchedLocationList[index].name ?? ''),
                  onTap: () {
                    Navigator.pop(
                        context, weatherViewModel.searchedLocationList[index]);
                  },
                );
              }),
        );
      },
    );
  }
}
