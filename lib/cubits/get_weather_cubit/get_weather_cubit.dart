import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeatherState.dart';
import 'package:weather_app/models/weather_models.dart';

import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(InitialState());

  WeatherModel? weatherModel;
  GetWeather({required String cityName}) async{
    try {
      WeatherModel? weatherModel=
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}

