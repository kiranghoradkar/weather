abstract class UseCase<Type, Params> {
  Future<dynamic> call(Params params);
}

class Params {
  String location;
  String? aqi;
  String? alerts;
  int? days;

  Params(this.location, {this.days, this.alerts, this.aqi});
}
