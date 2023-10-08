import 'package:weather_app/models/weather_models.dart';

class WeatherState{}

class InitialState extends WeatherState{}

class WeatherLoadedState extends WeatherState{
  var weatherModel;

  WeatherLoadedState(WeatherModel? weatherModel);
}

class WeatherFailureState extends WeatherState{}