import 'package:weather/domain/entity/forecast_weather.dart';

class Location {
  Location({
      this.id, 
      this.name, 
      this.region, 
      this.country, 
      this.lat, 
      this.lon, 
      this.url,});

  Location.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    url = json['url'];
  }
  int? id;
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? url;
  ForeCastWeather? foreCast;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['region'] = region;
    map['country'] = country;
    map['lat'] = lat;
    map['lon'] = lon;
    map['url'] = url;
    return map;
  }

}